#!/bin/bash
# Destroy the Pantheon environment
drush psite-edelete $PUUID $PSITE -y

# Delete the git branch we created.
cd $TRAVIS_BUILD_DIR; git push pantheon :$PSITE
