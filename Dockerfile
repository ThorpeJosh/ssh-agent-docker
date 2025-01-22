FROM jenkins/ssh-agent:6.8.0@sha256:5fd795d3ddab24c6757767ed0819a47b36aea1d68bedb532331595cbe9b59225
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.0-cli@sha256:13ef8c39b49e8669461bfd6c71d6eca53f85b6dd16a13acbdeb0d706ceb4ebaf /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
