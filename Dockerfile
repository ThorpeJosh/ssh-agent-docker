FROM jenkins/ssh-agent:5.38.0@sha256:73ee4b110453b270160f5e936d490912bc946b60faf06f39a8ee6049ddbda390
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.3-cli@sha256:a57c8422ce20c07cbda4de330b1edfce77438c4166a0b8a7804641c0d804c04d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
