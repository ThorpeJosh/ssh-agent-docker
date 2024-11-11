FROM jenkins/ssh-agent:6.1.0@sha256:071b7f04f3c9d6d7fb1b881e10852eefa1d6a399600c8c074fc4b4be2c7f763f
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:af743bf68f5f30f37573c8c34717361ea6d737c80c8f4d3af73485eca7a4549d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
