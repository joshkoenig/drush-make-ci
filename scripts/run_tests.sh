#!/bin/bash
# Set things up
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Wipe out the DB
drush psite-ewipe $PUUID $PENV -y

# Insure we are in SFTP mode for a clean install
drush psite-cmode $PUUID $PENV sftp

# Install
drush @pantheon.$PNAME.$PENV si --account-pass=$RANDPASS --site-name="Travis Did It" -y

# TODO: bhat test
