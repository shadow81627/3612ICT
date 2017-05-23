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
            db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")
            con = db.cursor()
            query = ("SELECT * FROM supplier;")
            try:
                # Get the data from the database by executing the query
                con.execute(query)
                result = ""
                # Seperate all of the query results into columns
                for row in con.fetchall():
                    supplier_id = row[0]
                    supplier_name = row[1]
                    supplier_image = row[2]
                    supplier_ABN = row[3]
                    # Now print fetched result
                    result += supplier_name + "<br>"
                con.close()
                db.close()
                return result
                
            except:
                con.close()
                db.close()
                return "Error: unable to fecth data"

        # Supplier detail
        else:
            db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")
            con = db.cursor()
            query = ("SELECT * FROM supplier WHERE supplier_id = %s;")
            try:
                #Get the data from the database by executing the query with the given paramters
                con.execute(query, (supplier_id))
                result = ""
                # Seperate all of the query results into columns
                for row in con.fetchall():
                    supplier_id = row[0]
                    supplier_name = row[1]
                    supplier_image = row[2]
                    supplier_ABN = row[3]
                    # Now print fetched result
                    result += supplier_name + "<br>"
                con.close()
                db.close()
                return result
                
            except:
                con.close()
                db.close()
                return "Error: unable to fecth data"

    @cherrypy.expose
    def product(self, supplier_id = None):
        if supplier_id != None:
            db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")
            con = db.cursor()
            query = ("SELECT * FROM product WHERE supplier_id = %s;")
            try:
                # Get the data from the database by executing the query
                con.execute(query, (supplier_id))
                result = ""
                # Seperate all of the query results into columns
                for row in con.fetchall():
                    for attribute in row:
                        result += str(attribute) + "<br>"
                con.close()
                db.close()
                return result
                
            except:
                con.close()
                db.close()
                return "Error: unable to fecth data for supplier product"

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

