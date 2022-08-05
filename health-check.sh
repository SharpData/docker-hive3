i#!/usr/bin/env bash
set -ev

HIVE_SERVER_PORT=${HIVE_SERVER_PORT:=10000}
HEALTH_CHECK_RETRIES=${HEALTH_CHECK_RETRIES:=5}

echo Health check for Hive:
n=0
until [ "$n" -ge ${HEALTH_CHECK_RETRIES} ]
do
   /opt/hive/bin/beeline -u "jdbc:hive2://127.0.0.1:${HIVE_SERVER_PORT}/default;auth=noSasl" -n health_check -e "show databases;" && break
   n=$((n+1))
   sleep 15
done
