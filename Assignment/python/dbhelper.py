import pymysql

class DBHelper:

	# Connect to the mysql database using pymysql connector
	def connect(self, username='root', password='password'):
		return pymysql.connect(host='localhost', user=username, passwd=password, db='pocketpasta')
	
	# Get all of the suppliers
	def get_all_supplier(self):
		connection = self.connect()
		try:
			query = "SELECT * FROM supplier;"
			with connection.cursor() as cursor:
				cursor.execute(query)
			return cursor.fetchall()
		finally:
			connection.close()
		  
	
	