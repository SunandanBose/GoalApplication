from mysql.connector import (connection)
from flask import Flask, jsonify, request 
from flask_restful import Resource, Api 

app = Flask(__name__) 
api = Api(app) 


cnx = connection.MySQLConnection(user='root', password='password',
                                 host='127.0.0.1', database='fms')



class Hello(Resource): 
	def get(self): 

            # mydb = mysql.connector.connect(host="localhost",user="yourusername",password="yourpassword")
            cursor = cnx.cursor()
            for line in open('sample.sql'):
                cursor.execute(line)
            data = cursor.fetchall()
            print(data)
            return 200


	def post(self): 
		
		data = request.get_json()
		return jsonify({'data': data}), 201




api.add_resource(Hello, '/') 

if __name__ == '__main__': 
    app.run(debug = False) 
