FROM jenkins/ssh-agent:5.38.0@sha256:73ee4b110453b270160f5e936d490912bc946b60faf06f39a8ee6049ddbda390
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.3-cli@sha256:46f45f59366d443fec0ecb4a44fa4fb65f11b3305ca6b138edc176d8971e05b4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
