FROM jenkins/ssh-agent:5.43.0@sha256:3660ef3685011eb8e1495577a54bd29a6866d61887d902014814738649e6618b
# Copy the docker binary from the official docker image
COPY --from=docker:27.0.3-cli@sha256:ee25b896c95a295d3a6413862c83c7eae85ee8cae50b0315f76510b1a253c9ee /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
