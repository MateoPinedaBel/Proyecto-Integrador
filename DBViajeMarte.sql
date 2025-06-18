CREATE TABLE [aspirantes] (
  [id_aspirante] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_tipo_documento] integer NOT NULL,
  [numero_id] varchar(10) UNIQUE NOT NULL,
  [primer_nombre] varchar(65) NOT NULL,
  [segundo_nombre] varchar(65),
  [primer_apellido] varchar(65) NOT NULL,
  [segundo_apellido] varchar(65),
  [fecha_nacimiento] date NOT NULL,
  [id_pais] integer NOT NULL,
  [correo] varchar(100) UNIQUE NOT NULL,
  [telefono] varchar(10) NOT NULL,
  [contrasena] varchar(20) NOT NULL
)
GO

CREATE TABLE [salud] (
  [id_salud] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_aspirante] integer UNIQUE NOT NULL,
  [enfermedad_cardiovascular] boolean NOT NULL,
  [fumador] boolean NOT NULL,
  [enfermedad_mental] boolean NOT NULL,
  [ejercicio] boolean NOT NULL,
  [aislamiento] boolean NOT NULL
)
GO

CREATE TABLE [perfil] (
  [id_perfil] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_aspirante] integer UNIQUE NOT NULL,
  [id_nivel_educativo] integer NOT NULL,
  [nivel_educativo_otro] varchar(50),
  [id_nivel_ingles] integer NOT NULL,
  [descripcion] varchar(300) NOT NULL
)
GO

CREATE TABLE [consentimientos] (
  [id_consentimiento] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_aspirante] integer UNIQUE NOT NULL,
  [acepto_terminos] boolean NOT NULL,
  [fecha_aceptacion] datetime NOT NULL
)
GO

CREATE TABLE [tipo_documento] (
  [id_tipo_documento] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_tipo] varchar(50) NOT NULL
)
GO

CREATE TABLE [pais] (
  [id_pais] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_pais] varchar(50) NOT NULL
)
GO

CREATE TABLE [nivel_educativo] (
  [id_nivel_educativo] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_nivel] varchar(50) NOT NULL
)
GO

CREATE TABLE [nivel_ingles] (
  [id_nivel_ingles] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_nivel] varchar(5) NOT NULL
)
GO

ALTER TABLE [aspirantes] ADD FOREIGN KEY ([id_tipo_documento]) REFERENCES [tipo_documento] ([id_tipo_documento])
GO

ALTER TABLE [aspirantes] ADD FOREIGN KEY ([id_pais]) REFERENCES [pais] ([id_pais])
GO

ALTER TABLE [salud] ADD FOREIGN KEY ([id_aspirante]) REFERENCES [aspirantes] ([id_aspirante])
GO

ALTER TABLE [perfil] ADD FOREIGN KEY ([id_aspirante]) REFERENCES [aspirantes] ([id_aspirante])
GO

ALTER TABLE [consentimientos] ADD FOREIGN KEY ([id_aspirante]) REFERENCES [aspirantes] ([id_aspirante])
GO

ALTER TABLE [perfil] ADD FOREIGN KEY ([id_nivel_educativo]) REFERENCES [nivel_educativo] ([id_nivel_educativo])
GO

ALTER TABLE [perfil] ADD FOREIGN KEY ([id_nivel_ingles]) REFERENCES [nivel_ingles] ([id_nivel_ingles])
GO
