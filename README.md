[![Build Status](https://travis-ci.org/Det-Kongelige-Bibliotek/valhal.png?branch=master)](https://travis-ci.org/Det-Kongelige-Bibliotek/valhal)

Valhal
===

SIFD forvaltning


Run
===

to run on a local development machine:

install the institution specific application.local.yml file in the config folder.

$ bundle install

$ rake db:migrate

$ rails generate hydra:jetty

$ rake hydra:jetty:config 

$ rake jetty:start

$ rails server

