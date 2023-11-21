FROM jenkins/ssh-agent:5.20.0@sha256:0ce9798ae38a0b15ba9659795c761e7c9062c01a0bd88a3aa462ad5e54371b2e
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:43651800218f833f6d09f586df8b174866a31b38e905ef1721658243cbe460a5 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
