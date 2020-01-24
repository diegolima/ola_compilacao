FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y build-essential \
  && rm -Rf /var/lib/apt/lists

COPY . /app

WORKDIR /app

RUN ./configure --prefix=/usr/bin \
  && make -j $(nproc) \
  && make install

CMD ["/usr/bin/oi"]
