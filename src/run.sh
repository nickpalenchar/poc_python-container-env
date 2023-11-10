#!/usr/bin/env sh

main() {
   docker run \
    -v "$PWD":"$PWD" \
    -w "$PWD" \
    python:3.11-alpine python -c '
import os
import shutil

user_files = os.getcwd()

os.chdir(os.path.sep)
os.makedirs(os.path.join("main"))
with open(os.path.join("main", "__init__.py"), "w"):
    pass

shutil.copytree(user_files, os.path.join("main", "src"))

print(os.listdir(os.path.join("main", "src")))
from main.src import app
'
}

main $@

