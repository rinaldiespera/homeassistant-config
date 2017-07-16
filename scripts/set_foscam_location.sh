#!/bin/sh

BASE="$HOME/.homeassistant"
IP=`cat $BASE/secrets.yaml | awk '/foscam_ip/ { print $2 }'`
USER=`cat $BASE/secrets.yaml | awk '/foscam_username/ { print $2 }'`
PASS=`cat $BASE/secrets.yaml | awk '/foscam_password/ { print $2 }'`
LOCATION=$1
[ -n $LOCATION ] || exit 1
URL="https://$IP:443/cgi-bin/CGIProxy.fcgi?cmd=ptzGotoPresetPoint&name=$LOCATION&usr=$USER&pwd=$PASS"
curl -k $URL
