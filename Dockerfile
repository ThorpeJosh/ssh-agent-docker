FROM jenkins/ssh-agent:6.5.0@sha256:cbd732f3553ae4ce5927dc74987aaee1e00c849ab359d716e6060e0c9cd652ff
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:2a4f29ca5c9d522b4bd78131c3138b2c892fe6129548811bd3e5124a71107278 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
