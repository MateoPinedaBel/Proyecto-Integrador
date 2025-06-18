# 📊 Base de Datos: Viaje a Marte 🚀

Este proyecto define la estructura relacional para una base de datos SQL Server destinada a gestionar aspirantes para un viaje a Marte, incluyendo su información personal, estado de salud, perfil académico y consentimiento legal.

---

## 📑 Estructura de la Base de Datos

La base de datos está normalizada y estructurada en **8 tablas principales**, con integridad referencial asegurada mediante claves foráneas.

---

## 📌 Tablas

### 📝 `aspirantes`
Almacena información personal de los aspirantes.

| Campo             | Tipo       | Descripción                        |
|:-----------------|:-----------|:-----------------------------------|
| id_aspirante      | integer (PK) IDENTITY | Clave primaria autoincremental |
| id_tipo_documento | integer (FK) | Referencia a `tipo_documento`     |
| numero_id         | varchar(10) UNIQUE | Número de identificación único  |
| primer_nombre     | varchar(65) | Primer nombre                     |
| segundo_nombre    | varchar(65) | Segundo nombre (opcional)         |
| primer_apellido   | varchar(65) | Primer apellido                   |
| segundo_apellido  | varchar(65) | Segundo apellido (opcional)       |
| fecha_nacimiento  | date        | Fecha de nacimiento               |
| id_pais           | integer (FK) | Referencia a `pais`               |
| correo            | varchar(100) UNIQUE | Correo electrónico único        |
| telefono          | varchar(10) | Número telefónico                 |
| contrasena        | varchar(20) | Contraseña                        |

---

### 💓 `salud`
Estado de salud de cada aspirante.

| Campo                     | Tipo     | Descripción                               |
|:--------------------------|:----------|:------------------------------------------|
| id_salud                   | integer (PK) IDENTITY | Clave primaria                          |
| id_aspirante               | integer (FK, UNIQUE) | Referencia única a `aspirantes`         |
| enfermedad_cardiovascular  | boolean  | Indicador de condición                   |
| fumador                    | boolean  | Indicador de hábito de fumar             |
| enfermedad_mental          | boolean  | Indicador de condición                   |
| ejercicio                  | boolean  | Realiza actividad física                 |
| aislamiento                | boolean  | Ha estado en aislamiento prolongado     |

---

### 🎓 `perfil`
Información académica y motivacional.

| Campo                  | Tipo       | Descripción                              |
|:-----------------------|:------------|:------------------------------------------|
| id_perfil               | integer (PK) IDENTITY | Clave primaria                          |
| id_aspirante            | integer (FK, UNIQUE) | Referencia única a `aspirantes`         |
| id_nivel_educativo      | integer (FK) | Nivel académico                          |
| nivel_educativo_otro    | varchar(50) | Detalle si el nivel es "Otro"            |
| id_nivel_ingles         | integer (FK) | Nivel de inglés                          |
| descripcion             | varchar(300) | Motivo por el cual desea viajar a Marte |

---

### 📜 `consentimientos`
Registro de consentimiento de términos.

| Campo            | Tipo       | Descripción                               |
|:-----------------|:------------|:------------------------------------------|
| id_consentimiento | integer (PK) IDENTITY | Clave primaria                          |
| id_aspirante      | integer (FK, UNIQUE) | Referencia única a `aspirantes`         |
| acepto_terminos   | boolean    | Indicador de aceptación                   |
| fecha_aceptacion  | datetime   | Fecha de aceptación de los términos       |

---

### 🗂️ Tablas Catálogo

#### 📄 `tipo_documento`
Tipos de documentos disponibles.

| Campo        | Tipo       | Descripción              |
|:--------------|:------------|:-------------------------|
| id_tipo_documento | integer (PK) IDENTITY | Clave primaria |
| nombre_tipo   | varchar(50) | Nombre del tipo de documento |

#### 🌍 `pais`
Listado de países.

| Campo      | Tipo       | Descripción              |
|:------------|:------------|:-------------------------|
| id_pais    | integer (PK) IDENTITY | Clave primaria |
| nombre_pais | varchar(50) | Nombre del país            |

#### 🎓 `nivel_educativo`
Niveles de educación posibles.

| Campo             | Tipo       | Descripción              |
|:--------------------|:------------|:-------------------------|
| id_nivel_educativo | integer (PK) IDENTITY | Clave primaria |
| nombre_nivel       | varchar(50) | Nombre del nivel académico |

