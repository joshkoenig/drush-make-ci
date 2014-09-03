#!/bin/bash

# We cannot be in a Drupal directory to run aliased drush commands.
cd $HOME

# Authenticate with Pantheon via Terminus.
drush pantheon-auth $PEMAIL --password=$PPASS

# Add Pantheon as a remote to our repo and force push to it.
# $TRAVIS_BUILD_DIR 
cd $TRAVIS_BUILD_DIR

#  Checkout the branch for the site
# $PSITE is defined in the global env settings of travis
git checkout -b $PSITE

# Add the Pantheon site as a remote
git remote add pantheon ssh://codeserver.dev.$PUUID@codeserver.dev.$PUUID.drush.in:2222/~/repository.git
# Push the code to the Pantheon site for build & test
git push --force pantheon $PSITE

# Create a new Pantheon environment using the above branch.
# $PSOURCE is defined in the global env settings of travis
drush psite-ecreate $PUUID $PSITE --source=$PSOURCE || true

# Update our drush aliases file.
drush paliases
# Flush the drupal caches
drush cc drush

# We cannot be in a Drupal directory to run aliased drush commands.
cd $HOME

# When new modules are added to the codebase, updb can sometimes fail (thus
# causing a failed build) because the system table and modules are out of
# sync. We get around this by clearing all caches before attempting anything.
# The "|| true" works around issues where Views and Block conflict during
# cache clears / block rehashes.

# $PSOURCE is defined in the global env settings of travis
drush @pantheon.$PNAME.$PSITE cc all --strict=0 || true

# Run all available updates as if deploying. For now, append the
# --strict=0 option for Drush 6.x compatibility on Pantheon.
drush @pantheon.$PNAME.$PSITE updb -y --strict=0

# Enable additional test dependencies here, like SimpleTest.
drush @pantheon.$PNAME.$PSITE en simpletest -y --strict=0

# If you're using SimpleTest, you'll want to disable verbose logging. This
# ensures no false build failures from file write errors.
drush @pantheon.$PNAME.$PSITE vset -y simpletest_verbose 0 --strict=0
