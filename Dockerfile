FROM jenkins/ssh-agent:5.9.0@sha256:68f0f5d017d55fde97f1ee4c6ab26c3c2f584aadcbcb5c695d2328c562272e5d

# Copy the docker binary from the official docker image
COPY --from=docker:24.0.6-cli@sha256:7b954b038ba50b02823f245665cfc52a69676bf8a5fa3d151d4a9aa56bbc5f09 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
