FROM scolagreco/docker-centos:latest

RUN yum -y install deltarpm \
    && yum -y update \
    && yum -y install unzip zip wget vim libxslt.i686 libstdc++.i686 epel-release initscripts sudo \
    && yum -y update \
    && yum -y install net-tools htop \
# JAVA
    && wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz \
    && tar -zxvf openjdk-11.0.2_linux-x64_bin.tar.gz \
    && rm -Rf openjdk-11.0.2_linux-x64_bin.tar.gz \
    && mv jdk-11.0.2 /usr/local/jdk \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk/bin/java" 1 \
    && yum clean all \
    && rm -rf /var/cache/yum 

# Metadata params
ARG BUILD_DATE
ARG VERSION="v1.11.0.2"
ARG VCS_URL="https://github.com/scolagreco/centos-java.git"
ARG VCS_REF

# Metadata
LABEL maintainer="Stefano Colagreco <stefano@colagreco.it>" \
        org.label-schema.name="CentOS + Java (OpenJDK)" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.version=$VERSION \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.description="Docker Image CentOS + Java (OpenJDK)"

#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]
