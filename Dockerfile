FROM jenkins/ssh-agent:5.17.0@sha256:95684dc3a96d0513dc29e631f6ed28f947f828109ed975d8d769eded37fa8268
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:43651800218f833f6d09f586df8b174866a31b38e905ef1721658243cbe460a5 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
