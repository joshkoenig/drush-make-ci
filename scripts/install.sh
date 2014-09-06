#!/bin/bash

# Dynamic hosts through Pantheon mean constantly checking interactively
# that we mean to connect to an unknown host. We ignore those here.
echo "StrictHostKeyChecking no" > ~/.ssh/config

# Install Drush and Behat
composer global require drush/drush:6.2.0 -v
composer global require behat/behat:3.0.*@stable -v
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Install Terminus.
git clone https://github.com/pantheon-systems/terminus.git $HOME/.drush/terminus
cd $HOME/.drush/terminus
composer update --no-dev -v
drush cc drush -v

# Install additional test dependencies here (like Casper, Behat, etc).

