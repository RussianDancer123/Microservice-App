FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y maven default-jdk docker.io curl && \
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    curl -L https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq && \
    apt-get clean

USER jenkins






#FROM jenkins/jenkins:2.504.1-jdk21
#USER root
#RUN apt-get update && apt-get install -y lsb-release
#RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#  https://download.docker.com/linux/debian/gpg
#RUN echo "deb [arch=$(dpkg --print-architecture) \
#  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#  https://download.docker.com/linux/debian \
#  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
#RUN apt-get update && apt-get install -y docker-ce-cli
#RUN apt-get update && apt-get install -y maven default-jdk docker.io && \
#    apt-get clean
#USER jenkins
#RUN jenkins-plugin-cli --plugins "blueocean docker-workflow json-path-api"

