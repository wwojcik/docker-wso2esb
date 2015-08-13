FROM gliderlabs/alpine:latest

MAINTAINER Wojciech Wójcik <wojtaswojcik@gmail.com>

RUN apk --update add openjdk7-jre-base openssl unzip\
    && wget -O /tmp/wso2esb-4.8.1.zip https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2esb-4.8.1.zip \
    && unzip /tmp/wso2esb-4.8.1.zip -d /opt  \
    && rm -rf /tmp/wso2esb-4.8.1.zip  /var/cache/apk/*

EXPOSE 9443 9763 8243 8280
ENV JAVA_HOME=/usr/lib/jvm/java-1.7-openjdk/
VOLUME opt/wso2esb-4.8.1/repository/conf opt/wso2esb-4.8.1/repository/database
CMD ["/opt/wso2esb-4.8.1/bin/wso2server.sh"]