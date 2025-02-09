The source files are in `docs_local`

To generate the pages locally

    cd docs_locals
    make html
    xdg-open _build/html/index.html

To publish at <https://chrplr.github.io/mynotebook>
 
    rsync -a --delete docs_local/_build/html/ docs
    touch docs/.nojekyll
    git add .
    git commit -m ''
    git push

