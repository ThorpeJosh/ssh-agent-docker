FROM jenkins/ssh-agent:6.4.0@sha256:8d02b01d6618b95346be7f3ecc5b6c25ff81be162bd53143cded2dc649770654
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:af743bf68f5f30f37573c8c34717361ea6d737c80c8f4d3af73485eca7a4549d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
