FROM jenkins/ssh-agent:5.43.0@sha256:3660ef3685011eb8e1495577a54bd29a6866d61887d902014814738649e6618b
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.4-cli@sha256:5eeb81ff9cae5951e2a3fdc0b8c74e830b47a2d886d02bb55f1e98e045ec7445 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
