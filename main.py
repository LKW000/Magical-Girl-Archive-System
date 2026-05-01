from database import (
    create_connection,
    view_all_characters,
    search_character_by_name,
    view_low_stability_characters,
    view_character_abilities
)


def display_menu():
    print("\n==============================")
    print(" Magical Girl Archive System")
    print("==============================")
    print("1. View all characters")
    print("2. Search character by name")
    print("3. View low stability characters")
    print("4. View character abilities")
    print("5. Exit")


def main():
    connection = create_connection()

    if not connection:
        print("Could not connect to database.")
        return

    while True:
        display_menu()
        choice = input("\nChoose an option: ")

        if choice == "1":
            view_all_characters(connection)

        elif choice == "2":
            name = input("Enter character name: ")
            search_character_by_name(connection, name)

        elif choice == "3":
            view_low_stability_characters(connection)

        elif choice == "4":
            view_character_abilities(connection)

        elif choice == "5":
            print("Closing archive. Goodbye.")
            break

        else:
            print("Invalid option. Please choose 1-5.")

    connection.close()


if __name__ == "__main__":
    main()