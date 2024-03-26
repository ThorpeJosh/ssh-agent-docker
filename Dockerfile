FROM jenkins/ssh-agent:5.25.0@sha256:fcfcb9eaafa0f03b1ef87e7ec79ee864afdf1a34c851fc7fe646e4909f255c96
# Copy the docker binary from the official docker image
COPY --from=docker:25.0.5-cli@sha256:9a063eb4b98b6a1782fccd0c47bbbf400acfebba659de932d921a43df7863993 /usr/local/bin/docker /usr/local/bin/docker

# Allow jenkins user to run docker as root due to socket mount permissions
RUN chmod -v a+s $(which docker)
