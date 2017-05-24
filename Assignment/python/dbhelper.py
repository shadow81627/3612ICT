import pymysql

class DBHelper:

	# Connect to the mysql database using pymysql connector
	def connect(self, username='root', password='password'):
		return pymysql.connect(host='localhost', user=username, passwd=password, db='pocketpasta')
	
	# Get the table attribute names
	def table_header(self, table):
		connection = self.connect()
		try:
			query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'pocketpasta' AND TABLE_NAME = %s;"
			with connection.cursor() as cursor:
				cursor.execute(query, table)
			return cursor.fetchall()
		finally:
			connection.close()
	
	# Returns a HTML table of the given header and data
	def print_table(self, header, data):
		result = "<table border='1'>"
		result += "<tr>"
		for row in header:
			for attribute in row:
				result += "<th>"
				result += str(attribute) + " "
				result += "</th>"
		result += "</tr>"
		for row in data:
			result += "<tr>"
			for attribute in row:
				result += "<td>"
				result += str(attribute) + " "
				result += "</td>"
			result += "</tr>"
		result += "</table>"
		return result
	
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
		  
	# Get all of a particular suppliers details
	def get_supplier_detail(self, supplier_id):
		connection = self.connect()
		try:
			query = "SELECT * FROM supplier WHERE supplier_id = %s;"
			with connection.cursor() as cursor:
				cursor.execute(query, supplier_id)
			return cursor.fetchall()
		finally:
			connection.close()
			
	# Get all of a particular suppliers products
	def get_supplier_product(self, supplier_id):
		connection = self.connect()
		try:
			query = "SELECT * FROM supplier_items WHERE supplier_id = %s;"
			
			with connection.cursor() as cursor:
				cursor.execute(query, supplier_id)
			return cursor.fetchall()
		finally:
			connection.close()
			
	# Get all of the products
	def get_all_product(self):
		connection = self.connect()
		try:
			query = "SELECT * FROM product;"
			with connection.cursor() as cursor:
				cursor.execute(query)
			return cursor.fetchall()
		finally:
			connection.close()
			
	# Transfer stock
	def transfer_stock(self, stock_id, amount):
		connection = self.connect()
		try:
			query = "CALL transfer_stock(%s, %s);"
			with connection.cursor() as cursor:
				cursor.execute(query, (stock_id, amount))
			return cursor.fetchall()
		finally:
			connection.close()
	
	
