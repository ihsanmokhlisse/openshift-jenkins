# The FROM will be replaced when building in OpenShift
FROM centos:7

MAINTAINER Siamak Sadeghianfar <ssadeghi@redhat.com>

ENV MAVEN_VERSION 3.3.9

# Install headless Java
USER root
RUN yum clean all && \
    export INSTALL_PKGS="nss_wrapper java-1.8.0-openjdk-headless \
        java-1.8.0-openjdk-devel nss_wrapper gettext tar git \
        which origin-clients wget" && \
    yum clean all && \
    yum -y --setopt=tsflags=nodocs install epel-release centos-release-openshift-origin && \
    yum install -y --setopt=tsflags=nodocs install $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm && \
    yum localinstall -y jdk-7u79-linux-x64.rpm && \
    rm -f jdk-7u79-linux-x64.rpm && \
    mkdir -p /var/lib/jenkins && \
    chown -R 1001:0 /var/lib/jenkins && \
    chmod -R g+w /var/lib/jenkins

# Install Maven
RUN curl -sL -o /tmp/maven.tar.gz \
      https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    mkdir -p /var/lib/jenkins/tools && \
    cd /var/lib/jenkins/tools && \
    tar xfz /tmp/maven.tar.gz && \
    mv /var/lib/jenkins/tools/apache-maven-${MAVEN_VERSION} /var/lib/jenkins/tools/maven && \
    chown -R 1001:0 /var/lib/jenkins/tools 

# Copy the entrypoint
COPY configuration/* /var/lib/jenkins/
RUN  mkdir  /var/lib/jenkins/.m2 && \
     cp -fa /var/lib/jenkins/settings*.xml \
            /var/lib/jenkins/.m2/ && \
     chmod +x /var/lib/jenkins/{run-jnlp-client,entrypoint.sh} && \
     chmod 777 /var/lib/jenkins/.m2 && \
     cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

USER 2097151
ENV HOME /var/lib/jenkins/
ENV TZ   Europe/Amsterdam

RUN git config --global user.email "ci_build@jenkins-slave.openshiftapps.com" && \
    git config --global user.name "CI-Build"

# Run the JNLP client by default
# To use swarm client, specify "/var/lib/jenkins/run-swarm-client" as Command
ENTRYPOINT ["/var/lib/jenkins/entrypoint.sh"]
