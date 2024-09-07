FROM jenkins/ssh-agent:5.46.0@sha256:c9bfe9015a8ca6f32465e9b996f325c5e2e2b28f534f12f3dc472efbad49d496
# Copy the docker binary from the official docker image
COPY --from=docker:27.2.0-cli@sha256:b0d5aafe0208821bdbe683e141cac9dac1a4ff30e5f56c7ae1359cbbeeb1d43f /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
