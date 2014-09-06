#!/bin/bash
# Set things up
export PATH="$HOME/.composer/vendor/bin:$PATH"
RANDPASS=$(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )
git config --global user.email "bot@getpantheon.com"
git config --global user.name "Pantheon Automation"


# Build the makefile
drush make --working-copy example.make $HOME/.build/$PNAME
cd $HOME/.build/$PNAME
git add .
git commit -a -m "Automatic makefile build by Travis CI"
git push origin master

# Wipe out the DB
drush psite-ewipe $PUUID $PENV -y

# Install
drush paliases
drush @pantheon.$PNAME.$PENV si si --account-pass=$RANDPASS --site-name="Travis Did It" -y

# TODO: bhat test
