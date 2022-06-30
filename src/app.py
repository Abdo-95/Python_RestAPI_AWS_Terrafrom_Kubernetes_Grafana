from cgitb import reset
from sqlite3 import dbapi2
from unittest import result
from dotenv import load_dotenv
from flask import Flask, request, jsonify
import pymysql.cursors
import json
import os

load_dotenv() 
app = Flask(__name__)

# Set default values using enviroment variables
default_db_ip = os.getenv("default_db_ip")
default_db_user = os.getenv("default_db_user")
default_db_password = os.getenv("default_db_password")
default_db_name = os.getenv("default_db_name")
db_charset = os.getenv("db_charset")
# Init Database connection
db_connection = pymysql.connect(
    host=os.environ.get('DB_HOST', default_db_ip),
    user=os.environ.get('DB_USER', default_db_user),
    password=os.environ.get('DB_PASSWORD', default_db_password),
    db=os.environ.get('DB_NAME', default_db_name),
    charset=os.environ.get('DB_CHARSET', db_charset),
    cursorclass=pymysql.cursors.DictCursor
)
#grab the cursor Object
db_cursor = db_connection.cursor()
#function to grap all books
def db_get(sql):
  db_cursor.execute(sql)
  return db_cursor.fetchall()
#function to grap one book  
def db_get_1book(sql, value):
  db_cursor.execute(sql, (value,))
  return db_cursor.fetchall()
#function to post book refrsh and return all books 
def db_post(sql, values):
  db_cursor.execute(sql, values)
  db_connection.commit()
  return db_cursor.fetchall()
#function to delete a book and refresh, will return Book deleted 
def db_delete(sql, values):
  db_cursor.execute(sql, values)
  db_connection.commit()
  return print("book deleted")
#default root return hello world 
@app.route("/", methods=['GET', 'POST', 'DELETE']) # Hier kann mann Routen definieren, über die die App erreichbar ist
def books1():
    return "Hello World" 
#2nd route, has 2 methods GET and POST gets all books and add one book 
@app.route("/api/v1/book", methods=['GET', 'POST']) 
def books():
  #connect = db_connection() #start the Connection with the db
  #cursor = connect.cursor()
  result = None
  if request.method == 'GET':   # case 1
    sql = 'SELECT * FROM books'
    result = db_get(sql)
    return json.dumps(result)

  if request.method == 'POST': #case 2
    body = request.json
    sql = 'INSERT INTO books (title, year_written, author) VALUES (%s, %s, %s)'
    result = db_post(sql, (body['title'], body['year_written'], body['author']))
    return json.dumps(result) 


# 3rd route, Suche ein Buch und löschen in der Datenbank
@app.route("/api/v1/book/<id>", methods=['GET' , 'DELETE'])
def book(id):
 result = None
 if request.method == 'GET':
  sql = "SELECT * FROM books WHERE id= %s" 
  result = db_get_1book(sql , id)
  return json.dumps(result)

 if request.method == 'DELETE':
  sql = "DELETE FROM books WHERE id= %s"
  result = db_delete(sql , id)
  return json.dumps(result)
#4th route search a book with a specifc year
@app.route("/api/v1/book/year/<year>", methods=['GET'])
def book_year(year):
 result = None
 sql = "SELECT * FROM books WHERE year_written = %s" 
 result = db_get_1book(sql , year)
 return json.dumps(result)
#5th route used to test 
@app.route("/t", methods=['GET', 'POST', 'DELETE']) 
def books2():
    return "Hello from the other side"  
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))  # Erhalte den Port aus der Environment Variable, sonst benutze 80
    app.run(host='0.0.0.0', port=port)      # Starte die App