FROM jenkins/ssh-agent:5.28.0@sha256:f48a12af3e0c9c86a27b7b12470c0094ef56a4906705ed7f7102e8ae36b440c5
# Copy the docker binary from the official docker image
COPY --from=docker:26.0.0-cli@sha256:7f7052667f682e5690ad07e49521dfbb9b72acd86774a77f8c9e4405e88368ec /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
