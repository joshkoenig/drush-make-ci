### Build Status
[![Build Status](https://travis-ci.org/joshkoenig/drush-make-ci.svg?branch=master)](https://travis-ci.org/joshkoenig/drush-make-ci)

drush_make + TravisCI = awesome
======

This is a working example of how you can integrate a drush_make process with Pantheon using TravisCI and some behat testing. Pretty suave!

Feel free to hack this to heck for your own personal use-cases.

#### Hacking Tops

This repo is meant to be run on [TravicCI](https://travis-ci.org), which is free for public GitHub repos (thanks, Travis!). You can be up and running with your own fork in just a few steps.

1. Create a new Pantheon site which is the "target" for your build. Choose the vanilla version of core that you want to use. For this example, that was Drupal 7.

2. You will need to create a new SSH keypair to push code to Pantheon. You can even set up a separate user for this to keep things separate.
  ```
  ssh-keygen -q -f travis-ci-key -t rsa -P '' -C 'travis-ci-integraiton-key'
  ```

3. Add the resulting ```travis-ci-key.pub``` to the Pantheon user account you want Travis acting as, and use [```travis encrypt_file```](http://docs.travis-ci.com/user/encrypting-files/) option to encrypt and place in the test repo.

4. Update ```.travis.yml``` with the ```PUUID``` and ```PNAME``` values for your own site.

5. Use the (```travis encrypt```)[http://docs.travis-ci.com/user/build-configuration/#Secure-environment-variables] command to add secure/secret environment variables to ```.travis.yml``` for ```PEMAIL``` (your Pantheon user email) and ```PPASS``` (the user passsword).

6. Still in ```.travis.yml```, update the ```before_install``` step  to use the key you added in step 3.

7. Finally, update ```behat.yml``` with your own ```base_url``` for testing.

At this point you can push to master and the test should run as-is on your own repo. You're free to start hacking on the make file, the install steps, and the tests.

Pull requests are welcome!
