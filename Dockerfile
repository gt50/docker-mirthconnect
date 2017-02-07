FROM java:8

ENV MIRTH_CONNECT_VERSION 3.4.2.8129.b167

RUN apt-get update && apt-get -y install nginx --no-install-recommends

RUN apt-get -y install netcat

WORKDIR /usr/local/mirthconnect

ADD templates/mirthconnect/mirthconnect-install-wrapper.sh /usr/local/mirthconnect/mirthconnect-install-wrapper.sh

RUN wget http://downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-unix.sh \
 && chmod +x mirthconnect-$MIRTH_CONNECT_VERSION-unix.sh \
 && ./mirthconnect-install-wrapper.sh

ADD templates/etc /etc
ADD templates/mirthconnect /usr/local/mirthconnect

EXPOSE 80 443

CMD ./mirthconnect-wrapper.sh

