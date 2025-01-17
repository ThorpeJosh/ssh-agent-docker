FROM jenkins/ssh-agent:6.7.0@sha256:51794d0e61b8cd3cddd5a7d7e61baa1a6b1f966e00116fdf6a3bda447523cb0c
# Copy the docker binary from the official docker image
COPY --from=docker:27.5.0-cli@sha256:7c10b867b5da6f0ecbac463defeaa490c1d2816cb02fe4e14d2994ad9c3812cd /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
