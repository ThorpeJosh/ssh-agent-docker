FROM jenkins/ssh-agent:5.18.0@sha256:91ccf313230cd9fe003de5dd3682ae767c8e2afff7ae5b52d47312da6a0d7b1b
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:43651800218f833f6d09f586df8b174866a31b38e905ef1721658243cbe460a5 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
