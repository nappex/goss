---
Title: Confused about tools for virtual environment?
Date: 2020-9-2
Category: Python
Tags: python, beginners, virtualenv
Slug: virtual-environments-tools
Authors: David
Summary: Article how to know a huge amount of tools for working with virtual environments
Status: draft
---

[TOC]


Don't feel obligated to use pipenv. It is generally recommended to help people who are intimidated by virtualenvs, and is not appropriate for all use cases. It actually relies on pip and virtualenv, so virtualenv is not going away. There are also some common criticisms of pipenv. See this blog post for some (examples)[https://chriswarrick.com/blog/2018/07/17/pipenv-promises-a-lot-delivers-very-little/].

virtualenv (venv), on the other hand, is bundled with python itself, so is certainly more stable, widespread and canonically correct. So you won't run into problems like (this)[https://github.com/pypa/pip/issues/5854].

The Python Packaging Authority recommends using virtualenv "to isolate application specific dependencies from a shared Python installation". If anything, there are more bugs and drawbacks to worry about using pipenv.

FYI right now your using venv not virtualenv. Venv is available in the standard Python library in Python 3.3 and later, virtualenv is a third party package. Both accomplish the same thing so just keep using whatever your using.

venv/virtualenv is packaged with Python and will basically be around forever, since things that are shipped with Python are very hard to change or remove.

pipenv is just a wrapper that combines pip and virtualenv.


# venv vs. virtualenv

https://virtualenv.pypa.io/en/stable/

https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe

venv is a package shipped directly with python 3. So you don't need to pip install anything.

virtualenv instead is an independent library available at https://virtualenv.pypa.io/en/stable/ and can be install with pip.

They solve the same problem and work in a very similar manner.

If you use python3 I suggest to avoid an "extra" dependancy and just stick with venv

Your error is probably because you use Python2/pip2



312

I would just avoid the use of virtualenv after Python3.3+ and instead use the standard shipped library venv. To create a new virtual environment you would type:

$ python3 -m venv <MYVENV>

virtualenv tries to copy the Python binary into the virtual environment's bin directory. However it does not update library file links embedded into that binary, so if you build Python from source into a non-system directory with relative path names, the Python binary breaks. Since this is how you make a copy distributable Python, it is a big flaw. BTW to inspect embedded library file links on OS X, use otool. For example from within your virtual environment, type:

$ otool -L bin/python
python:
    @executable_path/../Python (compatibility version 3.4.0, current version 3.4.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1238.0.0)

Consequently I would avoid virtualenvwrapper and pipenv. pyvenv is deprecated. pyenv seems to be used often where virtualenv is used but I would stay away from it also since I think venv also does what pyenv is built for.

venv creates virtual environments in the shell that are fresh and sandboxed, with user-installable libraries, and it's multi-python safe. Fresh because virtual environments only start with the standard libraries that ship with python, you have to install any other libraries all over again with pip install while the virtual environment is active. Sandboxed because none of these new library installs are visible outside the virtual environment, so you can delete the whole environment and start again without worrying about impacting your base python install. User-installable libraries because the virtual environment's target folder is created without sudo in some directory you already own, so you won't need sudo permissions to install libraries into it. Finally it is multi-python safe, since when virtual environments activate, the shell only sees the python version (3.4, 3.5 etc.) that was used to build that virtual environment.

pyenv is similar to venv in that it lets you manage multiple python environments. However with pyenv you can't conveniently rollback library installs to some start state and you will likely need admin privileges at some point to update libraries. So I think it is also best to use venv.

In the last couple of years I have found many problems in build systems (emacs packages, python standalone application builders, installers...) that ultimately come down to issues with virtualenv. I think python will be a better platform when we eliminate this additional option and only use venv.

1494
PyPI packages not in the standard library:

    virtualenv is a very popular tool that creates isolated Python environments for Python libraries. If you're not familiar with this tool, I highly recommend learning it, as it is a very useful tool, and I'll be making comparisons to it for the rest of this answer.

    It works by installing a bunch of files in a directory (eg: env/), and then modifying the PATH environment variable to prefix it with a custom bin directory (eg: env/bin/). An exact copy of the python or python3 binary is placed in this directory, but Python is programmed to look for libraries relative to its path first, in the environment directory. It's not part of Python's standard library, but is officially blessed by the PyPA (Python Packaging Authority). Once activated, you can install packages in the virtual environment using pip.

    pyenv is used to isolate Python versions. For example, you may want to test your code against Python 2.7, 3.6, 3.7 and 3.8, so you'll need a way to switch between them. Once activated, it prefixes the PATH environment variable with ~/.pyenv/shims, where there are special files matching the Python commands (python, pip). These are not copies of the Python-shipped commands; they are special scripts that decide on the fly which version of Python to run based on the PYENV_VERSION environment variable, or the .python-version file, or the ~/.pyenv/version file. pyenv also makes the process of downloading and installing multiple Python versions easier, using the command pyenv install.

    pyenv-virtualenv is a plugin for pyenv by the same author as pyenv, to allow you to use pyenv and virtualenv at the same time conveniently. However, if you're using Python 3.3 or later, pyenv-virtualenv will try to run python -m venv if it is available, instead of virtualenv. You can use virtualenv and pyenv together without pyenv-virtualenv, if you don't want the convenience features.

    virtualenvwrapper is a set of extensions to virtualenv (see docs). It gives you commands like mkvirtualenv, lssitepackages, and especially workon for switching between different virtualenv directories. This tool is especially useful if you want multiple virtualenv directories.

    pyenv-virtualenvwrapper is a plugin for pyenv by the same author as pyenv, to conveniently integrate virtualenvwrapper into pyenv.

    pipenv aims to combine Pipfile, pip and virtualenv into one command on the command-line. The virtualenv directory typically gets placed in ~/.local/share/virtualenvs/XXX, with XXX being a hash of the path of the project directory. This is different from virtualenv, where the directory is typically in the current working directory. pipenv is meant to be used when developing Python applications (as opposed to libraries). There are alternatives to pipenv, such as poetry, which I won't list here since this question is only about the packages that are similarly named.

Standard library:

    pyvenv is a script shipped with Python 3 but deprecated in Python 3.6 as it had problems (not to mention the confusing name). In Python 3.6+, the exact equivalent is python3 -m venv.

    venv is a package shipped with Python 3, which you can run using python3 -m venv (although for some reason some distros separate it out into a separate distro package, such as python3-venv on Ubuntu/Debian). It serves the same purpose as virtualenv, but only has a subset of its features (see a comparison here). virtualenv continues to be more popular than venv, especially since the former supports both Python 2 and 3.

Recommendation for beginners:

This is my personal recommendation for beginners: start by learning virtualenv and pip, tools which work with both Python 2 and 3 and in a variety of situations, and pick up other tools once you start needing them.


https://realpython.com/pipenv-guide/