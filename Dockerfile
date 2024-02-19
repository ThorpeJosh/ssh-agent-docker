FROM jenkins/ssh-agent:5.25.0@sha256:fcfcb9eaafa0f03b1ef87e7ec79ee864afdf1a34c851fc7fe646e4909f255c96
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.3-cli@sha256:6f919367cdbd27dceb36864151026d5dfc1d0a33e93baf93f12187e2079c942d /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
