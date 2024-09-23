FROM jenkins/ssh-agent:5.47.0@sha256:2213b7082a5dfbfceb722c9b64103e79cd891dfda553cca60cfef6d0d1c99763
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:6806d2764925d3b483f9732422b95321781765aeece274b4e60063d02e13efd6 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
