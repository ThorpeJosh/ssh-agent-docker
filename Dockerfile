FROM jenkins/ssh-agent:6.4.0@sha256:8d02b01d6618b95346be7f3ecc5b6c25ff81be162bd53143cded2dc649770654
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:2a4f29ca5c9d522b4bd78131c3138b2c892fe6129548811bd3e5124a71107278 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
