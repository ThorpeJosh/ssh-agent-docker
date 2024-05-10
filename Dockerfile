FROM jenkins/ssh-agent:5.34.0@sha256:f00e3754c56038401b4c368c6c2d5eab274863b49623ba49c96d6c391b8aba71
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.2-cli@sha256:df7f1d03809c000e403e496a0b27ff12bcb9b284549ea770dab0abffc028287a /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
