FROM jenkins/ssh-agent:5.32.0@sha256:7dc5118ebb09eca80f5d4423fc40efbe45fb11a54529b5623a5abc4af5721d52
# Copy the docker binary from the official docker image
COPY --from=docker:26.0.1-cli@sha256:e35a56a764a1b32e2f5efc78932bd4ed068fe1be830f8cc8a89dae2f0de4c55d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
