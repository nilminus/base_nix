#!/bin/sh
pip install virtualenv      # Not installed already?


# Get CrackMapExec for Pentesting Windows environments
git clone https://github.com/byt3bl33d3r/CrackMapExec.git
cd CrackMapExec
virtualenv venv
source venv/bin/activate
pip install --upgrade -r requirements.txt
deactivate



cd -  # Go back to default directory
