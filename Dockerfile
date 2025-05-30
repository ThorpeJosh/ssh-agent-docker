FROM jenkins/ssh-agent:6.11.2@sha256:01f35d34a856b5ad914f5d18623074399c784e346357fb27dfa17d428c000524
# Copy the docker binary from the official docker image
COPY --from=docker:28.2.2-cli@sha256:3fe9ca46e820f75a459b1a2c6074d7a6a17fe7798caa7421350da408faf4210f /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
