FROM jenkins/ssh-agent:6.5.0@sha256:cbd732f3553ae4ce5927dc74987aaee1e00c849ab359d716e6060e0c9cd652ff
# Copy the docker binary from the official docker image
COPY --from=docker:27.4.0-cli@sha256:1188a8b56cc944982bc0bc1acd2ccd32a9f14396f3235e6c4107f50670c20d3d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
