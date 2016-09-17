#!/bin/sh

# Get CrackMapExec for Pentesting Windows environments
cd ~/tools
git clone https://github.com/byt3bl33d3r/CrackMapExec.git
cd CrackMapExec
mkvirtualenv CrackMapExec
workon CrackMapExec
pip install --upgrade -r requirements.txt
deactivate



cd -  # Go back to default directory
