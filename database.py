import mysql.connector
from mysql.connector import Error


def create_connection():
    """Connect to MySQL database."""
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="YOUR_PASSWORD_HERE",
            database="magical_girl_archive"
        )

        if connection.is_connected():
            print("Connected to database.")
            return connection

    except Error as e:
        print(f"Database connection error: {e}")
        return None