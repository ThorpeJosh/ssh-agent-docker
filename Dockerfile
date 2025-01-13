FROM jenkins/ssh-agent:6.7.0@sha256:51794d0e61b8cd3cddd5a7d7e61baa1a6b1f966e00116fdf6a3bda447523cb0c
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:2a4f29ca5c9d522b4bd78131c3138b2c892fe6129548811bd3e5124a71107278 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
