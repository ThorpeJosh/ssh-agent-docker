FROM jenkins/ssh-agent:5.22.0@sha256:fea82e62435e03e23a0a6989f4daea8e443d54da361d5137169f9015ddc4675c
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:8d8c7e9f2dfa7a519d2b4aa2655b84d228777a13efb55fa0eee704984d42a949 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
