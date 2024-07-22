FROM jenkins/ssh-agent:5.44.0@sha256:5eec77f3e5e1011faeb5e76bcdc049d11879fd7b90d52867c13e41abc8568a72
# Copy the docker binary from the official docker image
COPY --from=docker:27.0.3-cli@sha256:ee25b896c95a295d3a6413862c83c7eae85ee8cae50b0315f76510b1a253c9ee /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
