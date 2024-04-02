FROM jenkins/ssh-agent:5.27.0
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.5-cli@sha256:eb37f58646a901dc7727cf448cae36daaefaba79de33b5058dab79aa4c04aefb /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
