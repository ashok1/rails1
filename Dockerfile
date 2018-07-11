FROM ruby:2.3.3
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# create application directory
RUN mkdir /learn-rails
# Set our working directory inside the image
WORKDIR /learn-rails
ADD Gemfile /learn-rails/Gemfile
ADD Gemfile.lock /learn-rails/Gemfile.lock
RUN bundle install
ADD . /learn-rails
EXPOSE 3000
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]