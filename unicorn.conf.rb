# -*- mode:ruby -*-
app_root = "/opt/services/workaholic"

worker_processes 2
working_directory app_root

listen 4568

pid app_root+"/pids/tmp/unicorn.pid"
stderr_path app_root+"/log/unicorn_err.log"
stdout_path app_root+"/log/unicorn_out.log"
