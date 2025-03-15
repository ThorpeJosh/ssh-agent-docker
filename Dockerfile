FROM jenkins/ssh-agent:6.10.0@sha256:a601066474866d662a7a337cbf877a5a1920a5c637d50e358f6d8f975555b99a
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.1-cli@sha256:18018c4b6e75bab6b93e04159c83778c98b60b0f95c762967bb501d684553daf /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
