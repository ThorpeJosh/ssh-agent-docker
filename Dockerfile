FROM jenkins/ssh-agent:6.8.0@sha256:5fd795d3ddab24c6757767ed0819a47b36aea1d68bedb532331595cbe9b59225
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.1-cli@sha256:1624879c3635f0677fa129aecece0e0a6cdd30c77759542fa07d4ed567f7d86e /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
