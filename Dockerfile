FROM ubuntu:12.10

RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev wget && apt-get clean

RUN wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz -q \
	&& tar -xvf ruby-2.1.1.tar.gz \
	&& cd ruby-2.1.1 \
	&& ./configure --disable-install-doc \
	&& make \
	&& sudo make install 

RUN rm -rf ruby-2.1.1 && rm ruby-2.1.1.tar.gz

RUN wget http://download.redis.io/releases/redis-2.8.6.tar.gz -q\
	&& tar xvf redis-2.8.6.tar.gz \
	&& cd redis-2.8.6 \
	&& make \
	&& sudo make install \
	&& cd utils \
	&& ./install_server.sh \
	&& sudo service redis_6379 start

RUN rm -rf redis-2.8.6 && rm redis-2.8.6.tar.gz