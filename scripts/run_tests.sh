#!/bin/bash
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Build the makefile
drush make --working-copy example.make $HOME/.build/$PNAME
cd $HOME/.build/$PNAME
git add .
git commit -a -m "Automatic makefile build by Travis CI"
git push origin master

# This is where you run your tests, be they SimpleTest, Casper, Behat,
# or otherwise. Here's a SimpleTest example. I've found that drush
# likes to exit with odd codes if you run multiple classes at once.
# You may have to run one class at a time.
#
# drush @pantheon.$PNAME.$PSITE test-run MyTestClass --strict=0
# drush @pantheon.$PNAME.$PSITE test-run MyTestClass2 --strict=0
