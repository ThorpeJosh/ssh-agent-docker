FROM jenkins/ssh-agent:6.19.0@sha256:fb44ee4b7679eb756daa2a1c43b2b31789f87b4e80757db68a98fd18d68bc61b
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:c5e0b27a15f49b571f968defe19cc9a072d531ee90300ba5a1d2ea4dffa760e4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
