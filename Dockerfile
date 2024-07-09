FROM jenkins/ssh-agent:5.43.0@sha256:3660ef3685011eb8e1495577a54bd29a6866d61887d902014814738649e6618b
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.4-cli@sha256:cdfd64167f45406cb2667a946ac61a13abfb38ebaf7a76907b6200c40f3f4caf /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
