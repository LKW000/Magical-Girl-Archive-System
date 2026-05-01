from database import create_connection


def main():
    connection = create_connection()

    if connection:
        print("Database test successful.")
        connection.close()
    else:
        print("Connection failed.")


if __name__ == "__main__":
    main()