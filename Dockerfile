FROM scolagreco/docker-centos:latest

RUN yum install deltarpm -y \
    && yum -y -q update \
    && yum install unzip zip wget vim libxslt.i686 libstdc++.i686 epel-release initscripts sudo -y \
    && yum -y -q update \
    && yum install net-tools htop  -y \
# JAVA
    && wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz \
    && tar -zxvf jdk-8u162-linux-x64.tar.gz \
    && rm -Rf jdk-8u162-linux-x64.tar.gz \
    && mv jdk1.8.0_162 /usr/local \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk1.8.0_162/bin/java" 1 \
    && yum clean all \
    && rm -rf /var/cache/yum 

# Metadata params
ARG BUILD_DATE
ARG VERSION="v1.8.0_162"
ARG VCS_URL="https://github.com/scolagreco/centos-java.git"
ARG VCS_REF

# Metadata
LABEL maintainer="Stefano Colagreco <stefano@colagreco.it>" \
        org.label-schema.name="CentOS + Java" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.version=$VERSION \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.description="Docker Image CentOS + Java"

ENTRYPOINT ["/bin/bash"]

