FROM jenkins/ssh-agent:6.9.0@sha256:a096c4c3f30b703140c97401f226c6b8fff20dfd6e2642e39ed534bf5675c7b0
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.1-cli@sha256:79bf825c5bed0d579820cc19f6857738abc424a680b619171591e969114f2015 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
