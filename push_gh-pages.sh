#!/usr/bin/env bash
cd _site
git config --global user.email $email
git config --global user.name $name
git init
git checkout -b gh-pages
git remote add origin https://$token@github.com/$name/$name.github.io.git
git add .
git commit -m 'Travis CI #$(date +%Y-%m-%d/%T)'
git push -f origin gh-pages
