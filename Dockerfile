FROM jenkins/ssh-agent:5.20.0@sha256:0ce9798ae38a0b15ba9659795c761e7c9062c01a0bd88a3aa462ad5e54371b2e
# Copy the docker binary from the official docker image
COPY --from=docker:24.0.7-cli@sha256:a2a608408fa15d6694543a7308c2bfd1a7ea90a0e4ca989d0471ca7b8348fabb /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
