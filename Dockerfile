FROM jenkins/ssh-agent:5.22.0@sha256:fea82e62435e03e23a0a6989f4daea8e443d54da361d5137169f9015ddc4675c
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.3-cli@sha256:694bf21729271812514a8fb710708869866593c2a7c326cf4315e959586dedc8 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
