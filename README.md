This is a template to create a notebook such as the ones at:

* 
*

We rely on [sphinx](https://www.sphinx-doc.org/) and [github pages](https://pages.github.com/).

# Setting up the folder for the notebook

First we initialize a folder for the notebook

    mkdir mynotebook
    cd mynotebook
    git init 
    echo "This is my notebook" > README.md
    mkdir docs 
    echo ".venv/" >.gitignore 
    git add .
    git commit -m My first commit'

If you do not already have sphinx installed in your python system, you may install it, for exameple in a local virtualenvironement
 
    python -m venv .venv
    source .venv/bin/activate
    pip install markdown sphinx sphinx-disqus sphinxcontrib-bibtext alabaster myst-parser

## Setting up sphinx

Following instructions from <https://www.sphinx-doc.org/en/master/usage/quickstart.html>

    cd docs
    sphinx-quickstart   # answer 'y' when proposed to create subfolders `source` and `build`


## Link to github pages:


    Go to git hub, create a new repository, e.g. `mynotebook`, and link it to the local repo:

git remote add origin git@github.com:chrplr/mynotebook.git
git branch -M main
git push -u origin main

# Write

Go to 
