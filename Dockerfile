FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get -y install --no-install-recommends wget && rm -rf /var/lib/apt/lists/*
RUN wget https://download.java.net/java/GA/jdk20.0.1/b4887098932d415489976708ad6d1a4b/9/GPL/openjdk-20.0.1_linux-x64_bin.tar.gz
RUN tar -C /var/jenkins_home/java-20.0.1 -zxvf openjdk-20.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME=/var/jenkins_home/java-20.0.1/bin/java
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
USER jenkins
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY casc.yml /var/jenkins_home/casc.yml
COPY job.groovy /var/jenkins_home/job_dsl/job.groovy
RUN jenkins-plugin-cli --plugins -f /usr/share/jenkins/ref/plugins.txt