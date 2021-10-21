FROM ruby:3.0.2

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev libjemalloc-dev
RUN apt-get -y autoclean

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm -v
RUN node -v

# Set the locale
RUN mkdir /inventory-assignment
WORKDIR /inventory-assignment

# install rails and inventory-assignment Gemfile
COPY Gemfile /inventory-assignment/Gemfile
COPY Gemfile.lock /inventory-assignment/Gemfile.lock
RUN gem install bundler
RUN bundle install
