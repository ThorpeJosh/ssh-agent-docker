FROM jenkins/ssh-agent:5.7.0@sha256:151d37d9b563778a73b76021ebcbf509ae1c773800e88a95c5c34856917d64b9

# Copy the docker binary from the official docker image
COPY --from=docker:24.0.6-cli@sha256:7b954b038ba50b02823f245665cfc52a69676bf8a5fa3d151d4a9aa56bbc5f09 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
