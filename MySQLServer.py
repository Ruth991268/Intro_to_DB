import mysql.connector
from mysql.connector import Error

def main():
    connection = None
    cursor = None
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",             # <-- change if needed
            password="yourpassword"  # <-- change if needed
        )
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")
    except Error as e:
        print(f"Error: Could not connect or create database. Details: {e}")
    except Exception as e:
        print(f"Error: Unexpected failure. Details: {e}")
    finally:
        try:
            if cursor is not None:
                cursor.close()
        except Exception:
            pass
        try:
            if connection is not None and connection.is_connected():
                connection.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
