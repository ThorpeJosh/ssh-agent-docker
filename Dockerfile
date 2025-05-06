FROM jenkins/ssh-agent:6.15.0@sha256:1ac291f81363c6c68f093b4997353daa69532baa0087a939961c84104306696c
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:c5e0b27a15f49b571f968defe19cc9a072d531ee90300ba5a1d2ea4dffa760e4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
