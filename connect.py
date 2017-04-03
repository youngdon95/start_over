import MySQLdb
#!/usr/bin/python

import MySQLdb
host = getenv('IP')
# Open database connection
db = MySQLdb.connect("localhost","champion_boy","","c9")

# prepare a cursor object using cursor() method
cursor = db.cursor()

# execute SQL query using execute() method.
cursor.execute("SELECT VERSION()")

# Fetch a single row using fetchone() method.
data = cursor.fetchone()

print "Database version : %s " % data

# disconnect from server
db.close()