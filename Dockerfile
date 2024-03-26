FROM jenkins/ssh-agent:5.25.0@sha256:fcfcb9eaafa0f03b1ef87e7ec79ee864afdf1a34c851fc7fe646e4909f255c96
# Copy the docker binary from the official docker image
COPY --from=docker:26.0.0-cli@sha256:16840df28f715a7c32ec81eec277adc1c441c6d9abd4885cead3e31e723c7869 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
