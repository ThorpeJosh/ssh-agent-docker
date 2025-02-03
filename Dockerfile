FROM jenkins/ssh-agent:6.9.0@sha256:a096c4c3f30b703140c97401f226c6b8fff20dfd6e2642e39ed534bf5675c7b0
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.1-cli@sha256:bb4b8a287f8407b9fea1824ba39798b46cd1bf0531680f23e768dd1c86362c79 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
