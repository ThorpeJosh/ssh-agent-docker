FROM jenkins/ssh-agent:5.30.0@sha256:7085654bc41fac1928398e83c0f4ff091d409c13d781147f15faa29172877ab4
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.5-cli@sha256:b13c642b069245c5fc60d32a3162026f695844fa809fdf17d5bb64bb769d0b49 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
