FROM jenkins/ssh-agent:5.24.0@sha256:670291403aa692b3ac0f9bc6846529f07cfec44ae29041f926f442f9dfb60bd0
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.9-cli@sha256:194f8a360190c5edc0c8a2249f7b1e2a5c0bccc89811cf50384f14dd3d9f8191 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
