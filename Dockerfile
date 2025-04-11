FROM jenkins/ssh-agent:6.12.0@sha256:6674228bec1f4af438f48510f2433e087956d69a4483f650ec58b32ae1cb908d
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:c5e0b27a15f49b571f968defe19cc9a072d531ee90300ba5a1d2ea4dffa760e4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
