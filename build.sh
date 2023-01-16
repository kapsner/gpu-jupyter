#!/bin/bash

PW=$1

if [ -z "$PW" ];
then
	printf "\nNo password set; please provide a password\n"
	exit 1
fi

#57ce839479c365d77a56c3e87e4c3ed9f36335b9
./generate-Dockerfile.sh --python-only --password $PW --commit e014bb8ec52406e6ae491af2a7130a96922dfa25

# change the default port of jupyter to be read from environment variable
sed -i -e 's/8888/int(os.getenv("JPY_PORT"))/g' ./.build/jupyter_server_config.py
