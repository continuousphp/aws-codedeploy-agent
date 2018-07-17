# WebServer PHP7

## Requirement

    Chef >= 12
    Recommend to install CHEF-DK version ~1.5
    rbenv ( install local version )
    bundler
    berks

## Installation

    rbenv rehash
    bundle install
    berks install

## Troubleshot, common issues

 1. cleanup your rbenv shim.

    If you have troubles related to GEM package, make sure your rbenv match the binaries on the right version.
    you can drop the directory `~/.rbenv/shims` and execute `rbenv rehash` to reload gem binaries.

 2. Berks install fail.

    Since chef 13, and berks 6 you can expect somes troubles due to incompatibilities of the gems 
    and you current chef version installed. In this case I suggest you to erase the berks binaries from 
    `~/.rbenv/shims/berks` for use the berks installed on you system.

