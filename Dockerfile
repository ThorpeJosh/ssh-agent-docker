FROM jenkins/ssh-agent:5.19.1@sha256:109be2d1d15e67bb8a796a4400a1efaf9a348692d9e6f3730582bca7b661a387
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:43651800218f833f6d09f586df8b174866a31b38e905ef1721658243cbe460a5 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