#### 🇬🇧 `nivel_ingles`
Niveles de inglés disponibles.

| Campo          | Tipo       | Descripción              |
|:----------------|:------------|:-------------------------|
| id_nivel_ingles | integer (PK) IDENTITY | Clave primaria |
| nombre_nivel    | varchar(5) | Nivel de inglés (A1, B1, C1, etc.) |

---

## 🔗 Relaciones (Foreign Keys)

| Origen          | Destino             | Relación                        |
|:----------------|:--------------------|:---------------------------------|
| aspirantes.id_tipo_documento | tipo_documento.id_tipo_documento | Muchos a uno |
| aspirantes.id_pais | pais.id_pais       | Muchos a uno |
| salud.id_aspirante | aspirantes.id_aspirante | Uno a uno |
| perfil.id_aspirante | aspirantes.id_aspirante | Uno a uno |
| perfil.id_nivel_educativo | nivel_educativo.id_nivel_educativo | Muchos a uno |
| perfil.id_nivel_ingles | nivel_ingles.id_nivel_ingles | Muchos a uno |
| consentimientos.id_aspirante | aspirantes.id_aspirante | Uno a uno |

---

## 📊 Diagrama Entidad-Relación (ERD)

Puedes convertir esta estructura fácilmente en un diagrama visual usando [dbdiagram.io](https://dbdiagram.io).


Table aspirantes {
  id_aspirante integer [primary key, increment, not null]
  id_tipo_documento integer [not null]
  numero_id varchar(10) [not null, unique]
  primer_nombre varchar(65) [not null]
  segundo_nombre varchar(65)
  primer_apellido varchar(65) [not null]
  segundo_apellido varchar(65)
  fecha_nacimiento date [not null]
  id_pais integer [not null]
  correo varchar(100) [not null, unique]
  telefono varchar(10) [not null]
  contrasena varchar(20) [not null]
}

Table salud {
  id_salud integer [primary key, increment, not null]
  id_aspirante integer [not null, unique]
  enfermedad_cardiovascular boolean [not null]
  fumador boolean [not null]
  enfermedad_mental boolean [not null]
  ejercicio boolean [not null]
  aislamiento boolean [not null]
}

Table perfil {
  id_perfil integer [primary key, increment, not null]
  id_aspirante integer [not null, unique]
  id_nivel_educativo integer [not null]
  nivel_educativo_otro varchar(50)
  id_nivel_ingles integer [not null]
  descripcion varchar(300) [not null]
}

Table consentimientos {
  id_consentimiento integer [primary key, increment, not null]
  id_aspirante integer [not null, unique]
  acepto_terminos boolean [not null]
  fecha_aceptacion datetime [not null]
}

Table tipo_documento {
  id_tipo_documento integer [primary key, increment, not null]
  nombre_tipo varchar(50) [not null]
}

Table pais {
  id_pais integer [primary key, increment, not null]
  nombre_pais varchar(50) [not null]
}

Table nivel_educativo {
  id_nivel_educativo integer [primary key, increment, not null]
  nombre_nivel varchar(50) [not null]
}

Table nivel_ingles {
  id_nivel_ingles integer [primary key, increment, not null]
  nombre_nivel varchar(5) [not null]
}

// Relaciones

Ref: aspirantes.id_tipo_documento > tipo_documento.id_tipo_documento
Ref: aspirantes.id_pais > pais.id_pais

Ref: salud.id_aspirante > aspirantes.id_aspirante
Ref: perfil.id_aspirante > aspirantes.id_aspirante
Ref: consentimientos.id_aspirante > aspirantes.id_aspirante

Ref: perfil.id_nivel_educativo > nivel_educativo.id_nivel_educativo
Ref: perfil.id_nivel_ingles > nivel_ingles.id_nivel_ingles


---

## ✅ Notas

- Base de datos en **Tercera Forma Normal (3FN)**: sin redundancias, dependencias funcionales completas y relaciones adecuadas.
- Control estricto de integridad referencial.
- Validación de unicidad en correos y número de documento.
- Apta para aplicaciones de gestión de inscripciones y selección de personal para proyectos espaciales.

---

## 📦 Tecnologías

- **SQL Server**
- **T-SQL**
- **dbdiagram.io**

---

## 📌 Autor

Proyecto estructurado y documentado por Sara Álvarez, Dariannys Zambrano, Mateo Pineda
