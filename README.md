# Spotify Top 50 Country: ETL & SQL Analysis 🎵📊

Este proyecto consiste en un proceso completo de **ETL** (Extract, Transform, Load) y análisis de datos. Partiendo de un dataset de Kaggle con las 50 canciones más escuchadas por país, hemos normalizado la estructura de los datos en Python para cargarla en una base de datos relacional (MySQL/PostgreSQL) y realizar análisis mediante consultas SQL.

## 📋 Descripción del Proyecto

El objetivo principal es transformar un archivo plano (`.csv`) en un modelo de base de datos relacional normalizado. Esto permite una gestión de datos más eficiente y evita la redundancia de información.

### El flujo de trabajo ha sido:
1.  **Extracción**: Lectura del dataset original de Kaggle.
2.  **Transformación (Pandas)**: 
    * Identificación de entidades únicas: Artistas, Géneros y Países.
    * Creación de tablas maestras con IDs autoincrementales.
    * Mapeo de las IDs en la tabla principal (`top50_country`) para establecer relaciones.
3.  **Carga (SQLAlchemy)**: Conexión y volcado de datos desde Python hacia un esquema SQL predefinido.
4.  **Análisis**: Resolución de preguntas mediante consultas SQL.

## 🛠️ Tecnologías Utilizadas

* **Python**: Lenguaje principal para el procesamiento.
* **Pandas**: Limpieza y normalización de datos.
* **SQLAlchemy**: Motor de conexión entre Python y SQL.
* **SQL (MySQL/Postgres)**: Diseño del esquema y consultas de análisis.
* **Kaggle**: Fuente de datos.

## 🗄️ Diseño del Modelo de Datos (ERD)

El esquema de la base de datos sigue un modelo de **Estrella**, donde la tabla de hechos es `top50_country` y está relacionada mediante llaves foráneas (*Foreign Keys*) con las tablas de dimensiones:

* **`artist`**: ID y Nombre del artista.
* **`genre`**: ID y Nombre del género musical.
* **`country`**: ID y Nombre del país.
* **`top50_country`**: Tabla principal que contiene las métricas (bpm, energía, danza, etc.) y las FKs correspondientes.
