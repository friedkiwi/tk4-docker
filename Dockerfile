FROM ubuntu:18.04

RUN apt update -y && apt install -y build-essential zlib1g-dev autoconf automake unzip libtool

RUN mkdir /src && mkdir -p /dasd/shadow

COPY sources/spinhawk-f4a78a8.zip /src/spinhawk.zip

# install hercules
RUN cd /src && unzip spinhawk.zip && cd /src/spinhawk-master/ && autoreconf -fi && ./configure --disable-dynamic-load --disable-external-gui --disable-shared --enable-static && make -j4 && make install
RUN touch /tmp/dummy

# copy DASD files
COPY ./dasd/* /dasd/


# copy config
COPY hercules.cnf /hercules.cnf

# copy entry points
COPY entrypoint.sh /entrypoint.sh

VOLUME /dasd/shadow

ENTRYPOINT ["/entrypoint.sh"]
