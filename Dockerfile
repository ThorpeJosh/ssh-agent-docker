FROM jenkins/ssh-agent:6.11.2@sha256:01f35d34a856b5ad914f5d18623074399c784e346357fb27dfa17d428c000524
# Copy the docker binary from the official docker image
COPY --from=docker:28.3.1-cli@sha256:d623d8d72aa526abcdc996ac8963062a715235ffda58556d864112b8b3fab21b /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
