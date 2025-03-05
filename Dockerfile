FROM jenkins/ssh-agent:6.10.0@sha256:a601066474866d662a7a337cbf877a5a1920a5c637d50e358f6d8f975555b99a
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.1-cli@sha256:bb4b8a287f8407b9fea1824ba39798b46cd1bf0531680f23e768dd1c86362c79 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
