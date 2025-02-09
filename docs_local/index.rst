.. mylabnotebook documentation master file, created by
   sphinx-quickstart on Sun Feb  9 11:06:12 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


Tutorial: How to create a lab notebook
======================================


.. toctree::
   :maxdepth: 2
   :caption: Contents:


source: https://github.com/chrplr/mynotebook

site: https://chrplr.github.io/mynotebook


Imagine writing your notes, papers, etc. using a simple text format
(e.g. `Markdown <https://www.markdownguide.org/>`__), in a local folder,
and sharing them on the internet in just a few commands.


This is what we propose to demonstrate here, using
`Sphinx <https://www.sphinx-doc.org/>`__ and `GitHub
Pages <https://pages.github.com/>`__.

This is based on `Nicolás Gravel <https://nicogravel.github.io/>`__ idea (see <https://nicogravel.github.io/UNICOG_ResearchLog/html/index.html>)

Here are some examples of websites generated in this way:

- 

-  


Pre-requisites:
---------------

1. `Git <https://git-scm.com/>`__ [#]_

2. `Python <http://python.org>`__, wtih the additional modules:
   ::

      markdown sphinx sphinx-disqus sphinxcontrib-bibtext alabaster myst-parser

(If you want to avoid cluttering your python environement, you can
install these in a new virtual environment. We show how to do that
below.)

3. An account at http://github.com. Sign up there if you do not already
   have one. See [#]_


4. TODO: Have an account at http://disqus.com

.. note::
   This tutorial assumes that you know how to enter and execute commands in
   a terminal and to navigate the directories using ``cd``, ``ls``,… (see,
   e.g., https://linuxcommand.sourceforge.io/index.php).


Setting up the folder for the notebook
--------------------------------------

Let us first create and initialize a new folder where the notebook will
reside:

::

   mkdir mynotebook
   cd mynotebook
   git init 
   echo "edit files in docs_local" > README.md
   mkdir docs docs_local
   echo ".venv/" >.gitignore 
   git add .
   git commit -m My first commit'

If you do not already have Sphinx installed in your python system, you
may install it, for exameple in a local virtualenvironement

::

   python -m venv .venv
   source .venv/bin/activate
   pip install markdown sphinx sphinx-disqus sphinxcontrib-bibtext alabaster myst-parser

Setting up Sphinx
+++++++++++++++++

Following instructions from
https://www.sphinx-doc.org/en/master/usage/quickstart.html

::

   cd docs_local
   sphinx-quickstart   # enter the project name and your name when asked, accept all defaults

Then to generate the html pages (from the `index.rst` file) 

::

   make html

You can check the result with

::

   xdg_open _build/html/index.html  

Or by opening a web server locally

::

   cd _build/html
   python http.server
   # open ``http://localhot:8000`` in a web browser


Creating documents
------------------

``index.rst`` is the root of your notebook.

You can create markdown (``.md``) or ReST (``.rst`` files) in docs and
link them in ``index.rst``.

You can put your images, pdf, resources in ``_static`` and link them in
your documents:

::

    ![MyFigure](_static/figure1.png)


TODO: develop this part! Explain how to document python code, add disqus comments, ...


   
When done editing, all you have to do to regenerate the site is to type

::

   make html

The results is in ``_build/html/index.html``
   
.. note::
   If you want, you can also create a pdf with ``make latexpdf``.



Exporting to github and publishing the notebook
-----------------------------------------------

To link your local folder to GitHub, sign in https://github.com and create a new repository, e.g. ``mynotebook``, linked to the current existing folder:

::

   git remote add origin git@github.com:chrplr/mynotebook.git
   git branch -M main
   git push -u origin main
   git remote -v   # check 

On the github page of the project (in the ‘Code’ view), click on ``Settings``. Go
to Pages, in the section ``build and deployment`` select branch ``main`` and subfolder ``docs``.

TODO: insert screenshoot of gihub Pages settings here


After a few minutes, you should see your web site at http://yourlogin.github.io/yourproject


Updating the web site
---------------------

When done, in the ``docs_local`` folder

::

   cd docs_local
   make html
   cd ..
   rsync -a --delete docs_local/_build/html/ docs
   git add .
   git commit -m ''
   git push




.. [#] If you are using Windows, install `Git for Windows <(https://gitforwindows.org/>`__ which also provides ``Git Bash``, the terminal/shell that will allow you to enter the command lines described in this document.
.. [#] To avoid having to authentificate everytime you synchronize your files with GitHub, it is recommended to provide your public ssh key (``~/.ssh/xxxxx.pub``) to GitHub.com (in the parameters of your presonal account, in the submenu ``Settings/SSH and GPG keys``)
