FROM jenkins/ssh-agent:5.31.0@sha256:e26d7a393221abafb05dd5999e11846bea48f6973f63e110448862cfb1cdcf46
# Copy the docker binary from the official docker image
COPY --from=docker:26.0.1-cli@sha256:eb37f58646a901dc7727cf448cae36daaefaba79de33b5058dab79aa4c04aefb /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
