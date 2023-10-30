#!/bin/bash

# Function to display help message
help_message() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -c        Force to use conda for environment setup."
    echo "  -v        Force to use virtualenv for environment setup."
    echo "  -h, --help  Display this help message."
    exit 0
}

# Check if the machine is a Mac
if [ "$(uname)" != "Darwin" ]; then
    echo "Why aren't you using a Mac? Questionable choices, my friend."
    exit 1
fi

# Initialize variables
use_conda=""
use_venv=""

# Parse command line arguments
while getopts ":cvh-" opt; do
  case $opt in
    c)
      use_conda=true
      ;;
    v)
      use_venv=true
      ;;
    h)
      help_message
      ;;
    -)
      case "$OPTARG" in
        help)
          help_message
          ;;
        *)
          echo "Invalid option: --$OPTARG" >&2
          exit 1
          ;;
      esac
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Move to parent directory of the script location
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$script_dir/.."

# Function to create environment using conda
create_conda_env() {
    if [ -d ".env" ]; then
        echo "Directory .env already exists. Aborting."
        exit 1
    fi
    conda env create --prefix ./.env --file environ/environment-pinned.yaml
}

# Function to create environment using virtualenv
create_virtual_env() {
    if ! [ -x "$(command -v /usr/local/bin/brew)" ]; then
        echo "Homebrew is not installed. Installing it now."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed. Skipping installation."
    fi
    brew install python@3.11
    echo
    read -p "Enter the project name: " proj_name
    python3.11 -m venv .venv --prompt "$proj_name"
    ./.venv/bin/pip install -r environ/requirements.txt
}

if [ "$use_conda" = true ]; then
    echo "Forcing to use conda for environment setup."
    create_conda_env
elif [ "$use_venv" = true ]; then
    echo "Forcing to use virtualenv for environment setup."
    create_virtual_env
elif command -v conda &>/dev/null; then
    echo "conda is installed. Creating a conda environment."
    create_conda_env
else
    echo "conda is not installed. Using virtualenv instead."
    create_virtual_env
fi

