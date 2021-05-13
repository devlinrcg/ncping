#!/bin/bash
# Usage: ./ncping.sh IP/HOST PORT HOW_MANY_TIMES
# e.g. ./ncping.sh 192.168.0.1 22 10 (will netcat 192.168.0.1 on port 22 for 10 times)

helpFunction()
{
  echo ""
  echo "Usage: $0 host port count"
  echo -e "\t Host (FQDN or IP Address)"
  echo -e "\t Port (only one port allowed"
  echo -e "\t How many times should the command execute"
  echo -e "\t Example: $0 checkip.amazonaws.com 443 2"
  exit 1
}

# Print helpFunction in case parameters are empty
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
then
  echo "Some or all of the parameters are empty";
  helpFunction
else
  count="0"
  while [ $count -lt $3 ]
  do
    `$(which nc) -vz $1 $2`
    sleep 1
  count=$[$count+1]
  done
fi