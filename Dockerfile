FROM centos:7

ENV MIRTH_CONNECT_VERSION 3.4.2.8129.b167

RUN yum update -y
RUN yum install -y wget java-1.8.0-openjdk

WORKDIR /opt/mirthconnect

RUN wget http://downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-linux.rpm \
 && yum install -y mirthconnect-$MIRTH_CONNECT_VERSION-linux.rpm \
 && sed -i 's/8080/80/g' /opt/mirthconnect/conf/mirth.properties \
 && sed -i 's/8443/443/g' /opt/mirthconnect/conf/mirth.properties

EXPOSE 80 443

CMD /opt/mirthconnect/mcservice start && tail -F /opt/mirthconnect/logs/mirth.log

