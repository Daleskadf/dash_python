import dash
from dash import html, dcc
from dash.dependencies import Input, Output
import plotly.express as px
import pandas as pd
import mysql.connector
from config import DB_CONFIG  # Usamos config para la conexión

# Función para conectar y traer datos
def get_data():
    conn = mysql.connector.connect(
        host=DB_CONFIG["host"],
        user=DB_CONFIG["user"],
        password=DB_CONFIG["password"],
        database=DB_CONFIG["database"]
    )

    query = """
    SELECT p.nombre AS producto, p.categoria, p.precio, v.cantidad, v.fecha
    FROM ventas v
    JOIN productos p ON v.producto_id = p.id
    """
    df = pd.read_sql(query, conn)
    conn.close()
    return df

# Obtener datos
df = get_data()

# Crear app
app = dash.Dash(__name__)
app.title = "Dashboard de Ventas"

# Layout
app.layout = html.Div([
    html.H1("📊 Dashboard de Ventas", style={'textAlign': 'center'}),

    dcc.Dropdown(
        id='categoria-dropdown',
        options=[{'label': cat, 'value': cat} for cat in df['categoria'].unique()],
        value=df['categoria'].unique()[0],
        style={'width': '50%', 'margin': 'auto'}
    ),

    dcc.Graph(id='grafico-ventas'),
    
    html.Hr(),

    dcc.Graph(
        figure=px.bar(
            df.groupby('producto')['cantidad'].sum().reset_index(),
            x='producto',
            y='cantidad',
            title="Ventas totales por producto"
        )
    )
])

# Callback para gráfico dinámico
@app.callback(
    Output('grafico-ventas', 'figure'),
    Input('categoria-dropdown', 'value')
)
def update_graph(categoria):
    filtrado = df[df['categoria'] == categoria]
    fig = px.line(filtrado, x='fecha', y='cantidad', color='producto',
                  title=f"Ventas por día - Categoría: {categoria}")
    return fig

# Ejecutar
if __name__ == '__main__':
    app.run(debug=True)
