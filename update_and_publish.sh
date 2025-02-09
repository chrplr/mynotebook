#! /bin/bash
set -e  i# to exist as soon as a command fails
cd docs_local
make html
cd ..
rsync -a --delete docs_local/_build/html/ docs
touch docs/.nojekyll
git add .
git commit -m "`date`"
git push

