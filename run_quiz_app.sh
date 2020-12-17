#!/bin/bash
echo $0
# echo $ Welcome to the quiz app! We\'re installing a few gem files for you to run this app

gem install tty-prompt
gem install colorize
gem install bundler

ruby ./src/index.rb 