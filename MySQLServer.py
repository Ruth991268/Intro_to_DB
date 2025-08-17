import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL Server (adjust user & password to your setup)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",        # replace with your MySQL username
            password="yourpassword"  # replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: Could not connect or create database. Details: {e}")

    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            # print("MySQL connection closed.")  # optional

if __name__ == "__main__":
    create_database()
