FROM jenkins/ssh-agent:6.11.2@sha256:01f35d34a856b5ad914f5d18623074399c784e346357fb27dfa17d428c000524
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:db3ecdf8e404584aa9c61124d4b94050a57baff6b22b6c24fd4306ba2ec0ee7f /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
