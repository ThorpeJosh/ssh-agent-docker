FROM jenkins/ssh-agent:5.28.0@sha256:f48a12af3e0c9c86a27b7b12470c0094ef56a4906705ed7f7102e8ae36b440c5
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.5-cli@sha256:b13c642b069245c5fc60d32a3162026f695844fa809fdf17d5bb64bb769d0b49 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
