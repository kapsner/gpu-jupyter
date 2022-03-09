#!/bin/bash

PW=$1

if [ -z "$PW" ];
then
	printf "\nNo password set; please provide a password\n"
	exit 1
fi

./generate-Dockerfile.sh --python-only --password $PW

# change the default port of jupyter to be read from environment variable
sed -i -e 's/8888/int(os.getenv("JPY_PORT"))/g' ./.build/jupyter_notebook_config.py
