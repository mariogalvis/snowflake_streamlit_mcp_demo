-- ======================================================
-- 🧱 CONFIGURACIÓN INICIAL DE ENTORNO PARA APP GENAI
-- ======================================================

-- 1️⃣ Crear el Warehouse
CREATE WAREHOUSE IF NOT EXISTS VW_GENAI
  WITH WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Virtual Warehouse para apps GenAI';

-- 2️⃣ Crear la Base de Datos
CREATE DATABASE IF NOT EXISTS DB_APP
  COMMENT = 'Base de datos para aplicaciones de Streamlit y Snowflake Cortex';

-- 3️⃣ Crear el Esquema
CREATE SCHEMA IF NOT EXISTS DB_APP.APP
  COMMENT = 'Esquema de trabajo para aplicaciones AI';

-- 4️⃣ Asignar privilegios (puedes ajustar el rol según tu entorno)
GRANT ALL PRIVILEGES ON WAREHOUSE VW_GENAI TO ROLE ACCOUNTADMIN;
GRANT ALL PRIVILEGES ON DATABASE DB_APP TO ROLE ACCOUNTADMIN;
GRANT ALL PRIVILEGES ON SCHEMA DB_APP.APP TO ROLE ACCOUNTADMIN;

-- 5️⃣ Seleccionar el contexto para la sesión actual
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE VW_GENAI;
USE DATABASE DB_APP;
USE SCHEMA APP;

-- 6️⃣ Confirmar configuración activa
SELECT
  CURRENT_ROLE() AS ROLE_ACTUAL,
  CURRENT_WAREHOUSE() AS WAREHOUSE_ACTUAL,
  CURRENT_DATABASE() AS DATABASE_ACTUAL,
  CURRENT_SCHEMA() AS SCHEMA_ACTUAL;

-- ======================================================
-- ✅ ENTORNO CONFIGURADO CORRECTAMENTE
-- ======================================================
