import os, os.path
import MySQLdb
import cherrypy

# Get the Database connector and queries
from dbhelper import DBHelper

DB = DBHelper()

class Login(object):
    @cherrypy.expose
    def index(self):
        return """
			<form method="post" action="/login">
				<label><b>Username</b></label>
				<input type="text" placeholder="Enter Username" name="username">
				<label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password">
				<button type="submit">Login</button>
			</form>
		"""
		
	@cherrypy.expose
	def login(self, username = None, password = None):
		return '%s tried loggin in' %(username)
		
	def POST(self, username = None, password = None):
		return '%s tried loggin in' %(username)

# Supplier 
@cherrypy.popargs('supplier_id')
class Supplier(object):
	def _init_(self):
		self.product = Product()
        #self.inventories = Inventory()
        #self.orders = Order()

	@cherrypy.expose
	def index(self, supplier_id = None):
		# Supplier list
		if supplier_id == None:
			header = DB.table_header('supplier')
			data = DB.get_all_supplier()
			return DB.print_table(header, data)

		# Supplier detail
		else:
			header = DB.table_header('supplier')
			data = DB.get_supplier_detail(supplier_id)
			return DB.print_table(header, data)

	@cherrypy.expose
	def product(self, supplier_id = None):
		if supplier_id != None:
			header = DB.table_header('supplier_items')
			data = DB.get_supplier_product(supplier_id)
			return DB.print_table(header, data)
			
	@cherrypy.expose
	def delete(self, supplier_id = None):
		if supplier_id != None:
			insert = DB.delete_supplier(supplier_id)
			header = DB.table_header('supplier')
			data = DB.get_all_supplier()
			return DB.print_table(header, data)
		

@cherrypy.popargs('product_id')
class Product(object):
    @cherrypy.expose
    def index(self, supplier_id = None, product_id = None):
		if product_id == None:
			header = DB.table_header('product')
			data = DB.get_all_product()
			return DB.print_table(header, data)
		else:
			return 'Product id %s' %(product_id)
			
class Order(object):
	@cherrypy.expose
	def index(self):
		header = DB.table_header('product_order')
		data = DB.get_all_product_order()
		return DB.print_table(header, data)
			
class Create(object):
	@cherrypy.expose
	def index(self):
		return 'select a object to create'
	
	@cherrypy.expose
	def supplier(self, supplier_id = None, supplier_name = None, supplier_image = None, supplier_ABN = None):
		insert = DB.insert_supplier(supplier_id, supplier_name, supplier_image, supplier_ABN)
		header = DB.table_header('supplier')
		data = DB.get_all_supplier()
		return DB.print_table(header, data)
	
	@cherrypy.expose
	def order(self, product_order_id = None, product_id = None, customer_id = None, quantity = None, unit = None, address = None, due_date = None, date_created = None, date_delivered = None):
		insert = DB.insert_product_order(product_order_id, product_id, customer_id, quantity, unit, address, due_date, date_created, date_delivered)
		header = DB.table_header('product_order')
		data = DB.get_all_product_order()
		return DB.print_table(header, data)
		
class Delete(object):
	@cherrypy.expose
	def index(self):
		return 'select a object to delete'
			
	@cherrypy.expose
	def supplier(self, supplier_id):
		insert = DB.delete_supplier(supplier_id)
		header = DB.table_header('supplier')
		data = DB.get_all_supplier()
		return DB.print_table(header, data)
			
if __name__ == '__main__':

	cherrypy.tree.mount(Login(), '/')
	cherrypy.tree.mount(Supplier(), '/supplier')
	cherrypy.tree.mount(Product(), '/product')
	cherrypy.tree.mount(Order(), '/order')
	cherrypy.tree.mount(Create(), '/create') 
	cherrypy.tree.mount(Delete(), '/delete')

	cherrypy.engine.start()
	cherrypy.engine.block()

