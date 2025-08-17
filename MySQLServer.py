import mysql.connector

def create_database():
    connection = None
    cursor = None
    try:
        # Open connection to MySQL Server (change user/password if needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="yourpassword"
        )

        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        # Specific exception for MySQL errors
        print(f"Error: Could not connect or create database. Details: {e}")

    finally:
        # Close cursor safely
        if cursor is not None:
            try:
                cursor.close()
            except Exception:
                pass
        # Close connection safely
        if connection is not None:
            try:
                if connection.is_connected():
                    connection.close()
            except Exception:
                pass

if __name__ == "__main__":
    create_database()
