#!/bin/bash

# Dynamic hosts through Pantheon mean constantly checking interactively
# that we mean to connect to an unknown host. We ignore those here.
echo "StrictHostKeyChecking no" > ~/.ssh/config

# Install Drush and Behat
comopser install
# Use that as our path
export PATH="vendor/bin:$PATH"

# Install Terminus.
git clone https://github.com/pantheon-systems/terminus.git $HOME/.drush/terminus
cd $HOME/.drush/terminus
composer update --no-dev -v
drush cc drush -v

# Install additional test dependencies here (like Casper, Behat, etc).

# Setup step 1: Terminus and aliases
drush pauth $PEMAIL --password=$PPASS
drush paliases

git config --global user.email "bot@getpantheon.com"
git config --global user.name "Pantheon Automation"


# Build the makefile into a separate dir so it is a distinct git working copy.
cd $TRAVIS_BUILD_DIR
drush make --working-copy example.make $HOME/.build/$PNAME
cd $HOME/.build/$PNAME
# Push it real good.
git add .
git commit -a -m "Automatic makefile build by Travis CI"
git push origin master
