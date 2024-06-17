FROM jenkins/ssh-agent:5.40.0@sha256:aa773a1ea19b816983474aa7c8a90a4f9bbba064a5806f0f2fd929f8458521d5
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.4-cli@sha256:cb166c4c17518925eb2c88bab35f2689cdd135e1ab6f8ff7d5eeb8b0a20af197 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
