FROM jenkins/ssh-agent:5.45.0@sha256:11d757ae5c2c761241a8a825178773e454feb0a51136c515a4fb2d07e4f198c0
# Copy the docker binary from the official docker image
COPY --from=docker:27.1.1-cli@sha256:39d10d90ef5f6712e6d956c0b175a814259cc9fbd890cf16661c8093de7b04b1 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
