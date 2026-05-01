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
        SELECT s.stability_level, s.corruption_level, s.emotional_state, s.recorded_date, s.notes
        FROM state_log s
        WHERE s.character_id = %s
        ORDER BY s.recorded_date DESC
    """, (character_id,))
    logs = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("character_detail.html", character=character, logs=logs)


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