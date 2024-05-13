FROM jenkins/ssh-agent:5.35.0@sha256:b61188a4f20b8139485d7f74e0b5d9ac26be587f909112cbd8057fd00c36326a
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.1-cli@sha256:301afb5299dbb194d7b0e21fc9bf7fccedcef4cf367479041301a757a3a63e47 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
