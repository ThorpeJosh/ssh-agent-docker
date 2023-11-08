FROM jenkins/ssh-agent:5.19.0@sha256:5cea28b7e3ba6a9669573e738a9d6eb31053f1e796ecf7710b03b6e662ca0a9c
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:43651800218f833f6d09f586df8b174866a31b38e905ef1721658243cbe460a5 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
