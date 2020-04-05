# pyprompt

A futile project customizing python's interactive prompt. 

This is for people on non-Windows systems that miss the Windows prompt.

* **Setup**: Simply run the `pyprompt_setup.sh` script in your terminal. Then, check out the results by using python in interactive mode!

### Explanations

The following snippet sets the prompt variable, `sys.ps1`, as custom prompt object. Because the variable is not a `str`, the `str()` method will be called on the object to render the prompt.

```python
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
```
