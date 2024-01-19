FROM jenkins/ssh-agent:5.22.0@sha256:fea82e62435e03e23a0a6989f4daea8e443d54da361d5137169f9015ddc4675c
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:4836d08d0dae6f0078cbd4abe11b007d3ed9b762d5aa7314a36f37c4f2dd6b6d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
