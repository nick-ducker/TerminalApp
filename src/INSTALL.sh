#!/bin/bash

echo $(clear)

echo 'Thanks for installing DiveBar!'

install bundler
bundle install
gem update --system

echo 'All done!'


