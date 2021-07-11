#!/bin/bash
# taken from pep-dortmund.org, inspired by https://oncletom.io/2016/travis-ssh-deploy/
set -e # exit with nonzero exit code if anything fails

# store password
echo $PASSWORD > password-file

# compile the website
# upload site
rsync --password-file password-file -rq --links --delete --exclude=".*" \
  --exclude="Gemfile*" --exclude="deploy_key*" --exclude="password-file" . \
  $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
