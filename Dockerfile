FROM jenkins/ssh-agent:6.6.0@sha256:1c9a202cfa353fb380003ec5080d8226d69aaf385f94d0093c170b5ba5909435
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:328eb399a065780c2cebe9224de003aa14084cf69efae882ac27430f921819b7 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
