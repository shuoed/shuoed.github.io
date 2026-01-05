#!/bin/fish
set_color green
echo 'Generating Documents...'
set_color normal
if test -d venv
    echo '[+] Virtualenv found, activating...'
else
    echo '[-] Virtualenv not found, installing...'
    python3 -m venv venv
end
source venv/bin/activate.fish
pip install mkdocs pymdown-extensions mkdocs-material
set_color green
echo 'Building documents...'
set_color normal
mkdocs build
set_color green
echo 'Initializing published git...'
set_color normal
cd site
git init
git add -A
git commit -m (date -I)" Deployed"
set_color green
echo 'Pushing to XDU Forensics Wiki...'
set_color normal
git push -f https://forensics.xidian.edu.cn/git/XD-Forensics/WikiPublic.git master
set_color green
echo 'Cleaning...'
set_color normal
cd ..
rm -rf site
set_color green
echo 'Pushing to Source Git...'
set_color normal
git add -A
git commit -m (date -I)" Changed"
git push
set_color green
echo 'Done.'
set_color normal
