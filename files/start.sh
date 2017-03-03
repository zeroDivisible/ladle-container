#!/bin/bash
set -x
set -e

# run supervisord
supervisord -n -c /etc/supervisord.conf
