FROM jenkins/ssh-agent:5.48.0@sha256:67a5212c460560505a23af5a292ebe85717ce1e0bb9055af2ef9c48187f48871
# Copy the docker binary from the official docker image
COPY --from=docker:27.3.1-cli@sha256:3486a702666745d124e1cd4452fb54d83789f735de9cedd4069d9d502065f692 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
