

See <http://chrplr.github.com/mynotebook>

Based on <https://nicogravel.github.io/UNICOG_ResearchLog/html/index.html>


The source files are in `docs_local`

To generate the pages locally

    cd docs_local
    make html
    xdg-open _build/html/index.html

To publish at <https://chrplr.github.io/mynotebook>
 
    rsync -a --delete docs_local/_build/html/ docs
    touch docs/.nojekyll
    git add .
    git commit -m "`date`"
    git push


Note: these two operations are realized by the script `update_and_publish.sh`

