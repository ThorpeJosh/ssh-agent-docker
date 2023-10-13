FROM jenkins/ssh-agent:5.7.0

# Copy the docker binary from the official docker image
COPY --from=docker:24.0.6-cli /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
