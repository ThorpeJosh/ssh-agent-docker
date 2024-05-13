FROM jenkins/ssh-agent:5.35.0@sha256:b61188a4f20b8139485d7f74e0b5d9ac26be587f909112cbd8057fd00c36326a
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.2-cli@sha256:df7f1d03809c000e403e496a0b27ff12bcb9b284549ea770dab0abffc028287a /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
