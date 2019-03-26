FROM scolagreco/docker-centos:latest

RUN yum install deltarpm -y \
    && yum -y -q update \
    && yum install unzip zip wget vim libxslt.i686 libstdc++.i686 epel-release initscripts sudo -y \
    && yum -y -q update \
    && yum install net-tools htop  -y \
# JAVA
    && wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz \
    && tar -zxvf jdk-8u201-linux-x64.tar.gz \
    && rm -Rf jdk-8u201-linux-x64.tar.gz \
    && mv jdk1.8.0_201 /usr/local/jdk \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk/bin/java" 1 \
    && yum clean all \
    && rm -rf /var/cache/yum 

# Metadata params
ARG BUILD_DATE
ARG VERSION="v1.8.0_201"
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

#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]
