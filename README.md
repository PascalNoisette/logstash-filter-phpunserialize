# logstash-filter-phpunserialize
Read string serialized with php

[![Travis Build Status](https://api.travis-ci.org/logstash-plugins/logstash-filter-phpunserialize.svg)](https://travis-ci.org/logstash-plugins/logstash-filter-phpunserialize)

[![Gem Version](https://badge.fury.io/rb/logstash-filter-phpunserialize.svg)](https://badge.fury.io/rb/logstash-filter-phpunserialize)

This is a plugin for [Logstash](https://github.com/elastic/logstash).

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

## Build

yum install gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel ruby-devel libxml2 libxml2-devel libxslt libxslt-devel git java-1.8.0-openjdk-devel.x86_64

 gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

source /usr/local/rvm/scripts/rvm

rvm install jruby

gem install rake bundler

bundler install
 
bundle exec rspec

gem build logstash-filter-phpunserialize.gemspec


## Install

bin/logstash-plugin install logstash-filter-phpunserialize-1.0.1.gem
bin/logstash-plugin list


## Inline test

bin/logstash -e 'input { stdin{} } filter { phpunserialize {source=>message} } output {stdout { codec => rubydebug }}'

i:456;
{
    "message" => "i:456;",
    "unserialized" => 456
}
