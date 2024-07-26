FROM jenkins/ssh-agent:5.45.0@sha256:11d757ae5c2c761241a8a825178773e454feb0a51136c515a4fb2d07e4f198c0
# Copy the docker binary from the official docker image
COPY --from=docker:27.0.3-cli@sha256:ee25b896c95a295d3a6413862c83c7eae85ee8cae50b0315f76510b1a253c9ee /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
