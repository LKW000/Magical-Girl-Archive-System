from flask import Flask, render_template, request, redirect, url_for
from database import create_connection

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/characters")
def characters():
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
        SELECT character_id, name, age, origin, current_status, stability_level
        FROM characters
        ORDER BY name
    """)
    characters = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("characters.html", characters=characters)


@app.route("/characters/<int:character_id>")
def character_detail(character_id):
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
        SELECT *
        FROM characters
        WHERE character_id = %s
    """, (character_id,))
    character = cursor.fetchone()

    cursor.execute("""
        SELECT ability_name, ability_type, description, power_level, mastery_level
        FROM character_abilities ca
        JOIN abilities a ON ca.ability_id = a.ability_id
        WHERE ca.character_id = %s
        ORDER BY mastery_level DESC
    """, (character_id,))
    abilities = cursor.fetchall()

    cursor.execute("""
        SELECT weapon_name, weapon_type, rarity
        FROM weapons
        WHERE character_id = %s
    """, (character_id,))
    weapons = cursor.fetchall()

    cursor.execute("""
        SELECT wish, contract_cost, contract_date, contract_status
        FROM contracts
        WHERE character_id = %s
        ORDER BY contract_date DESC
    """, (character_id,))
    contracts = cursor.fetchall()

    cursor.execute("""
        SELECT form_name, trigger_condition, risk_level
        FROM transformations
        WHERE character_id = %s
        ORDER BY risk_level DESC
    """, (character_id,))
    transformations = cursor.fetchall()

    cursor.execute("""
        SELECT stability_level, corruption_level, emotional_state, recorded_date, notes
        FROM state_log
        WHERE character_id = %s
        ORDER BY recorded_date DESC
    """, (character_id,))
    logs = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "character_detail.html",
        character=character,
        abilities=abilities,
        weapons=weapons,
        contracts=contracts,
        transformations=transformations,
        logs=logs
    )


@app.route("/add-character", methods=["GET", "POST"])
def add_character_page():
    if request.method == "POST":
        name = request.form["name"]
        age = request.form["age"]
        origin = request.form["origin"]
        status = request.form["status"]
        stability = request.form["stability"]

        connection = create_connection()
        cursor = connection.cursor()

        cursor.execute("""
            INSERT INTO characters (name, age, origin, current_status, stability_level)
            VALUES (%s, %s, %s, %s, %s)
        """, (name, age, origin, status, stability))

        connection.commit()
        cursor.close()
        connection.close()

        return redirect(url_for("characters"))

    return render_template("add_character.html")


if __name__ == "__main__":
    app.run(debug=True)