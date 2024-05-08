FROM jenkins/ssh-agent:5.34.0@sha256:f00e3754c56038401b4c368c6c2d5eab274863b49623ba49c96d6c391b8aba71
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.1-cli@sha256:301afb5299dbb194d7b0e21fc9bf7fccedcef4cf367479041301a757a3a63e47 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
