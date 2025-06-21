FROM jenkins/ssh-agent:6.11.2@sha256:01f35d34a856b5ad914f5d18623074399c784e346357fb27dfa17d428c000524
# Copy the docker binary from the official docker image
COPY --from=docker:28.2.2-cli@sha256:0e97e06d5cc205d4dc6d949dbd3e175c4759c804917e5caebecab91be1961392 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
