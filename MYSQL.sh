#!/bin/sh

# start MySQL. Will create an empty database on first start
mysql-ctl start

# stop MySQL
mysql-ctl stop

# run the MySQL interactive shell
mysql-ctl cli

# Hostname - $IP (The same local IP as the application you run on Cloud9)
# Port - 3306 (The default MySQL port number)
# User - $C9_USER (Your Cloud9 user name)
# Password - "" (No password since you can only access the DB from within the workspace)
# Database - c9 (The database username)