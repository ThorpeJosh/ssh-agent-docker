FROM jenkins/ssh-agent:5.27.0
# Copy the docker binary from the official docker image
COPY --from=docker:26.0.0-cli@sha256:7f7052667f682e5690ad07e49521dfbb9b72acd86774a77f8c9e4405e88368ec /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
