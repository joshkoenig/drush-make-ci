#!/bin/bash
# Set things up
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Wipe out the DB
drush psite-ewipe $PUUID $PENV -y

# Install
drush @pantheon.$PNAME.$PENV si si --account-pass=$RANDPASS --site-name="Travis Did It" -y

# TODO: bhat test
