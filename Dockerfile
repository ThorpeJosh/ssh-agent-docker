FROM jenkins/ssh-agent:5.21.0@sha256:503ad68d41941a4f621aa639074ded699d17c29bdbbfa3122c6f7c9cb8bfae4c
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:a2a608408fa15d6694543a7308c2bfd1a7ea90a0e4ca989d0471ca7b8348fabb /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
