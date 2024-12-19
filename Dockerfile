FROM jenkins/ssh-agent:6.5.0@sha256:cbd732f3553ae4ce5927dc74987aaee1e00c849ab359d716e6060e0c9cd652ff
# Copy the docker binary from the official docker image
COPY --from=docker:27.4.1-cli@sha256:2a9c1ba4816ddafdcf49a561201a9af2c451017e263a16a4fb1f878c454e1c44 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
