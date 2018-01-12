FROM ruby:2.4.0
ENV LANG C.UTF-8
ENV RAILS_ENV local

RUN apt-get update -qq && apt-get install -y build-essential mysql-client libv8-dev vim nodejs

RUN mkdir /app
WORKDIR /app
ADD Gemfile* /app/

# http://qiita.com/tachiba/items/b905a740fbe7bcd85639
#RUN gem update --system

#RUN gem install bundler
#RUN bundle install -j4 --path /usr/local/bundle

EXPOSE 3000

#alias
RUN echo 'alias ll="ls -laG"' >> /root/.bashrc
RUN echo 'alias e="vim"' >> /root/.bashrc

ENV MYSQL_DB_NAME aoll_dev
ENV MYSQL_ROOT_PASSWORD test