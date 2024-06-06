FROM jenkins/ssh-agent:5.38.0@sha256:73ee4b110453b270160f5e936d490912bc946b60faf06f39a8ee6049ddbda390
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.4-cli@sha256:5fa382ce1c0cecef3c83c3bab64d38ef6b23d3460573f943fc798db5a6006f6d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
