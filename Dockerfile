FROM jenkins/ssh-agent:5.10.0@sha256:4ffa4eb211fa163a2a022fa1c8004f7cbab07251cb98fc0bea659e73233b912a

# Copy the docker binary from the official docker image
COPY --from=docker:24.0.6-cli@sha256:7b954b038ba50b02823f245665cfc52a69676bf8a5fa3d151d4a9aa56bbc5f09 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
