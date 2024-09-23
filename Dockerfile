FROM jenkins/ssh-agent:5.47.0@sha256:2213b7082a5dfbfceb722c9b64103e79cd891dfda553cca60cfef6d0d1c99763
# Copy the docker binary from the official docker image
COPY --from=docker:27.2.1-cli@sha256:235a25499afa28f3c359b4a90d4245fc74d21f2f368cfb7bbc48aca1e189609d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
