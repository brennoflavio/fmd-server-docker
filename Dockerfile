FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install wget xz-utils -y

RUN mkdir /app
VOLUME /app
WORKDIR /app

RUN wget https://github.com/objectbox/objectbox-c/releases/download/v0.15.1/objectbox-linux-x64.tar.gz
RUN tar -xvzf objectbox-linux-x64.tar.gz
RUN cp lib/libobjectbox.so /usr/lib/libobjectbox.so

RUN wget https://gitlab.com/Nulide/findmydeviceserver/uploads/cf371c99e814d19ca94e6fdbcab9d382/Package.tar.xz
RUN tar -xvf Package.tar.xz

RUN mkdir /app/data

CMD ["/app/fmdserver"]
