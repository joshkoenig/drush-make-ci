#!/bin/bash

## Clone terminus
git clone https://github.com/pantheon-systems/terminus.git $HOME/.drush/terminus
## Change to the terminus directory
cd $HOME/.drush/terminus
# Run composer in case there are any updates
composer update --no-dev 
