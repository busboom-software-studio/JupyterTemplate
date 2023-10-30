#!/bin/sh 
# Run jupyter notebook

if [ -d .venv ]; then 
    source .venv/bin/activate 
    jupyter-lab & 
    echo 'Starting jupyterlab in venv environment'
elif [ -d .env ]; then
    conda run -p ./.env  jupyter-lab & 
    echo 'Starting jupyter lab in conda environment'
else
    echo "ERROR Did not find .venv, nor .env virtual directories"
fi 
