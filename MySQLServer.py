import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    cursor = None
    try:
        # Open connection to MySQL Server (edit user/password if needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="yourpassword"
        )

        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # Print error when failing to connect or create the DB
        print(f"Error: Could not connect or create database. Details: {e}")

    finally:
        # Close cursor and connection safely
        if cursor is not None:
            try:
                cursor.close()
            except Exception:
                pass
        if connection is not None:
            try:
                if connection.is_connected():
                    connection.close()
            except Exception:
                pass

if __name__ == "__main__":
    create_database()
