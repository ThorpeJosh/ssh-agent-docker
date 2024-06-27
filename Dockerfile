FROM jenkins/ssh-agent:5.40.0@sha256:aa773a1ea19b816983474aa7c8a90a4f9bbba064a5806f0f2fd929f8458521d5
# Copy the docker binary from the official docker image
COPY --from=docker:27.0.2-cli@sha256:cfe17a38817e870cd07173caef43d5bac609da6afd0e9934ee01dc701a4de4fe /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
