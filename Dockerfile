FROM jenkins/ssh-agent:5.37.0@sha256:c4d1e9172f7818a1b9a305814ea038eef8d09c72514e8474f8088d49fd16ab55
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.2-cli@sha256:df7f1d03809c000e403e496a0b27ff12bcb9b284549ea770dab0abffc028287a /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
