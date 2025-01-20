import sys
import os

def search_file():
    counter = 0
    for roots, dirs, files in os.walk(sys.argv[1]):
        for file in files:
            if file.endswith(".py"):
                print(f'os.path.join(root, file) = {file}')
                counter += 1
    print(f'Found {counter} files')

search_file()