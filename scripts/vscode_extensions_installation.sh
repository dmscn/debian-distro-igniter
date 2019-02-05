#!/bin/bash

code $(cat ./packages/vscode-extensions.txt|awk '{ print "--install-extension " $1 }')