FROM jenkins/ssh-agent:6.1.0@sha256:071b7f04f3c9d6d7fb1b881e10852eefa1d6a399600c8c074fc4b4be2c7f763f
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:3486a702666745d124e1cd4452fb54d83789f735de9cedd4069d9d502065f692 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
