#!/usr/bin/env bash
# Shell script to create new Database
# REQUIRES ROOT MySQL ACCESS
# Author: trentoswald@therebelrobot.com
 
MyUSER=$1     							# USERNAME
echo "Root MySQL password:"
read -s MyPASS       				# PASSWORD 
echo "MySQL host:"
read MyHOST        					# Hostname
echo "New Database:"
read NEWDB       	 					# db
echo "New MySQL User:"
read NEWUSER        				# user
NEWPASS="$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs)"
# Linux bin paths, change this if it can not be autodetected via which command
MYSQL="$(which mysql)"
CHOWN="$(which chown)"
CHMOD="$(which chmod)"
# Get hostname
HOST="$(hostname)"
# Run MySQL commands
$MYSQL -u $MyUSER -h $MyHOST --password=$MyPASS -Bse "CREATE USER '$NEWUSER'@'$MyHOST' IDENTIFIED BY '$NEWPASS'"
$MYSQL -u $MyUSER -h $MyHOST --password=$MyPASS -Bse "CREATE DATABASE $NEWDB"
$MYSQL -u $MyUSER -h $MyHOST --password=$MyPASS -Bse "GRANT ALL PRIVILEGES ON $NEWDB.* TO '$NEWUSER'@'$MyHOST'"
echo "$NEWUSER has been successfully created."
echo "Password: $NEWPASS"
echo "Please copy this password down and store in a safe location."
echo "IT IS NOT RETRIEVABLE."