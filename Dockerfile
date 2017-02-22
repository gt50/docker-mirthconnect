FROM centos:7

ENV MIRTH_CONNECT_VERSION 3.4.2.8129.b167

RUN yum update -y
RUN yum install -y wget

WORKDIR /opt/mirthconnect

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jre-8u121-linux-x64.rpm"
RUN yum localinstall -y jre-8u121-linux-x64.rpm

RUN wget http://downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-linux.rpm \
 && yum install -y mirthconnect-$MIRTH_CONNECT_VERSION-linux.rpm \
 && sed -i 's/8080/80/g' /opt/mirthconnect/conf/mirth.properties \
 && sed -i 's/8443/443/g' /opt/mirthconnect/conf/mirth.properties \
 && sed -i 's/-Xmx256m/-Xmx1024m/g' /opt/mirthconnect/mcserver.vmoptions \
 && sed -i 's/-Xmx256m/-Xmx1024m/g' /opt/mirthconnect/mcservice.vmoptions 

EXPOSE 80 443

CMD /opt/mirthconnect/mcservice restart && tail -F /opt/mirthconnect/logs/mirth.log

