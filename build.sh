#!/bin/bash

PW=$1

if [ -z "$PW" ];
then
	printf "\nNo password set; please provide a password\n"
	exit 1
fi

#57ce839479c365d77a56c3e87e4c3ed9f36335b9
./generate-Dockerfile.sh --python-only --password $PW #--commit efa95c2c5b9b095247cd2f5e55bc3b38c85da335

# change the default port of jupyter to be read from environment variable
sed -i -e 's/8888/int(os.getenv("JPY_PORT"))/g' ./.build/jupyter_server_config.py
