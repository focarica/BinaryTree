#!/usr/bin/env sh

set -e

npm run serve

cd dist

git init
git add -A
git commit -m 'novo deploy'
git push -f git@github.com:focarica/BinaryTree.git master:githubPages

cd -