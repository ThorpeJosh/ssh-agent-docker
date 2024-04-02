FROM jenkins/ssh-agent:5.27.0@sha256:ece847ac264de54cf560f8871a34e60fe97eabe8151e1436d3c2917229dc2099
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.5-cli@sha256:b13c642b069245c5fc60d32a3162026f695844fa809fdf17d5bb64bb769d0b49 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
