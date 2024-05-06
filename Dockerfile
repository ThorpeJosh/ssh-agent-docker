FROM jenkins/ssh-agent:5.34.0@sha256:f00e3754c56038401b4c368c6c2d5eab274863b49623ba49c96d6c391b8aba71
# Copy the docker binary from the official docker image
COPY --from=docker:26.0.1-cli@sha256:e35a56a764a1b32e2f5efc78932bd4ed068fe1be830f8cc8a89dae2f0de4c55d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
