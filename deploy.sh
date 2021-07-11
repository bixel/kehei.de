#! /usr/bin/env bash
# taken from pep-dortmund.org, inspired by https://oncletom.io/2016/travis-ssh-deploy/
set -e # exit with nonzero exit code if anything fails

# store password
echo $SSH_PRIV > id_rsa
$(eval ssh-agent)
ssh-add id_rsa
rm id_rsa

# compile the website
# upload site
rsync -rq --links --delete --exclude=".*" \
  --exclude="Gemfile*" --exclude="deploy_key*" --exclude="password-file" . \
  $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
