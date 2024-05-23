FROM jenkins/ssh-agent:5.38.0@sha256:73ee4b110453b270160f5e936d490912bc946b60faf06f39a8ee6049ddbda390
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.2-cli@sha256:df7f1d03809c000e403e496a0b27ff12bcb9b284549ea770dab0abffc028287a /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
