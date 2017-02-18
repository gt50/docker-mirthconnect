FROM java:8

ENV MIRTH_CONNECT_VERSION 3.4.2.8129.b167

RUN apt-get update

WORKDIR /usr/local/mirthconnect

ADD templates/mirthconnect/mirthconnect-install-wrapper.sh /usr/local/mirthconnect/mirthconnect-install-wrapper.sh

RUN wget http://downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-unix.sh \
 && chmod +x mirthconnect-$MIRTH_CONNECT_VERSION-unix.sh \
 && ./mirthconnect-install-wrapper.sh

EXPOSE 80 443

CMD /etc/init.d/mcservice start && tail -F /opt/mirthconnect/logs/mirth.log

