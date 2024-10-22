FROM jenkins/ssh-agent:6.1.0@sha256:071b7f04f3c9d6d7fb1b881e10852eefa1d6a399600c8c074fc4b4be2c7f763f
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:6806d2764925d3b483f9732422b95321781765aeece274b4e60063d02e13efd6 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
