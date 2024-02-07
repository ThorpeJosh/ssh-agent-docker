FROM jenkins/ssh-agent:5.24.0@sha256:670291403aa692b3ac0f9bc6846529f07cfec44ae29041f926f442f9dfb60bd0
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.3-cli@sha256:6f919367cdbd27dceb36864151026d5dfc1d0a33e93baf93f12187e2079c942d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
