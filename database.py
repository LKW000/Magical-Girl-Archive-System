import mysql.connector
from mysql.connector import Error


def create_connection():
    """Connect to MySQL database."""
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="-Goldennight24-",
            database="magical_girl_archive"
        )

        if connection.is_connected():
            print("Connected to database.")
            return connection

    except Error as e:
        print(f"Database connection error: {e}")
        return None

def view_all_characters(connection):
    """Display all characters."""
    try:
        cursor = connection.cursor()
        query = "SELECT character_id, name, age, origin, current_status, stability_level FROM characters"
        cursor.execute(query)
        results = cursor.fetchall()

        print("\n--- All Characters ---")
        for row in results:
            print(f"ID: {row[0]} | {row[1]} | Age: {row[2]} | Status: {row[4]} | Stability: {row[5]}")

    except Error as e:
        print(f"Error viewing characters: {e}")


def search_character_by_name(connection, name):
    """Search for a character by name."""
    try:
        cursor = connection.cursor()
        query = """
            SELECT character_id, name, age, origin, current_status, stability_level
            FROM characters
            WHERE name LIKE %s
        """
        cursor.execute(query, (f"%{name}%",))
        results = cursor.fetchall()

        print("\n--- Search Results ---")
        if results:
            for row in results:
                print(f"ID: {row[0]} | {row[1]} | Age: {row[2]} | Origin: {row[3]} | Status: {row[4]} | Stability: {row[5]}")
        else:
            print("No character found.")

    except Error as e:
        print(f"Error searching character: {e}")


def view_low_stability_characters(connection):
    """Show characters with stability below 70."""
    try:
        cursor = connection.cursor()
        query = """
            SELECT name, current_status, stability_level
            FROM characters
            WHERE stability_level < 70
            ORDER BY stability_level ASC
        """
        cursor.execute(query)
        results = cursor.fetchall()

        print("\n--- Low Stability Characters ---")
        for row in results:
            print(f"{row[0]} | Status: {row[1]} | Stability: {row[2]}")

    except Error as e:
        print(f"Error viewing low stability characters: {e}")


def view_character_abilities(connection):
    """Show characters with their abilities."""
    try:
        cursor = connection.cursor()
        query = """
            SELECT c.name, a.ability_name, a.ability_type, ca.mastery_level
            FROM characters c
            JOIN character_abilities ca ON c.character_id = ca.character_id
            JOIN abilities a ON ca.ability_id = a.ability_id
            ORDER BY c.name
        """
        cursor.execute(query)
        results = cursor.fetchall()

        print("\n--- Character Abilities ---")
        for row in results:
            print(f"{row[0]} | {row[1]} ({row[2]}) | Mastery: {row[3]}")

    except Error as e:
        print(f"Error viewing abilities: {e}")
        
def add_character(connection, name, age, origin, status, stability):
    """Add a new character."""
    try:
        cursor = connection.cursor()
        query = """
            INSERT INTO characters (name, age, origin, current_status, stability_level)
            VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query, (name, age, origin, status, stability))
        connection.commit()
        print("Character added successfully.")

    except Error as e:
        print(f"Error adding character: {e}")


def add_ability(connection, name, ability_type, description, power):
    """Add a new ability."""
    try:
        cursor = connection.cursor()
        query = """
            INSERT INTO abilities (ability_name, ability_type, description, power_level)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(query, (name, ability_type, description, power))
        connection.commit()
        print("Ability added successfully.")

    except Error as e:
        print(f"Error adding ability: {e}")

def update_character_stability(connection, character_id, new_stability):
    """Update a character's stability."""
    try:
        cursor = connection.cursor()
        query = """
            UPDATE characters
            SET stability_level = %s
            WHERE character_id = %s
        """
        cursor.execute(query, (new_stability, character_id))
        connection.commit()
        print("Stability updated successfully.")

    except Error as e:
        print(f"Error updating stability: {e}")
        
def delete_character(connection, character_id):
    """Delete a character."""
    try:
        confirm = input("Are you sure you want to delete this character? (y/n): ")

        if confirm.lower() == 'y':
            cursor = connection.cursor()
            query = "DELETE FROM characters WHERE character_id = %s"
            cursor.execute(query, (character_id,))
            connection.commit()
            print("Character deleted successfully.")
        else:
            print("Deletion cancelled.")

    except Error as e:
        print(f"Error deleting character: {e}")