# Smart Task Manager

A full-stack task management web application built using Flask and PostgreSQL.

This project allows users to:
- Register and login securely
- Create, update, delete, and manage tasks
- View task analytics
- Access REST APIs
- Use WebSocket-based real-time notifications

---

# Features

## Authentication
- User Registration
- Secure Password Hashing
- User Login System

## Task Management
- Add Tasks
- View Tasks
- Edit Tasks
- Delete Tasks

## Analytics
- Total Tasks
- Completed Tasks
- Pending Tasks
- Completion Percentage

Implemented using:
- Pandas
- NumPy

## REST APIs
- GET API
- POST API
- PUT API
- DELETE API

## WebSocket Support
Implemented using Flask-SocketIO for real-time event communication.

---

# Technologies Used

- Python
- Flask
- PostgreSQL
- SQLAlchemy
- Flask-SocketIO
- Pandas
- NumPy
- HTML
- Bootstrap 5

---

# Project Structure

```plaintext
smart-task-manager/
│
├── analytics/
├── models/
├── templates/
├── venv/
│
├── app.py
├── extensions.py
├── requirements.txt
├── README.md
```

---

# Installation Steps

## 1. Clone Repository

```bash
git clone https://github.com/gop-i-krishnan/smart-task-manager.git
```

## 2. Create Virtual Environment

```bash
python -m venv venv
```

## 3. Activate Virtual Environment

### Windows

```bash
venv\Scripts\activate
```

---

## 4. Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 5. Configure Environment Variables

Create `.env` file:

```env
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@localhost/taskmanager
SECRET_KEY=mysecretkey
```

---

## 6. Run Application

```bash
python app.py
```

---

# REST API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | /api/tasks | Get all tasks |
| POST | /api/tasks | Create task |
| PUT | /api/tasks/<id> | Update task |
| DELETE | /api/tasks/<id> | Delete task |

---

# Screenshots

## Dashboard

![Dashboard](screenshots/dashboard.png)

## Edit Task

![Edit Task](screenshots/edit-task.png)

## REST API Testing

![API Testing](screenshots/api-testings.png)

## PostgreSQL Database

![Database](screenshots/database.png)

# Future Improvements

- Better frontend interactivity
- User-specific task management
- Task deadlines and reminders
- AJAX-based real-time updates
- Deployment to cloud platform

---

# Author

Developed by Gopi Krishnan D