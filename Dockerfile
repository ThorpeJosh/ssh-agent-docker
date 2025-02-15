FROM jenkins/ssh-agent:6.9.0@sha256:a096c4c3f30b703140c97401f226c6b8fff20dfd6e2642e39ed534bf5675c7b0
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.1-cli@sha256:851f91d241214e7c6db86513b270d58776379aacc5eb9c4a87e5b47115e3065c /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
