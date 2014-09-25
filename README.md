#### Build Status
[![Build Status](https://travis-ci.org/joshkoenig/drush-make-ci.svg?branch=master)](https://travis-ci.org/joshkoenig/drush-make-ci)

```drush_make + TravisCI = awesome```
======

This is a working example of how you can integrate a drush_make process with [Pantheon](https://www.getpantheon.com) using [TravisCI](https://travis-ci.org) and some behat testing. Pretty suave!

Feel free to hack this to heck for your own personal use-cases.

#### Getting Started

This repo is meant to be run on [TravisCI](https://travis-ci.org), which is free for public GitHub repos (thanks, Travis!). You can be up and running with your own fork in just a few steps.

1. Create a new Pantheon site which is the "target" for your build. Use the vanilla version of core that you want to use. For this example, that was Drupal 7.

2. You will need to create a new SSH keypair to push code to Pantheon.
  ```
  ssh-keygen -q -f travis-ci-key -t rsa -P '' -C 'travis-ci-key'
  ```

3. Add the resulting ```travis-ci-key.pub``` to the Pantheon user account you want Travis acting as. You can also set up a separate user for this to keep things separate more separate. I have mine acting as "josh+travis@getpantheon.com" to keep it on lockdown.

4. Use [```travis encrypt_file```](http://docs.travis-ci.com/user/encrypting-files/) option to encrypt and place in the ci repository. This will allow it to push code to pantheon as the user you set up in #3.

5. Update ```.travis.yml``` with the ```PUUID``` and ```PNAME``` values for your own site.

6. Use the (```travis encrypt```)[http://docs.travis-ci.com/user/build-configuration/#Secure-environment-variables] command to add secure/secret environment variables to ```.travis.yml``` for ```PEMAIL``` (your Pantheon user email) and ```PPASS``` (the user passsword).

7. Still in ```.travis.yml```, update the ```before_install``` step  to use the key you added in step 3.

8. Finally, update ```behat.yml``` with your own ```base_url``` for testing.

At this point you can push these changes to the ci repo up to github, log into Travis, add the ci repo, and the test should run.

You're free to start hacking on the make file, the install steps, and the tests.

Pull requests are welcome!
