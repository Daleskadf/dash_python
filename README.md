# Interactive Dashboard with Dash + MySQL

This project is an interactive dashboard developed in **Python** using **Dash**, **Plotly**, and **MySQL** as the data source. It allows you to visualize sales by product and category in real time, without the need to program a frontend.

## What is Dash?

Dash is a Python framework that allows you to easily build interactive data visualization web applications, without the need to write HTML, CSS, or JavaScript.

## Prerequisites

- Python 3.7+
- MySQL Server installed and running
- Have the `tienda_ventas` database created with the necessary tables (`productos`, `ventas`).

## Installation and Execution Instructions

### 1. Clone the repository

```bash
git clone https://github.com/your_username/your_repository.git
cd your_repository
```

### 2. Create a virtual environment (optional)
```
python -m venv venv
source venv/bin/activate    # On Mac/Linux
venv\Scripts\activate       # On Windows
```

### 3. Install the dependencies
```
dash
pandas
mysql-connector-python
plotly
Then install everything with:
pip install -r requirements.txt
```

### 4. Configure your database connection
Edita el archivo config.py:
```
# config.py

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "",  # Your MySQL password
    "database": "tienda_ventas"
}
```

### 5. Run the application
```
python app.py
```

### 6. Open the browser
```
http://127.0.0.1:8050/
```
And you will see the dashboard running!

If you don't have MySQL installed, you can use XAMPP, MAMP, or cloud database services. For production, it is recommended to disable debug=True in app.run() and use servers like Gunicorn or uWSGI.
