import sys
import os
print('Hello from file')

print(f'SCRIPTS name: , {sys.argv[0]}')
print(f'ARGUMENTS: , {sys.argv[1:]}')

home_dir = os.environ.get("HOME")

print(f'my home directory: {home_dir}')
os.environ['MY_VAR'] = 'hello from environment'

print(f'My variable: {os.environ["MY_VAR"]}')
