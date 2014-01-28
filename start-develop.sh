#!/bin/bash
bundle exec unicorn_rails -E development -c unicorn.conf.develop.rb --path /workaholic -D
