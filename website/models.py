import os
import mysql.connector
from flask import current_app, flash, jsonify
import pymysql
from dotenv import load_dotenv

load_dotenv()  # Load environment variables from .env file
def db():
    try:
    # Connect to the database
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            port=int(os.getenv("DB_PORT")), 
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database="defaultdb",
            ssl_disabled=False
            
        )
    except mysql.connector.Error as err:
        print(f"Error connecting to the database: {err}")
        return None
   
    return connection



def save(query, data):
    # Connect to MySQL and insert the product into the database
    conn = db()
    cursor = conn.cursor()

    try:
        cursor.execute(query, data)  # Execute the query with the provided values
        conn.commit()  # Commit the transaction to the database
        print("Product added successfully", "success")
        flash("Product added successfully", "success")
        return jsonify({"message": "Product added successfully"}), 201
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        conn.rollback()  # Rollback in case of error
        
        flash(f"Database error: {err}", "error")
        return jsonify({"error": str(err)}), 500
    finally:
        cursor.close()
        conn.close()

    return True


def grab(query, data):
    # This function assumes get_db_connection is defined to return a connection object
    conn = db()
    cursor = conn.cursor(dictionary=True)
    try:
        if data:
            cursor.execute(query,data)
        else:
            cursor.execute(query)
        result = cursor.fetchall()
    finally:
        cursor.close()
        conn.close()

    return result