FROM jenkins/ssh-agent:5.27.0@sha256:ece847ac264de54cf560f8871a34e60fe97eabe8151e1436d3c2917229dc2099
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.5-cli@sha256:eb37f58646a901dc7727cf448cae36daaefaba79de33b5058dab79aa4c04aefb /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
