#!/bin/bash
echo $0 
echo $1 Hello and Welcome to the Quiz app... we are loading a few gems for a better experience, just one moment
gem install bundler -v 2.2.1
gem install tty-prompt -v 0.23.0
gem install colorize -v 0.8.1
gem install tty-font
bundle init
ruby ./src/index.rb 