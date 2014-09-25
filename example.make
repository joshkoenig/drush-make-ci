; ten_steps_to_complex_learning make file for d.o. usage
core = "7.x"
api = "2"

; +++++ Specify Pantheon for teh core +++++
projects[pantheon][type] = "core"
projects[pantheon][download][type] = "git"
projects[pantheon][download][url] = "https://github.com/pantheon-systems/drops-7.git"

; +++++ Defaults +++++

defaults[projects][subdir] = "contrib"

; +++++ Modules +++++

projects[admin_menu][version] = "3.0-rc4"

projects[module_filter][version] = "2.0-alpha2"

projects[ctools][version] = "1.4"

projects[profiler_builder][version] = "1.2"

projects[eck][version] = "2.0-rc4"

projects[features][version] = "2.0"

projects[features_builder][version] = "1.x-dev"

projects[entityreference][version] = "1.1"

projects[html5_tools][version] = "1.2"

projects[elements][version] = "1.4"

projects[entity][version] = "1.5"

projects[ckeditor][version] = "1.15"

projects[views][version] = "3.8"

projects[views_bulk_operations][version] = "3.2"

projects[pathauto][version] = "1.2"
