import MySQLdb
import cherrypy

# Get the Database connector and queries
from dbhelper import DBHelper

DB = DBHelper()

class Login(object):
    @cherrypy.expose
    def index(self):
        return 'login'

# Supplier 
@cherrypy.popargs('supplier_id')
class Supplier(object):
    def _init_(self):
        self.products = Product()
        #self.inventories = Inventory()
        #self.orders = Order()

    @cherrypy.expose
    def index(self, supplier_id = None):
        # Supplier list
        if supplier_id == None:
			data = DB.get_all_supplier()
			result = ""
			for row in data:
				for attribute in row:
					result += str(attribute) + " "
				result += "<br>"
			return result
            #return "Error: unable to fecth data"

        # Supplier detail
        else:
			data = DB.get_supplier_detail(supplier_id)
			result = ""
			for row in data:
				for attribute in row:
					result += str(attribute) + " "
				result += "<br>"
			return result
			#return "Error: unable to fecth data"

    @cherrypy.expose
    def product(self, supplier_id = None):
        if supplier_id != None:
			data = DB.get_supplier_product(supplier_id)
			result = ""
			for row in data:
				for attribute in row:
					result += str(attribute) + " "
				result += "<br>"
			return result
			#return "Error: unable to fecth data"

@cherrypy.popargs('product_id')
class Product(object):
    @cherrypy.expose
    def index(self, supplier_id = None, product_id = None):
        if product_id == None:
            db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")
            con = db.cursor()
            query = ("SELECT * FROM product;")
            try:
                # Get the data from the database by executing the query
                con.execute(query)
                result = ""
                # Seperate all of the query results into columns
                for row in con.fetchall():
                    for attribute in row:
                        result += str(attribute) + " "
                    result += "<br>"
                con.close()
                db.close()
                return result
                
            except:
                con.close()
                db.close()
                return "Error: unable to fecth data for products"
        else:
            return 'Product id %s' %(product_id)
    
if __name__ == '__main__':
    cherrypy.tree.mount(Login(), '/')
    cherrypy.tree.mount(Supplier(), '/supplier')
    cherrypy.tree.mount(Product(), '/product')

    cherrypy.engine.start()
    cherrypy.engine.block()

