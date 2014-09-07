### Build Status
[![Build Status](https://travis-ci.org/joshkoenig/drush-make-ci.svg?branch=master)](https://travis-ci.org/joshkoenig/drush-make-ci)

drush_make + TravisCI = awesome
======

This is a working example of how you can integrate a drush_make process with Pantheon using TravisCI and some behat testing. Pretty suave!

Feel free to hack this to heck for your own personal use-cases.

#### Hacking Tops

This repo is meant to be run on [TravicCI](https://travis-ci.org), which is free for public GitHub repos (thanks, Travis!), but to run your own fork you will need to do a few things first.

1. Set up a new Pantheon site which is the "target" for your build. Choose the vanilla version of core that you want to use. For this example, that was Drupal 7.

2. Update ```.travis.yml``` with the ```PUUID``` and ```PNAME``` values for your own site. Also update ```behat.yml``` with your own ```base_url```.

3. You will need to create a new SSH keypair to push code to Pantheon. You can even set up a separate user for this if you like.

4. Use ```travis encrypt_file``` option to place this key in the test repo and update the ```before_install``` step in ```.travis.yml``` to use the key.

At this point the test should run as-is on your own repo, and you're free to start hacking on the make file, the install steps, and the tests.

Pull requests are welcome!
