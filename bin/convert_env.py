#!/usr/bin/env python 

import yaml
import argparse
import sys

def parse_conda_yaml_to_requirements(file_path):
    
    # Load YAML file
    with open(file_path, 'r') as f:
        yaml_dict = yaml.safe_load(f)

    # Initialize an empty list to hold the packages
    requirements = []

    # Loop through dependencies
    for dependency in yaml_dict.get("dependencies", []):
        # Check if the dependency is a dictionary (as in the case of pip dependencies)
        if isinstance(dependency, dict):
            for key, value in dependency.items():
                if key == 'pip':
                    for pip_dependency in value:
                        requirements.append(pip_dependency)
        else:
            dep, *_ = re.split('[<>=]',s)
            if dep != 'python':
                requirements.append(dependency)
            

    return requirements
            
def main():
    parser = argparse.ArgumentParser(description="Convert a conda YAML file to a requirements.txt list.")
    parser.add_argument("file", help="The path to the conda YAML file.")
    args = parser.parse_args()

    # Parse the YAML file and get requirements
    requirements = parse_conda_yaml_to_requirements(args.file)

    # Write to stdout
    for requirement in sorted(requirements):
        sys.stdout.write(f"{requirement}\n")

if __name__ == "__main__":
    main()
    