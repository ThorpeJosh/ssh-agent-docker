FROM jenkins/ssh-agent:5.41.0@sha256:9504e27856d54a2567d6ad2653fb612129f842dcc619dc91af7b6f821f74cb44
# Copy the docker binary from the official docker image
COPY --from=docker:26.1.4-cli@sha256:cb166c4c17518925eb2c88bab35f2689cdd135e1ab6f8ff7d5eeb8b0a20af197 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
