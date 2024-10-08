FROM jenkins/ssh-agent:5.48.0@sha256:67a5212c460560505a23af5a292ebe85717ce1e0bb9055af2ef9c48187f48871
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:6806d2764925d3b483f9732422b95321781765aeece274b4e60063d02e13efd6 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
