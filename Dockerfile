FROM jenkins/ssh-agent:5.37.0@sha256:c4d1e9172f7818a1b9a305814ea038eef8d09c72514e8474f8088d49fd16ab55
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.3-cli@sha256:a57c8422ce20c07cbda4de330b1edfce77438c4166a0b8a7804641c0d804c04d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
