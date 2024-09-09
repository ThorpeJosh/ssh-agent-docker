FROM jenkins/ssh-agent:5.47.0@sha256:2213b7082a5dfbfceb722c9b64103e79cd891dfda553cca60cfef6d0d1c99763
# Copy the docker binary from the official docker image
COPY --from=docker:27.2.0-cli@sha256:b0d5aafe0208821bdbe683e141cac9dac1a4ff30e5f56c7ae1359cbbeeb1d43f /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
