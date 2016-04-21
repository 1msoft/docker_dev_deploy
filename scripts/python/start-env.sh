#!/bin/sh

# setup virtualenv
if [ -d ".env" ]; then
    # activate env only 
    source .env/bin/activate
else
    # create virtualenv for this project.
    pip install virtualenv
    virtualenv .env
    source .env/bin/activate
    # install requirements
    pip install -r requirements.txt  
    # not push to github
    echo ".env" >> .gitignore  
fi