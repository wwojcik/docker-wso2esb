FROM gliderlabs/alpine:latest

MAINTAINER Wojciech Wójcik <wojtaswojcik@gmail.com>

ENV TIMEZONE=Europe/Warsaw \
    JAVA_HOME=/usr/lib/jvm/java-1.7-openjdk/

RUN apk --update add openjdk7-jre-base openssl unzip tzdata\
    && wget -O /tmp/wso2esb-4.8.1.zip https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2esb-4.8.1.zip \
    && unzip /tmp/wso2esb-4.8.1.zip -d /opt  \
    && rm -rf /tmp/wso2esb-4.8.1.zip  /var/cache/apk/* \
    && cp /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo "$TIMEZONE" >  /etc/timezone

EXPOSE 9443 9763 8243 8280
VOLUME /opt/wso2esb-4.8.1/repository
CMD ["/opt/wso2esb-4.8.1/bin/wso2server.sh"]