# Dashboard Interactivo con Dash + MySQL

Este proyecto es un dashboard interactivo desarrollado en **Python** usando **Dash**, **Plotly** y **MySQL** como fuente de datos. Permite visualizar ventas por producto y categoría en tiempo real, sin necesidad de programar frontend.

## ¿Qué es Dash?

Dash es un framework de Python que permite construir aplicaciones web interactivas de visualización de datos de manera sencilla, sin necesidad de escribir HTML, CSS o JavaScript.

## Requisitos Previos

- Python 3.7+
- MySQL Server instalado y ejecutándose
- Tener creada la base de datos `tienda_ventas` con las tablas necesarias (`productos`, `ventas`).

## Instrucciones de Instalación y Ejecución

### 1. Clona el repositorio

```bash
git clone https://github.com/tu_usuario/tu_repositorio.git
cd tu_repositorio
```

### 2. Crea un entorno virtual (opcional)
```
python -m venv venv
source venv/bin/activate    # En Mac/Linux
venv\Scripts\activate       # En Windows
```

### 3. Instala las dependencias
```
dash
pandas
mysql-connector-python
plotly
Luego instala todo con:
pip install -r requirements.txt
```

### 4. Configura la conexión a tu base de datos
Edita el archivo config.py:
```
# config.py

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "",  # Tu contraseña de MySQL
    "database": "tienda_ventas"
}
```

### 5. Ejecuta la aplicación
```
python app.py
```

### 6. Abre el navegador
```
http://127.0.0.1:8050/
```
¡Y verás el dashboard funcionando!

Si no tienes MySQL instalado, puedes usar XAMPP, MAMP o servicios de base de datos en la nube.
Para producción, se recomienda desactivar debug=True en app.run() y usar servidores como Gunicorn o uWSGI.
