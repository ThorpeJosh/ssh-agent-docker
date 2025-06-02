FROM jenkins/ssh-agent:6.18.0@sha256:bd6d29db723d4b4a3aa59fb2ecc2910d6b840c161e9e0f11e2f9dfa0915be99c
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:c5e0b27a15f49b571f968defe19cc9a072d531ee90300ba5a1d2ea4dffa760e4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
