#!/bin/bash
export PATH=/opt/ruby20/bin:$PATH
bundle exec unicorn_rails -E production -c unicorn.conf --path /workaholic -D
