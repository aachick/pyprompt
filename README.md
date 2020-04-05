# pyprompt

A futile project customizing python's interactive prompt. 

This is for people on non-Windows systems that miss the Windows prompt.

* **Step 1**: Add the prompt configuration in a file name `~/.pyrc`. It must be readable.

```bash
tee $HOME/.pyrc <<EOF
import os
import socket
import sys


def dynamic_prompt():
	prompt = os.getcwd().replace(os.sep, '\\')
	if prompt[0] == '\\':
		host = socket.gethostname()
		prompt = host + ':' + prompt
	return prompt + '>'


class prompt:

	def __str__(self):
		return dynamic_prompt()

p = prompt()
sys.ps1 = p
EOF
```

* **Step 2**: Export python's `PYTHONSTARTUP` environment variable to point to the previously created file in your shell configuration file:

```bash
echo "export PYTHONSTARTUP=$HOME/.pyrc" >> $HOME/.zshrc
```

* **Step 3**: Enjoy your new prompt when using python in interactive mode! The prompt also changes when you change directories in python's REPL.
