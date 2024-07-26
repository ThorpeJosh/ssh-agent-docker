FROM jenkins/ssh-agent:5.44.0@sha256:5eec77f3e5e1011faeb5e76bcdc049d11879fd7b90d52867c13e41abc8568a72
# Copy the docker binary from the official docker image
COPY --from=docker:27.1.1-cli@sha256:39d10d90ef5f6712e6d956c0b175a814259cc9fbd890cf16661c8093de7b04b1 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
