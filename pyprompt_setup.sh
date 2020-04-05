#!/usr/bin/env bash

usage="<pyprompt_setup.sh> shell-configuration-file"

if [ "$#" -ne 1 ]; then
	echo $usage
	exit 1
fi

conf_file=$1

cat >$HOME/.pyrc <<EOF
import os
import socket
import sys


def dynamic_prompt():
	prompt = os.getcwd().replace(os.sep, '\\\\')
	if prompt[0] == '\\\\':
		host = socket.gethostname()
		prompt = host + ':' + prompt
	return prompt + '>'


class prompt:

	def __str__(self):
		return dynamic_prompt()

p = prompt()
sys.ps1 = p
EOF

echo "export PYTHONSTARTUP=$HOME/.pyrc" >> $conf_file

source $conf_file
