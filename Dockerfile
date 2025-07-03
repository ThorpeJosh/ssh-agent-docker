FROM jenkins/ssh-agent:6.21.0@sha256:aa9722789f0fa0f8ed7ce829e8d4573aef5e1bc710a385cf86e4e705bba3c1f7
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:c5e0b27a15f49b571f968defe19cc9a072d531ee90300ba5a1d2ea4dffa760e4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
