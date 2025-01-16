FROM jenkins/ssh-agent:6.7.0@sha256:51794d0e61b8cd3cddd5a7d7e61baa1a6b1f966e00116fdf6a3bda447523cb0c
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.0-cli@sha256:60407342059ffa73d3ca74c7fd8a5273efc94a6035d7cff6f4c8123e30ce34a4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
