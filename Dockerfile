FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugins -f /usr/share/jenkins/ref/plugins.txt
COPY casc.yml /var/jenkins_home/casc.yml
COPY job.groovy /var/jenkins_home/job_dsl/job.groovy
USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN groupadd -g 9994 docker && usermod -aG docker jenkins
USER jenkins