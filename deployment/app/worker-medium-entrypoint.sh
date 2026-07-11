#!/bin/bash

set -m

# SIGTERM handler
term_handler() {
  echo "Caught SIGTERM signal!"
  echo "$(date) Caught SIGTERM for $HOSTNAME" >> /stepora/logs/app.out.celery-medium.console.log
  sleep 1
  if [ $pid -ne 0 ]; then
    kill -TERM "$pid"
    wait "$pid"
  fi
  echo "$(date) Exiting container $HOSTNAME" >> /stepora/logs/app.out.celery-medium.console.log
  exit 143;
}

trap 'term_handler' SIGTERM

celery -A stepshop worker -Q medium --autoscale=3,1 --max-memory-per-child=122880 --prefetch-multiplier=1 --max-tasks-per-child=50 -l INFO -f /stepora/logs/app.out.celery-medium.log >> /stepora/logs/app.out.celery-medium.console.log 2>&1 &

pid="$!"

# wait indefinitely
wait
