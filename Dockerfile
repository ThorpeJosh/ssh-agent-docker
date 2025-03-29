FROM jenkins/ssh-agent:6.11.1@sha256:2e9558a6f0ae90b4fc15f44e8f201e9e369dca783f696db3bc6b3dc2ba4fc06a
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.1-cli@sha256:79bf825c5bed0d579820cc19f6857738abc424a680b619171591e969114f2015 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
