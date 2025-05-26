FROM jenkins/ssh-agent:6.17.0@sha256:b4668d7b02d97c332aae24190ae6e59bc4b2f6e136da01a185d2519c512f818d
# Copy the docker binary from the official docker image
COPY --from=docker:28.0.4-cli@sha256:c5e0b27a15f49b571f968defe19cc9a072d531ee90300ba5a1d2ea4dffa760e4 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
