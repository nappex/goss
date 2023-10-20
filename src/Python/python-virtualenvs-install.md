---
Title: Install python and handle virtual environments on MacOS
Date: 2020-11-25
Category: Python
Tags: python, intermediate
Slug: python-virtualenvs-installation
Authors: David
Summary: How to handle different versions of python and virtual environments on MacOS
Status: published
---

[TOC]

# Intro

# Install python to MacOS

There are two main ways how to install python to MacOS:

1. Easy way for beginner - install by official package download from [python.org](https://www.python.org/downloads/)

1. Advanced way, but better - install with Homebrew `$ brew`

1. Master way for developer - install different versions of python via manager [pyenv](https://github.com/pyenv)


In this article are mentioned ways 2. and 3.

## Homebrew

### What is Homebrew

Homebrew is a free and open-source software **package management** system that simplifies the installation of software on Apple's macOS operating system and Linux. [WIKIPEDIA](https://en.wikipedia.org/wiki/Homebrew_(package_manager))

It is same package manager as **apt** in Debian or **dnf** in Fedora distro.

### What is Homebrew Cask

[Homebrew Cask](https://github.com/Homebrew/homebrew-cask) extends Homebrew and brings its elegance, simplicity, and speed to the installation and management of **GUI macOS applications** such as Atom and Google Chrome.

### Why Homebrew

With using homebrew you have these benefits:

* better overview about your installed software
* comfortable installation and uninstallation process of software
* less probability that you destroy other things by installation process
* your MacOS can be in better condition, it simplier to hold your system clean with homebrew

### Install Homebrew to MacOS

Detailed installation steps are described in [Homevbrew-docs](https://docs.brew.sh/Installation)

Requirements:

1. A 64-bit Intel CPU
1. macOS Mojave (10.14) (or higher)
1. A Bourne-compatible shell for installation (bash or zsh)
1. Command Line Tools (CLT) for Xcode

If you own macOS you will meet criteria 1 - 3 for sure.

But point 4. must not be meet.

So to install Command Line Tools fo Xcode just write to terminal:

```shell
$ xcode-select --install
```

Next step is install homebrew package manager:

```shell
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Finally check if installation was success

```shell
$ brew doctor
Your system is ready to brew.
```

### How to use homebrew

#### Some basic command

##### brew list

Shows you what is installed

```shell
$ brew list
```

resp. for cask

```shell
$ brew list --cask
```

##### brew install

```shell
$ brew install python3
```

resp.

```shell
$ brew uninstall python3
```

#### How to keep your macOS clean

Below are common steps to keep your brew clean:

Steps are take from this article [KEEP MACOS CLEAN](https://medium.com/@waxzce/keeping-macos-clean-this-is-my-osx-brew-update-cli-command-6c8f12dc1731)

##### brew update

Update command will update the local base of available packages and versions, to be able to know what is updatable.

```shell
$ brew update
```

##### brew upgrade

It actually installs new version of outdated packages

```shell
$ brew upgrade
```

##### brew cleanup -s

By default, brew keeps all versions of the software, and you can link the one you want.

This allow you to keep only linked versions **(by default, the last)** and save some disk space.

This cleanup will apply to homebrew-cask also.

Homebrew cask is a brew extension for GUI and binary packages, some software are installed with it for simplicity of updates.

```shell
$ brew cleanup -s
```

##### brew doctor and brew missing

Will show you any problem with your brew installation, it will help a lot to maintain a healthy system all the time.

```shell
$ brew doctor
$ brew missing
```


## Install python via brew

With homebrew you can install latest version of python3.

```shell
$ brew install python3
```

If you want to install python2

```shell
$ brew install python@2
```

Installation Python with brew has disadvantage that we want to install multiply versions of python 3 it is very painfull process.

## Manage different version of python

For managing different versions of python it is handy to know some commands which will help you to understand what is happened in background.

Check what version of python is used:

```shell
$ python -V

Python 2.7.16
```

or

```shell
$ python3 --version

Python 3.9.0
```

If we want to check where is situated executable file of python which we promt `python` in terminal we will find out with:

```shell
$ which python

/usr/bin/python
```

or

```shell
$ which python3

/usr/local/bin/python3
```

### With brew

Theres is no way to install mulitply version of python 3 with homebrew.

### With pyenv

[Pyenv](https://github.com/pyenv/pyenv) is simple Python version management. This tool was created because of painfull process when we need multiply versions of python on one PC. If we have several project where we needs specific version of python on each, then pyenv comes to scene.

#### Install pyenv with homebrew
pyenv can be installed with homebrew easily:

```shell
$ brew install pyenv
```

After installation pyenv with brew to macOS we have to make some settings for properly run pyenv.

Next step is set `pyenv init` to end of config file of your shell. This will ensure atuocompletion and enable shims.

* for **zsh**

```shell
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
```

* for **bash**

```shell
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
```

Some systems (Ubuntu or Fedora) with bash use for config `.bashrc` instead of `.bash_profile`


When `pyenv init` with `echo` **restart** your shell:

```shell
$ exec "$SHELL"
```

or

```shell
$ source ~/.zshrc
```

It is highly recommended to install with brew other dependecies for installing python with `pyenv`.

So before installing any python to pyenv, install these dependecies:

```shell
$ brew install openssl readline sqlite3 xz zlib
```

After installation of these dependecies, brew write message for zlib:

**zlib** is keg-only, which means it was not symlinked into `/usr/local`,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

For compilers to find zlib you may need to set:
```shell
$ export LDFLAGS="-L/usr/local/opt/zlib/lib"
$ export CPPFLAGS="-I/usr/local/opt/zlib/include"
```

For pkg-config to find zlib you may need to set:
```shell
$ export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
```

It is not necessary to set up. Set these variables just if problems occured

Finally we can install certain version python with pyenv

```shell
$ pyenv install 3.8.6
```

If we want se what is installable prompt:

```shell
$ pyenv install --list
```

If we want to set certain version of python as global version prompt:

```shell
$ pyenv global 3.8.6
```

If we want to see installed versions:

```shell
$ pyenv versions

  system
* 3.8.6 (set by /Users/user_1/.pyenv/version)
```

system = python2 on macOS

Now prompt:

```shell
$ which python3

/Users/user_1/.pyenv/shims/python3
```

Sometimes `rehash` is needed,
if your output is `/usr/local/bin/python3` then prompt:

```shell
$ pyenv rehash
```

**Rehashes shims:**

From time to time you'll need to rebuild your shim files. Doing this on init makes sure everything is up to date. You can always run pyenv rehash manually.

If everything is set up correctly, then the python source should be located in `shims`


#### Settings of PATH

Configuration of PATH should be done automatically by `pyenv init`.

Sometimes is necessary to set up path of `shims` manually to variable `PATH` of shell configuration. We have to add configuration of `PATH` above the code of `pyenv init` in shell configuration file (.zshrc, .bashrc, .bash_profile).

Define environment variable PYENV_ROOT to point to the path where pyenv repo is cloned and add `$PYENV_ROOT/bin` to your `$PATH` for access to the pyenv command-line utility.

* For bash:
```shell
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
```

* For Ubuntu Desktop:
```shell
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
```
* For Zsh:
```shell
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
```

#### Advanced configuration

Check [Advanced configuration of pyenv - GitHub](https://github.com/pyenv/pyenv#advanced-configuration)

# Virtual environments

## Why use virtual environments

Because we need for each project different verions of packages.

There is problem - managing Python dependencies. Python has one big problem - you can’t have multiple versions of the same package (e.g. pandas) installed on one version of python installed on your computer.

So each time you run pip install <some_package>, pip will check if that package is already installed on your computer. If it’s not, it will install the latest version.

Text above taken from [Python developer's toolkit](https://pycon.switowski.com/02-packages/virtualenv/)

## How use virtual environment

## Tools for comfortable use of virtual environments

### virtualwrapper

See [virtualwrapper documentation](https://virtualenvwrapper.readthedocs.io/en/stable/install.html) for more information

#### Installation

Virtualenvwrapper should be installed on your main python version and nothing else.
The rest of all your programing magic and installation you have to make with with new virtual environment of python created by `virtualenvwrapper` or with built-in `venv`.

If you don't want to install virtualwrapper on your OS python then there are options:

* [pyenv](https://github.com/pyenv/pyenv)
* [pipx](https://github.com/pipxproject/pipx)

with these tools you are able to create new virtual envinronment as your main python and there is no need to handle with OS python. So your OS python will stay untouched.

Installation command:

```shell
$ python3 -m pip install virtualenvwrapper
```

#### Usage

Main configuration of virtualenvwrapper

1. central dir where are saved all yours virtual environments. This DIR is called `WORKON_HOME` and default it should be set as `$HOME/.virtualenvs`
1. Another central dir is where are save all yours development project - your sources of code of each project. This DIR is called `PROJECT_HOME` and default path will be in most cases `$HOME/Devel`
1. location of your `virtualenvwrapper.sh` in most cases it will be `/usr/local/bin/virtualenvwrapper.sh` but if you want to be sure just prompt `$ which virtualenvwrapper.sh`
1. this point is not in documentation but in my case I have to configure `VIRTUALENVWRAPPER_PYTHON`, because my default configuration was `VIRTUALENVWRAPPER_PYTHON=/usr/bin/python` that is path to my OS python2 in my case, but I've installed virtualenvwrapper to my OS python3 which is located in `/usr/local/bin/python3`

So I added this configuration to my .zshrc file:

```
~/.zshrc

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/Python/develop
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
```

Basic workflow of virtualenvwrapper:

You have one location for your all virtual environments each environments can be linked with some project, so you can create project and connect with certain virtual environment at the start of project. Or you can connected already created project with new environment.

Nice thing is that when you have linked your environment with your project and then you activate your environment with `workon your_env`, wrapper will move you to your project dir automatically.

#### Basic commands

##### WORKON

to activate your virtual environemnt or show your environments

```shell
$ workon

your_env_1
your_env_2
```

The command below will activate your_env if linked to project it will move to your project dir.
```shell
$ workon your_env_1
```

Deactivation env

```shell
$ deactivate
```

##### Create and remove virtual environment

Probably you've already known way to make virtual environment with built-in `venv`
as `$ python -m venv name_your_venv`. Make virtual env with vrtualenvwrapper is very similar but commands are different. At the end you have same virtual env as with built-in `venv`.

**mkvirtualenv**
Create a new environment, in the WORKON_HOME.

```shell
$ mkvirtualenv your_env_name
```

Options:

* -a option can be used to associate an existing project directory with the new environment.

* -i option can be used to install one or more packages (by repeating the option) after the environment is created.

* -r option can be used to specify a text file listing packages to be installed. The argument value is passed to pip -r to be installed.

```shell
mkvirtualenv -a $HOME/myproject -r $HOME/myproject/requirements.txt -r $HOME/myproject/requirements-dev.txt your_env_name
```

**mktmpenv**

Create a new **temporary** virtualenv in the WORKON_HOME directory.

```shel
$ mktmpenv

This is a temporary environment. It will be deleted when deactivated
```

**rmvirtualenv**

```shell
(mynewenv)$ deactivate
$ rmvirtualenv mynewenv
$ workon
$
```

### pyenv-virtualenv

### pyenv-virtualwrapper

### pipenv

