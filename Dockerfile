FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"
RUN apt-get update && apt-get install -y docker-ce
USER jenkins
RUN /usr/local/bin/install-plugins.sh \
  docker-slaves \
  github-branch-source