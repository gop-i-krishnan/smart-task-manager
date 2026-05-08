from flask import Flask, render_template, request, redirect
from extensions import db
from dotenv import load_dotenv
import os
from werkzeug.security import generate_password_hash, check_password_hash

# Load environment variables
load_dotenv()

# Create Flask app
app = Flask(__name__)

# Configure database
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv("DATABASE_URL")
app.config['SECRET_KEY'] = os.getenv("SECRET_KEY")

# Initialize database with app
db.init_app(app)

# Import models
from models.models import User, Task

# Create tables
with app.app_context():
    db.create_all()

# Home route
@app.route("/")
def home():
    return "Database and Models Connected Successfully!"

@app.route("/register", methods=["GET", "POST"])
def register():

    if request.method == "POST":

        username = request.form["username"]
        password = request.form["password"]
        hashed_password = generate_password_hash(password)

        new_user = User(
            username=username,
            password=hashed_password
        )

        db.session.add(new_user)
        db.session.commit()

        return "User Registered Successfully!"

    return render_template("register.html")

@app.route("/login", methods=["GET", "POST"])
def login():

    if request.method == "POST":

        username = request.form["username"]
        password = request.form["password"]

        # Find user from database
        user = User.query.filter_by(username=username).first()

        # Check user exists and password is correct
        if user and check_password_hash(user.password, password):

            return "Login Successful!"

        else:

            return "Invalid Username or Password"

    return render_template("login.html")

@app.route("/dashboard", methods=["GET", "POST"])
def dashboard():

    if request.method == "POST":

        title = request.form["title"]
        description = request.form["description"]
        priority = request.form["priority"]
        status = request.form["status"]

        new_task = Task(
            title=title,
            description=description,
            priority=priority,
            status=status
        )

        db.session.add(new_task)
        db.session.commit()

    # Fetch all tasks from database
    tasks = Task.query.all()

    return render_template("dashboard.html", tasks=tasks)

@app.route("/delete-task/<int:id>")
def delete_task(id):

    # Find task by ID
    task = Task.query.get(id)

    # Delete task
    db.session.delete(task)

    # Save changes
    db.session.commit()

    return redirect("/dashboard")

@app.route("/edit-task/<int:id>", methods=["GET", "POST"])
def edit_task(id):

    # Find task by ID
    task = Task.query.get(id)

    if request.method == "POST":

        # Update values
        task.title = request.form["title"]
        task.description = request.form["description"]
        task.priority = request.form["priority"]
        task.status = request.form["status"]

        # Save changes
        db.session.commit()

        return redirect("/dashboard")

    return render_template("edit_task.html", task=task)

if __name__ == "__main__":
    app.run(debug=True)