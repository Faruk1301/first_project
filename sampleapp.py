from flask import Flask, request, render_template_string

# Create a Flask app
app = Flask(__name__)

# Home route
@app.route("/")
def home():
    return render_template_string("""
    <h1>Welcome to the Python Sample App</h1>
    <form action="/greet" method="post">
        <label for="name">Enter your name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Greet Me!</button>
    </form>
    """)

# Greeting route
@app.route("/greet", methods=["POST"])
def greet():
    name = request.form.get("name")
    if not name:
        return "Name is required!", 400
    return f"<h1>Hello, {name}! Welcome to the Flask app!</h1>"

# Run the app
if __name__ == "__main__":
    app.run(debug=True)
