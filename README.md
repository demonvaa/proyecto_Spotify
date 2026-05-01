# Spotify Top 50 Country: ETL & SQL Analysis 🎵📊

Este proyecto realiza un proceso completo de **ETL** (Extract, Transform, Load) sobre el ecosistema musical de Spotify. El objetivo es analizar cómo métricas técnicas (BPM, Energía, Valencia) definen el éxito global de artistas como **The Weeknd**, transformando datos planos de Kaggle en una base de datos relacional optimizada.

## 📋 Descripción del Proyecto

El corazón de este análisis es la normalización de datos. Hemos convertido un archivo `.csv` desordenado en un **Modelo de Estrella**, permitiendo consultas complejas que un archivo Excel no podría manejar eficientemente.

### El flujo de trabajo:
1.  **Extracción**: Ingesta del dataset original (Top 50 canciones por país).
2.  **Transformación (Pandas)**:
    *   Limpieza de columnas irrelevantes (`Unnamed: 0`).
    *   Identificación de entidades únicas: Artistas, Géneros y Países.
    *   Creación de IDs autoincrementales para normalización (1NF, 2NF, 3NF).
3.  **Carga (SQLAlchemy)**: Automatización del volcado de datos desde DataFrames de Python hacia MySQL/PostgreSQL.
4.  **Análisis SQL**: Extracción de *insights* sobre la intensidad emocional de la música actual.

## 🛠️ Tecnologías Utilizadas

*   **Python (Pandas)**: Limpieza y lógica de transformación.
*   **SQLAlchemy**: El puente entre la lógica de objetos y la base de datos.
*   **MySQL/PostgreSQL**: Motor de base de datos relacional.
*   **Kaggle API**: Origen de los datos.

## 🗄️ Modelo de Datos (ERD)

El diseño se basa en una tabla de hechos central conectada a tablas de dimensiones para evitar la redundancia:

*   **`artist`**: Maestro de intérpretes.
*   **`genre`**: Categorización musical.
*   **`country`**: Localización geográfica (incluye la categoría **'World'** para tendencias globales).
*   **`top50_country`**: Tabla de hechos con métricas clave ($bpm$, $nrgy$, $dnce$, $val$).

## 🔍 Diccionario de Datos (Métricas Clave)

Para entender el análisis, es vital conocer qué miden los algoritmos:

| Variable | Definición | Rango |
| :--- | :--- | :--- |
| **BPM** | Tempo/Velocidad de la canción. | 60 - 200+ |
| **Energy (nrgy)** | Intensidad, actividad y ruido percibido. | 0 - 100 |
| **Valence (val)** | Positividad emocional (Baja = Triste/Enfadado). | 0 - 100 |
| **Danceability** | Qué tan apta es la canción para bailar. | 0 - 100 |

---

## 📊 Casos de Análisis (SQL Queries)

### 1. El Fenómeno "Intenso pero Melancólico"
Buscamos artistas que dominan el cuadrante de **Alta Energía ($>70$)** pero **Baja Valencia ($<50$)**. Es la música perfecta para situaciones de alta tensión emocional.


### 2. Deep Dive: The Weeknd
Analizando específicamente a Abel Tesfaye, filtramos sus canciones que cumplen con este perfil de **"Toxicidad Energética"**:

*   **Canciones detectadas**: *Blinding Lights*, *Heartless*.
*   **Alcance Global**: Estas canciones no solo son éxitos aislados, aparecen en el Top 50 de múltiples países simultáneamente, demostrando que la "tristeza bailable" es un producto de exportación global.

### 3. Tendencias en el Chart "World"
¿Qué géneros dominan el mundo cuando eliminamos las fronteras nacionales?

## 🚀 Cómo ejecutar este proyecto

1. **Clona el repositorio:** git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/tu-usuario/tu-repositorio.git)
   
2. **Instala dependencias:** pip install pandas sqlalchemy pymysql cryptography

3. **Configura tus credenciales en el archivo config.py.**

4. **Ejecuta el notebook de Jupyter para iniciar el proceso ETL.**

5. **Abre tu gestor SQL preferido y carga las queries de la carpeta /queries.**

6. **link presentación:** https://www.canva.com/design/DAHIVLP2G-k/Wx-ngwOS_HPiT-a_ypn_yw/edit