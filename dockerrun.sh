docker run -d --restart=unless-stopped -e TZ=America/Los_Angeles -p 80:80 -p 443:443 -p 10415:10415 -p 10414:10414 -p 10699:10699 \
-p 5718:5718 -p 6831:6831 -p 5831:5831 -p 6909:6909 -p 5909:5909 -p 8014:8014 -p 6626:6626 -p 6386:6386 \
-p 11699:11699 docker-mirth-connect
