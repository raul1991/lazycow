#!/bin/bash

sed -e 's/#SCRIPT-NAME#/'"$1"'/g' ./templates/scaffold.txt > bin/lazycow-$1.sh