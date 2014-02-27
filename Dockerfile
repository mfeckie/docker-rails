FROM ubuntu:12.10

RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev wget && apt-get clean

RUN wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz && tar -xvf ruby-2.1.1.tar.gz && cd ruby-2.1.1 && ./configure --disable-install-doc && make && sudo make install