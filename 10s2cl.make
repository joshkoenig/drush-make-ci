; 10s2cl make file for Pantheon
core = "7.x"
api = "2"

; Drupal
projects[drupal][type] = core
projects[drupal][download][type] = git
projects[drupal][download][url] = git://github.com/pantheon-systems/drops-7.git
projects[drupal][download][branch] = master

; +++++ Modules +++++

projects[admin_menu][version] = "3.0-rc4"
projects[admin_menu][subdir] = "contrib"

projects[configuration][version] = 2.x-dev
projects[configuration][download][revision] = c092a4dab101e32cfed18666ab12b2964bde576c
projects[configuration][download][branch] = 7.x-2.x
projects[configuration][download][url] = http://git.drupal.org/project/configuration.git
projects[configuration][subdir] = "contrib"

projects[module_filter][version] = "2.0-alpha2"
projects[module_filter][subdir] = "contrib"

projects[ctools][version] = "1.4"
projects[ctools][subdir] = "contrib"

projects[profiler_builder][version] = "1.2"
projects[profiler_builder][subdir] = "contrib"

projects[features][version] = "2.0"
projects[features][subdir] = "contrib"

projects[features_builder][version] = "1.x-dev"
projects[features_builder][subdir] = "contrib"

projects[entityreference][version] = "1.1"
projects[entityreference][subdir] = "contrib"

projects[html5_tools][version] = "1.2"
projects[html5_tools][subdir] = "contrib"

projects[elements][version] = "1.4"
projects[elements][subdir] = "contrib"

projects[entity][version] = "1.5"
projects[entity][subdir] = "contrib"

projects[ckeditor][version] = "1.15"
projects[ckeditor][subdir] = "contrib"

projects[views][version] = "3.8"
projects[views][subdir] = "contrib"

projects[views_bulk_operations][version] = "3.2"
projects[views_bulk_operations][subdir] = "contrib"
