#! /bin/bash
#
# Script used after setting up instance with '$ vagrant up'
#

# Installs bundler gem so that we can install all other gems in Gemfile using just '$ bundle'
gem install bundler

# Create 'shim' for bundler so that 'bundle' command will work
rbenv rehash

# Install all gems from Gemfile
bundle

# Create 'shim's for other Gems that were installed, like 'rails'
rbenv rehash

# Create DB, run migrations, and add seed data
rake db:setup