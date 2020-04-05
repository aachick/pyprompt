#!/usr/bin/env bash

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

echo "export PYTHONSTARTUP=$HOME/.pyrc" >> $HOME/.zshrc

source $HOME/.zshrc

