#!/bin/bash

# Dynamic hosts through Pantheon mean constantly checking interactively
# that we mean to connect to an unknown host. We ignore those here.
echo "StrictHostKeyChecking no" > ~/.ssh/config

# Install Drush and Behat
composer install
# Use that as our path
export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"

# Install Terminus.
git clone https://github.com/pantheon-systems/terminus.git $HOME/.drush/terminus
cd $HOME/.drush/terminus
composer update --no-dev -v
drush cc drush -v

# Setup step 1: Terminus and aliases
drush pauth $PEMAIL --password=$PPASS
drush paliases

git config --global user.email "bot@getpantheon.com"
git config --global user.name "Pantheon Automation"


# Build the makefile into a separate dir so it is a distinct git working copy.
cd $TRAVIS_BUILD_DIR
git clone ssh://codeserver.dev.$PUUID@codeserver.dev.$PUUID.drush.in:2222/~/repository.git $HOME/.build/repo
drush make example.make $HOME/.build/$PNAME

# Git history switcharoo to generate a specific dif-set.
mv $HOME/.build/repo/.git $HOME/.build/$PNAME/.git
cd $HOME/.build/$PNAME

# Output of the diff vs upstream.
git status

# Guard against permissions on sites/default
chmod u+w sites/default

# Make sure we are in git mode
drush psite-cmode $PUUID $PENV git

# Push it real good.
git add .
git commit -a -m "Makefile build by CI: $TRAVIS_COMMIT"
git push origin master
