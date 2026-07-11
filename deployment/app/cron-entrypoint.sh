#!/bin/bash

set -m

# SIGTERM handler
term_handler() {
  echo "Caught SIGTERM signal!"
  echo "$(date) Caught SIGTERM for $HOSTNAME" >> /stepora/logs/cron.out.celery.console.log
  sleep 1
  if [ $pid -ne 0 ]; then
    kill -TERM "$pid"
    wait "$pid"
  fi
  echo "$(date) Exiting container $HOSTNAME" >> /stepora/logs/cron.out.celery.console.log
  exit 143;
}

trap 'term_handler' SIGTERM

celery -A stepshop beat --scheduler django_celery_beat.schedulers:DatabaseScheduler -l INFO -f /stepora/logs/cron.out.celery.log >> /stepora/logs/cron.out.celery.console.log 2>&1 &

pid="$!"

# wait indefinitely
wait
