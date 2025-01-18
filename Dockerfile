FROM jenkins/ssh-agent:6.8.0@sha256:5fd795d3ddab24c6757767ed0819a47b36aea1d68bedb532331595cbe9b59225
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.0-cli@sha256:60407342059ffa73d3ca74c7fd8a5273efc94a6035d7cff6f4c8123e30ce34a4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
