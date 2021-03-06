#!/bin/bash

ps_num=15
worker_num=30

for i in `eval echo {0..$ps_num}`
do
  python a3c.py --ps_hosts_num=$ps_num --worker_hosts_num=$worker_num --job_name=ps --task_index=$i &
done

for i in `eval echo {0..$worker_num}`
do
  python a3c.py --ps_hosts_num=$ps_num --worker_hosts_num=$worker_num --job_name=worker --task_index=$i &
done
