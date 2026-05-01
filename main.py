from database import (
    create_connection,
    view_all_characters,
    search_character_by_name,
    view_low_stability_characters,
    view_character_abilities,
    add_character,
    add_ability,
    update_character_stability,
    delete_character
)


def display_menu():
    print("\n==============================")
    print(" Magical Girl Archive System")
    print("==============================")
    print("1. View all characters")
    print("2. Search character by name")
    print("3. View low stability characters")
    print("4. View character abilities")
    print("5. Add character")
    print("6. Add ability")
    print("7. Update character stability")
    print("8. Delete character")
    print("9. Exit")


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
            name = input("Name: ")
            age = int(input("Age: "))
            origin = input("Origin: ")
            status = input("Status: ")
            stability = int(input("Stability: "))

            add_character(connection, name, age, origin, status, stability)

        elif choice == "6":
            name = input("Ability Name: ")
            ability_type = input("Type: ")
            description = input("Description: ")
            power = int(input("Power Level (1-10): "))

            add_ability(connection, name, ability_type, description, power)

        elif choice == "7":
            character_id = int(input("Character ID: "))
            stability = int(input("New Stability: "))

            update_character_stability(connection, character_id, stability)

        elif choice == "8":
            character_id = int(input("Character ID to delete: "))

            delete_character(connection, character_id)

        elif choice == "9":
            print("Closing archive. Goodbye.")
            break
        

    connection.close()


if __name__ == "__main__":
    main()