#!/usr/bin/python

import MySQLdb
    
db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")

# you must create a Cursor object. It will let
#  you execute all the queries you need
cur = db.cursor()

# Use all the SQL you like
cur.execute("INSERT INTO customer VALUES(null, 'Ben', 'ben@gmail.com', '21 Fake street');")

# Use all the SQL you like
cur.execute("SELECT * FROM customer")

# print all the first cell of all the rows
for row in cur.fetchall():
    print (row)

db.close()
