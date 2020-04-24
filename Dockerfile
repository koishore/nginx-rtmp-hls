#Using the last LTS version of Ubuntu
FROM ubuntu:18.04

#basic setup
RUN apt-get update

#nginx dependencies
RUN apt-get install -y build-essential
RUN apt-get install -y libpcre3
RUN apt-get install -y libpcre3-dev
RUN apt-get install -y libssl-dev

#ffmpeg dependencies
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get install -y ffmpeg

#change directory to build nginx
WORKDIR /nginx-1.17.0

#compile nginx
RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module
RUN make -j 1
RUN make install

#change to previous directory
WORKDIR /

#replace configuration file
RUN rm /usr/local/nginx/conf/nginx.conf
COPY nginx.conf /usr/local/nginx/conf/

#running nginx and the stream command
CMD ["/start.sh"]
