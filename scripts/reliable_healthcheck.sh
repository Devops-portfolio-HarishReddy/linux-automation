#!/bin/bash
# Reliable healthcheck with retries and exponential backoff

HOST="google.com"
MAX_RETRIES=3
DELAY=1
SUCCESS=0

for ((i=1; i<=MAX_RETRIES; i++)); do
  if ping -c 1 -W 2 $HOST &>/dev/null; then
    logger -t reliable_healthcheck -p user.info "Attempt $i: Ping to $HOST successful"
    SUCCESS=1
    break
  else
    logger -t reliable_healthcheck -p user.warning "Attempt $i: Ping to $HOST failed. Retrying in ${DELAY}s..."
    sleep $DELAY
    DELAY=$((DELAY * 2))  # Exponential backoff
  fi
done

if [ $SUCCESS -eq 1 ]; then
  logger -t reliable_healthcheck -p user.info "Healthcheck passed after $i attempt(s)"
  exit 0
else
  logger -t reliable_healthcheck -p user.error "Healthcheck failed after $MAX_RETRIES attempts"
  exit 1
fi
