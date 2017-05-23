import MySQLdb
import cherrypy

class Login(object):
    @cherrypy.expose
    def index(self):
        return 'login'

@cherrypy.popargs('supplier_id')
class Supplier(object):
    def _init_(self):
        self.products = Product()
        #self.inventories = Inventory()
        #self.orders = Order()

    @cherrypy.expose
    def index(self, supplier_id = None):
        if supplier_id == None:
            db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")
            con = db.cursor()
            query = ("SELECT * FROM supplier;")
            try:
                con.execute(query)
                result = ""
                for row in con.fetchall():
                    supplier_id = row[0]
                    supplier_name = row[1]
                    supplier_image = row[2]
                    supplier_ABN = row[3]
                    # Now print fetched result
                    result += supplier_name + "\n"
                    """
                  print = "supplier_id=%s,supplier_name=%s,supplier_image=%d,supplier_ABN=%s" % \
                         (supplier_id, supplier_name, supplier_image, supplier_ABN )
"""
                return result
                
            except:
               return "Error: unable to fecth data"
        
        else:
            db = MySQLdb.connect(host="localhost", user="root", passwd="password", db="pocketpasta")
            con = db.cursor()
            query = ("SELECT * FROM supplier WHERE supplier_id = %s;")
            try:
                con.execute(query, (supplier_id))
                result = ""
                for row in con.fetchall():
                    supplier_id = row[0]
                    supplier_name = row[1]
                    supplier_image = row[2]
                    supplier_ABN = row[3]
                    # Now print fetched result
                    result += supplier_name + "\n"
                return result
                
            except:
               return "Error: unable to fecth data"        

@cherrypy.popargs('product', 'product_id')
class Product(object):
    def index(self):
        return 'Product id %s' %(product_id)
    
if __name__ == '__main__':
    cherrypy.tree.mount(Login(), '/')
    cherrypy.tree.mount(Supplier(), '/supplier')

    cherrypy.engine.start()
    cherrypy.engine.block()
