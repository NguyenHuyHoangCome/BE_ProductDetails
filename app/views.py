from flask import Flask, request, session, redirect, url_for, render_template, flash, send_from_directory ,jsonify
import os
from flask import Flask,jsonify ,request
from datetime import datetime
from datetime import timedelta
from datetime import timezone
from flask_mysqldb import MySQL
from flask_session import Session
import json
from flask_cors import CORS


ACCESS_EXPIRES = timedelta(hours=0.1)

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'  # Use 'localhost' if running Flask and MySQL container on the same machine
app.config['MYSQL_PORT'] = 3306  # Default MySQL port
app.config['MYSQL_USER'] = 'root'  # MySQL root user
app.config['MYSQL_PASSWORD'] = ''  # MySQL root password specified during container creation
app.config['MYSQL_DB'] = 'testproject'  # Replace 'your_database' with the name of your MySQL database


mysql = MySQL(app)

import json
CORS(app)

@app.route('/get_product', methods=["GET"])
def get_product():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM products")
    rows = cur.fetchall()
    # Convert MySQL data to a list of dictionaries
    data = []
    for row in rows:
        record = {
        'id_product': row[0],
        'name_product': row[1],
        'id_platform': row[2],
        'price_product': row[3],
        'imgURL': row[4],
        'type': row[5],
        }
        data.append(record)
    # Return JSON response
    return jsonify(data)

@app.route('/get_product_detail', methods=["GET"])
def get_product_detail():
    id_product = 1
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM products where id_product = %s",(id_product,))
    rows = cur.fetchall()
    # Convert MySQL data to a list of dictionaries
    data = []
    for row in rows:
        record = {
        'id_product': row[0],
        'name_product': row[1],
        'id_platform': row[2],
        'price_product': row[3],
        'imgURL': row[4],
        'type': row[5],
        }
        data.append(record)

    # truy vấn ra danh sách sản phẩm tương tự cùng type
    type_product = data[0]['type']
    cur2 = mysql.connection.cursor()
    cur2.execute("SELECT * FROM products WHERE type = %s ORDER BY id_product DESC",(type_product,))
    dataOneType = cur2.fetchall()
    data2=[]
    for rows in dataOneType:
        record = {
        'id_product': rows[0],
        'name_product': rows[1],
        'id_platform': rows[2],
        'price_product': rows[3],
        'imgURL': rows[4],
        'type': rows[5],
        }
        data2.append(record)
    
    # truy vấn ra comment
    cur3 = mysql.connection.cursor()
    cur3.execute("SELECT * FROM coment WHERE id_product = %s",(id_product,))
    dataOneType3 = cur3.fetchall()
    data3=[]
    for rows in dataOneType3:
        record = {
        'id_comand': rows[0],
        'id_user': rows[1],
        'name_user': rows[2],
        'content': rows[3],
        'userImage': rows[4],
        'id_product': rows[5],
        }
        data3.append(record)
    
    returnData = {
    "data1": data,
    "data2": data2,
    "data3": data3,
    }
    # Return JSON response
    return jsonify(returnData)

@app.route('/get_product_detail_image', methods=["GET"])
def get_product_detail_image():
    id_product = 1
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product_image_details where id_product = %s",(id_product,))
    rows = cur.fetchall()
    # Convert MySQL data to a list of dictionaries
    data = []
    for row in rows:
        record = {
        'id_PD_details': row[0],
        'id_product': row[1],
        'imgURL': row[2],
        }
        data.append(record)
    # Return JSON response
    return jsonify(data)

@app.route('/get_comment', methods=["GET"])
def get_comment():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM coment")
    rows = cur.fetchall()
    # Convert MySQL data to a list of dictionaries
    data = []
    for row in rows:
        record = {
        'id_comand': row[0],
        'id_user': row[1],
        'name_user': row[2],
        'content': row[3],
        'userImage': row[4],
        }
        data.append(record)
    # Return JSON response
    return jsonify(data)

@app.route("/")
def index():
    return "hihi"
  
@app.route("/retrieve", methods=["POST"])
def retrieve():
    print("hihi")