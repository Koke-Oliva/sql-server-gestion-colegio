/*
    Proyecto: Gestión de Datos Escolares con SQL Server
    Archivo: 01_schema.sql

    Versión de portafolio del esquema implementado en la Prueba 2.
    El modelo de relaciones fue proporcionado por el curso y aquí se implementa
    de forma reproducible sobre una base de demostración separada.
*/

SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

IF DB_ID(N'ColegioPortfolio') IS NULL
BEGIN
    EXEC(N'CREATE DATABASE ColegioPortfolio');
END;
GO

USE ColegioPortfolio;
GO

-- Permite volver a ejecutar el script de demostración sin eliminar la base.
DROP TABLE IF EXISTS dbo.Clase;
DROP TABLE IF EXISTS dbo.Alumno;
DROP TABLE IF EXISTS dbo.Profesor;
DROP TABLE IF EXISTS dbo.Curso;
DROP TABLE IF EXISTS dbo.Asignatura;
DROP TABLE IF EXISTS dbo.Comuna;
GO

-- 1. Creación de tablas.
CREATE TABLE dbo.Profesor
(
    ID             int           NOT NULL,
    RUN            nvarchar(13)  NOT NULL,
    Nombre         nvarchar(50)  NOT NULL,
    Apellido       nvarchar(80)  NOT NULL,
    Fecha_Nac      date          NULL,
    ID_Asignatura  int           NULL,
    Direccion      nvarchar(255) NULL,
    ID_Comuna      int           NULL,
    email          nvarchar(120) NULL,
    Telefono       nvarchar(15)  NULL,
    CONSTRAINT PK_Profesor PRIMARY KEY (ID)
);
GO

CREATE TABLE dbo.Alumno
(
    ID         int           NOT NULL,
    RUN        nvarchar(13)  NOT NULL,
    Nombre     nvarchar(50)  NOT NULL,
    Apellido   nvarchar(80)  NOT NULL,
    Fecha_Nac  date          NULL,
    Direccion  nvarchar(255) NULL,
    ID_Comuna  int           NULL,
    ID_Curso   int           NULL,
    email      nvarchar(120) NULL,
    Telefono   nvarchar(15)  NULL,
    CONSTRAINT PK_Alumno PRIMARY KEY (ID)
);
GO

CREATE TABLE dbo.Asignatura
(
    ID      int          NOT NULL,
    Nombre  nvarchar(20) NULL,
    CONSTRAINT PK_Asignatura PRIMARY KEY (ID)
);
GO

CREATE TABLE dbo.Comuna
(
    ID      int          NOT NULL,
    Nombre  nvarchar(20) NULL,
    CONSTRAINT PK_Comuna PRIMARY KEY (ID)
);
GO

CREATE TABLE dbo.Curso
(
    ID      int          NOT NULL,
    Nombre  nvarchar(20) NOT NULL,
    CONSTRAINT PK_Curso PRIMARY KEY (ID)
);
GO

CREATE TABLE dbo.Clase
(
    ID           int NOT NULL,
    ID_Profesor  int NOT NULL,
    ID_Alumno    int NOT NULL,
    CONSTRAINT PK_Clase PRIMARY KEY (ID)
);
GO

-- 2. Implementación de las relaciones indicadas por el diagrama de la evaluación.
ALTER TABLE dbo.Profesor
ADD CONSTRAINT FK_Profesor_Asignatura
    FOREIGN KEY (ID_Asignatura) REFERENCES dbo.Asignatura(ID);
GO

ALTER TABLE dbo.Profesor
ADD CONSTRAINT FK_Profesor_Comuna
    FOREIGN KEY (ID_Comuna) REFERENCES dbo.Comuna(ID);
GO

ALTER TABLE dbo.Clase
ADD CONSTRAINT FK_Clase_Profesor
    FOREIGN KEY (ID_Profesor) REFERENCES dbo.Profesor(ID);
GO

ALTER TABLE dbo.Clase
ADD CONSTRAINT FK_Clase_Alumno
    FOREIGN KEY (ID_Alumno) REFERENCES dbo.Alumno(ID);
GO

ALTER TABLE dbo.Alumno
ADD CONSTRAINT FK_Alumno_Curso
    FOREIGN KEY (ID_Curso) REFERENCES dbo.Curso(ID);
GO

ALTER TABLE dbo.Alumno
ADD CONSTRAINT FK_Alumno_Comuna
    FOREIGN KEY (ID_Comuna) REFERENCES dbo.Comuna(ID);
GO
