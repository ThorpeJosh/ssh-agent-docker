FROM jenkins/ssh-agent:5.46.0@sha256:c9bfe9015a8ca6f32465e9b996f325c5e2e2b28f534f12f3dc472efbad49d496
# Copy the docker binary from the official docker image
COPY --from=docker:27.1.1-cli@sha256:39d10d90ef5f6712e6d956c0b175a814259cc9fbd890cf16661c8093de7b04b1 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
