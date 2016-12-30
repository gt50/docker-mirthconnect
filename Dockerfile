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

# docker run -d -p 80:80 -p 443:443 -p 10415:10415 -p 10699:10699 -p 5718:5718 -p 6831:6831 -p 5831:5831 -p 5909:5909 -p
 8014:8014 -p 6626:6626 docker-mirth-connect
