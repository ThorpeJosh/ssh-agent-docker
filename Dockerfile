FROM jenkins/ssh-agent:5.44.0@sha256:5eec77f3e5e1011faeb5e76bcdc049d11879fd7b90d52867c13e41abc8568a72
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.4-cli@sha256:cdfd64167f45406cb2667a946ac61a13abfb38ebaf7a76907b6200c40f3f4caf /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
