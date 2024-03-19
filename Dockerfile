FROM jenkins/ssh-agent:5.25.0@sha256:fcfcb9eaafa0f03b1ef87e7ec79ee864afdf1a34c851fc7fe646e4909f255c96
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.4-cli@sha256:a8788ce7a2016109aded7dba47f2f6e9e5eb787b325320eec93617c8617d2712 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
