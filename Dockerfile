FROM jenkins/ssh-agent:6.3.0@sha256:11e81920181cf0c1e113d931e8770f678195a944c1447396c39b0657779b8184
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:af743bf68f5f30f37573c8c34717361ea6d737c80c8f4d3af73485eca7a4549d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
