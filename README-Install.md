# JupyterTemplate

Template for running Jupyter Notebooks


# New Project Setup


## Installation

First *do not clone th the JupyterTemplate repo.* Use the Gree 'Use this template'
button at the top ( of the root page of the repo)


## Quickstart

If you are lucky, and on a Mac, this might work: 

```
bin/install.sh
bin/start.sh
```



There are two broad ways to get your new project set up, both of which involve
creating a virtual environment for Python and installing packages. 

* You can install a recent version of Python, then create a virtual environment
  and install packages using ``pip``
* You can use ``conda``, which will perform all of these steps at once. 


Conda will give you more options for what tools and extensions you can run, but
the installation is really, really slow. The Python virtual environment is much
faster, but you won't be able to run the Spyder IDE and won't get extra Jupyter
kernels.

## Python Virtual Environments

As of October 2023, Python 3.12 isn't working well with some important
libraries, like PyTorch, so we will install version 3.11

You have several options for installing Python.

* Download it from [the Python
  website](https://www.python.org/downloads/release/python-3116/), then install
  it
* On Mac, [install it with brew](https://brew.sh), ``brew update; brew install
  3.11``

After installing python, you can check that you can access it with. 

```
    which python3.11; python3.11 -V
```

You may have to restart you shell you get the path variables updated so you can access the new Python version.  

*NOTE* Unless you update your ``$PATH``, you may not get this version of Python
when you run ``python`` ( without the version number). Try this to see if you
get two different version of python:

### Create Virtual Env
After cloning this repo, cd into the repository and run:

```
python3.11 -m venv .venv --prompt '<proj_name>'
```

Now when you want to work on this project, ``cd`` into the project directory and
activate this virtual environment with :

```
source .venv/bin/activate
```

Now, the python executable that you used to create the virtual environment
( python3.11) is available as ``python``:

```
$ which python 
.../.venv/bin/python
```  

Additionally, and most importantly, any packages you install will only be
installed into the ``.venv`` directory in this project, so you won't get
version conflicts with other projects. 

### Install packages

Then you should install the base packages


```
pip install -r requirements.txt
```

## Conda

You can also create a new virtual environment with conda. There are several
advantages to using conda, the main one here is that it will be easier to use
the Spyder scientific IDE.

To create the conda environment: 

```
conda env create --prefix ./.env  --file environment.yml
```

Then, to activate the environment:

```
conda activate ./.env
```

Creating the conda environment may be very slow. 




# Tools


## JupyterLab

Jupyterlab is the main program you will be running. From the root of your repository, just run:

```
bin/start.sh
```

This should open up a new browser. If if does not, it will print a URL that you can past into a browser. 


```
jupyter server list
```


When you are done with Jupyter Lab, use "File > Shutdown" to kill the server before you close your window. 


## VSCode


Install the Python and Jupyter extensions and you can run notebooks in VSCode

## 

