#!/bin/sh

# start MySQL. Will create an empty database on first start
mysql-ctl start

# stop MySQL
mysql-ctl stop

# run the MySQL interactive shell
mysql-ctl cli

