#!/bin/bash
echo $0
echo $1 Loading a few gems for you to run the quiz app

gem install bundler -v 2.2.1
gem install tty-prompt -v 0.23.0
gem install colorize -v 0.8.1

bundle init

bundle add colorize
bundle add tty-prompt

ruby ./src/index.rb 
