FROM jenkins/ssh-agent:6.2.0@sha256:4e994e06c3e5ec1f0df7322ce7ce9399533f11f69e94669b08f4129610559e62
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:af743bf68f5f30f37573c8c34717361ea6d737c80c8f4d3af73485eca7a4549d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
