from mysql.connector import (connection)
from flask import Flask, jsonify, request 
from flask_restful import Resource, Api 

app = Flask(__name__) 
api = Api(app) 


cnx = connection.MySQLConnection(user='root', password='password',
                                 host='127.0.0.1', database='goalreminder')



class Hello(Resource): 
	def get(self): 

            cursor = cnx.cursor()
            fd = open('GoalAnalyzer.sql', 'r')
            sqlFile = fd.read()
            fd.close()
            cursor.execute(sqlFile)
            data=cursor.fetchall()
            return data


	def post(self): 
		
		data = request.get_json()
		return jsonify({'data': data}), 201




api.add_resource(Hello, '/') 

if __name__ == '__main__': 
    app.run(debug = False) 
