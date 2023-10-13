# Jenkins SSH agent image with docker-cli binary added

[![GitHub License](https://img.shields.io/github/license/thorpejosh/ssh-agent-docker)](https://github.com/ThorpeJosh/ssh-agent-docker/blob/main/LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/thorpejosh/ssh-agent-docker)](https://github.com/thorpejosh/ssh-agent-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/thorpejosh/ssh-agent-docker)](https://hub.docker.com/r/thorpejosh/ssh-agent-docker)
![Docker Pulls](https://img.shields.io/badge/architecture-amd64-blue)
![Docker Pulls](https://img.shields.io/badge/architecture-arm64-blue)


Simply the official [Jenkins SSH agent](https://hub.docker.com/r/jenkins/ssh-agent) with the docker cli binary from the official [docker image](https://hub.docker.com/_/docker) baked into it.

## Why?
This allows the Jenkins SSH agent (running in a container) to execute docker commands, enabling [docker pipelines](https://www.jenkins.io/doc/book/pipeline/docker/) to be executed on the agent.

## Image variants
### Shared tags
* `latest`, `${IMAGE_VERSION}`

This image will follow the [jenkins/ssh-agent](https://hub.docker.com/r/jenkins/ssh-agent)  `${IMAGE_VERSION}` tag. `${IMAGE_VERSION}` is a [semver](https://semver.org/) tagging that follows the same train as `latest` and is currently based on debian-bookworm and jdk11.

When semver releases are published they will also be tagged `latest` which is one-to-one with `jenkins/ssh-agent:latest`

| ThorpeJosh image with docker binary          | Jenkins image it is based on |
|----------------------------------------------|------------------------------|
| `thorpejosh/ssh-agent-docker:latest`         | `jenkins/ssh-agent:latest`   |
| `thorpejosh/ssh-agent-docker:5.16.0`         | `jenkins/ssh-agent:5.16.0`   |

### Registries
The image is published on both [docker.io](https://hub.docker.com/r/thorpejosh/ssh-agent-docker) and [ghcr.io](https://github.com/ThorpeJosh/ssh-agent-docker/pkgs/container/ssh-agent-docker)

### Architectures
Both `amd64` and `arm64` images are available in each release manifest.

## How to use this image
### Recommendations
* Run this image on a rootless docker/podman install since the agent needs POST access to the docker socket.
* Use a docker socket proxy instead of bind mounting the socket into the agent container.

See [jenkins/ssh-agent](https://hub.docker.com/r/jenkins/ssh-agent) for more details on how to use container.

Example compose file showing the rootless docker socket mounted:
```yaml
---

volumes:
  jenkins_agent_home:
    external: true

services:
  jenkins-ssh-agent:
    image: thorpejosh/ssh-agent-docker:latest  # Recommend using semver tag instead of `latest`
    container_name: jenkins-ssh-agent
    environment:
      - JENKINS_AGENT_SSH_PUBKEY=<ssh public key>
    volumes:
      - jenkins_agent_home:/home/jenkins
      # Mount rootless docker socket, but recommend using a docker socket proxy instead
      - /run/user/1000/docker.sock:/var/run/docker.sock
    ports:
      - 2222:22
    cgroup: host
    restart: unless-stopped
```
