FROM openjdk:alpine

RUN apk update && \
    apk upgrade

RUN ["mkdir", "-p", "/opt/wso2"]
RUN set -x \
	&& addgroup -g 1000 -S wso2 \
	&& adduser -u 1000 -D -S -G wso2 wso2 \
	&& mkdir /etc/.java \
	&& touch /etc/.java/.systemPrefs \
	&& chown -R wso2:wso2 /etc/.java/.systemPrefs

RUN ["chown", "-R", "wso2:wso2", "/opt/wso2"]

USER wso2

ADD --chown=wso2:wso2 https://s3-eu-west-1.amazonaws.com/misc.isollab.com/dl/wso2is-5.8.0-m2.zip /opt/wso2
RUN cd /opt/wso2 \
	&& unzip wso2is-5.8.0-m2.zip \
	&& rm wso2is-5.8.0-m2.zip \
	&& ln -s /opt/wso2/wso2is-5.8.0-m2 /opt/wso2/is

ADD https://s3-eu-west-1.amazonaws.com/misc.isollab.com/dl/postgresql-42.2.4.jar /opt/wso2/is/lib/

WORKDIR /opt/wso2/is

CMD ["/opt/wso2/is/bin/wso2server.sh"]
