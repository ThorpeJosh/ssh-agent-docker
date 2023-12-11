FROM jenkins/ssh-agent:5.22.0@sha256:fea82e62435e03e23a0a6989f4daea8e443d54da361d5137169f9015ddc4675c
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:a2a608408fa15d6694543a7308c2bfd1a7ea90a0e4ca989d0471ca7b8348fabb /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
