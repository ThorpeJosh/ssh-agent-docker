FROM jenkins/ssh-agent:5.17.0@sha256:95684dc3a96d0513dc29e631f6ed28f947f828109ed975d8d769eded37fa8268
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.6-cli@sha256:4865ba3135696b1c0e1b6bf323a5ef9402013244a69280543cf16aebc1da2b49 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
