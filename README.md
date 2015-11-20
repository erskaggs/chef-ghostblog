ghostblog Cookbook
==================
A [Chef](http://getchef.com/) cookbook for building and managing a [Ghost blog](http://docs.ghost.org/).

Requirements
------------

## nodejs and Chef:

* nodejs
* Chef 11+

## Platforms

* Ubuntu 14.04

## Cookbooks:

This cookbook depends on the following community cookbooks:

* [nodejs](https://supermarket.chef.io/cookbooks/nodejs) '~> 2.4.0'

General settings
----------------

* `node['ghostblog']['install_dir']` - Installation directory for Ghost. Default is `/var/www/ghost`
* `node['ghostblog']['version']` - Ghost blog version. Default is `latest`. Will also take old versions `0.5.9, 0.5.8, etc`

Ghost app settings
----------------

* `node['ghostblog']['app']['server_url']` - Ghost app server url. Default is `localhost`
* `node['ghostblog']['app']['port']` - Ghost app port. Default is `2368`
* `node['ghostblog']['app']['mail_transport_method']` - Ghost app mailing method. Default is `SMTP`.
* `node['ghostblog']['app']['mail_service']` - Name of Mail service to use with nodemailer. Default is `nil`. Supports `Gmail`,`SES`, & `mailgun`.
* `node['ghostblog']['app']['mail_user']` - Username for select mail service. Default is `nil`
* `node['ghostblog']['app']['mail_passwd']` - Password for selected mail user. Default is `nil`
* `node['ghostblog']['app']['db_type']` - Type of database to use with Ghost. Default is `sqlite3`. Supports `sqlite3`, and `mysql`.

Ghost MySQL settings
----------------

* `node['ghostblog']['mysql']['host']` - MySQL host. Default is `127.0.0.1`
* `node['ghostblog']['mysql']['user']` - MySQL user. Default is `ghost_blog`
* `node['ghostblog']['mysql']['passwd']` - MySQL password. Default is `ChangePasswordQuick!`
* `node['ghostblog']['mysql']['database']` - MySQL database name. Default is `ghost_db`
* `node['ghostblog']['mysql']['charset']` - MySQL charset. Default is `utf8`

Recipes
=======
