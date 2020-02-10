
FROM jenkins/jnlp-slave:latest
MAINTAINER rawrwarbear <w.a.capili@accenture.com>
USER root

WORKDIR /home/jenkins/agent

USER ${user}
ENTRYPOINT ["jenkins-agent"]
