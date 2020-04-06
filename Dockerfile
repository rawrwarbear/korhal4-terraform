
FROM jenkins/jnlp-slave:latest
MAINTAINER rawrwarbear <w.a.capili@accenture.com>
SHELL ["/bin/bash", "-c"]
USER root
# INSTALL terraform
RUN mkdir -p /terraform
WORKDIR /terraform
RUN git clone https://github.com/Zordrak/tfenv.git
ENV PATH="/terraform/tfenv/bin:${PATH}"
RUN tfenv install 0.12.23
RUN tfenv use 0.12.23
# TERRAFORM INSTALLED
RUN apt update
RUN apt install -y gettext
ENV PATH $PATH:/usr/bin

USER ${user}

ENV TF_PLUGIN_CACHE_DIR="/home/jenkins/.terraform.d/plugin-cache"
ENV K_TF_PROVIDER_DIR="/home/jenkins/.tf-provider"
RUN mkdir -p $TF_PLUGIN_CACHE_DIR
RUN mkdir -p K_TF_PROVIDER_DIR
WORKDIR /home/jenkins/.tf-provider
COPY provider.tf .
RUN terraform init

WORKDIR /home/jenkins/agent

ENTRYPOINT ["jenkins-agent"]
