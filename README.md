# Examhub

A modern MCQ-based Online Examination System built with Django

## Features

- Multiple Choice Question (MCQ) examination system
- Real-time exam taking interface
- Automatic grading and result generation
- Detailed analytics and reports
- User management system

## Prerequisites

- Python 3.12 or higher
- MySQL Server
- pip (Python package manager)

## Installation

1. Clone the repository

```bash
git clone https://github.com/tusharneje-07/examhub.git
cd examhub
```

2. Create and activate virtual environment (recommended)

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows use: venv\Scripts\activate
```

3. Install dependencies

```bash
pip install -r requirements.txt
```

4. Configure database

- Ensure MySQL server is running on localhost:3306
- Create a new database named 'examhub'
- Import the initial database schema:

```bash
mysql -u <USERNAME> -p examhub < ./examhub.sql
```

5. Set up environment variables

```bash
cp .env.example .env
```

Edit `.env` file with your database credentials and other configurations

## Running the Application

Start the development server:

```bash
python manage.py runserver 127.0.0.1:8000
```

Visit `http://127.0.0.1:8000` in your web browser

## Default Credentials

admin account:

- Username: admin
- Password: 123

Student account:

- Username: tushar
- Password: 123

## Environment Variables

Required environment variables in `.env`:

- `DATABASE_NAME`: Database name (default: examhub)
- `DATABASE_USER`: MySQL username (default: root)
- `DATABASE_PASSWORD`: MySQL password (default: <not-set>)
- `DATABASE_HOST`: Database host (default: localhost)

## Contributing

1. Fork the repository
2. Create a new branch
3. Make your changes
4. Submit a pull request

## Support

- open an issue in this GitHub repository.
