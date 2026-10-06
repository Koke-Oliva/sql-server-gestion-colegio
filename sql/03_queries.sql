/*
    Proyecto: Gestión de Datos Escolares con SQL Server
    Archivo: 03_queries.sql

    Consultas correspondientes a la evaluación original.
    La versión de portafolio se ejecuta sobre los datos ficticios originales proporcionados por el curso.
*/

USE ColegioPortfolio;
GO

-- Queries 1 a 6: verificación del contenido de cada tabla.

-- Query 1
SELECT *
FROM dbo.Comuna;
GO

-- Query 2
SELECT *
FROM dbo.Asignatura;
GO

-- Query 3
SELECT *
FROM dbo.Curso;
GO

-- Query 4
SELECT *
FROM dbo.Profesor;
GO

-- Query 5
SELECT *
FROM dbo.Alumno;
GO

-- Query 6
SELECT *
FROM dbo.Clase;
GO

-- Query 7
-- Profesores cuyo nombre termina con la letra "a".
SELECT *
FROM dbo.Profesor AS P
WHERE P.Nombre LIKE N'%a';
GO

-- Query 8
-- Alumnos sin email registrado.
SELECT *
FROM dbo.Alumno AS A
WHERE A.email IS NULL;
GO

-- Query 9
-- Profesores sin dirección o sin email.
SELECT *
FROM dbo.Profesor AS P
WHERE P.Direccion IS NULL
   OR P.email IS NULL;
GO

-- Query 10
-- Profesores que no sean de Santiago (ID_Comuna = 36),
-- incluyendo los que no tienen comuna.
-- Mostrar RUN, nombre, apellido, email y teléfono.
-- Ordenar por nombre ascendente.
SELECT
    P.RUN,
    P.Nombre,
    P.Apellido,
    P.email,
    P.Telefono
FROM dbo.Profesor AS P
WHERE P.ID_Comuna <> 36
   OR P.ID_Comuna IS NULL
ORDER BY P.Nombre ASC;
GO

-- Query 11
-- Nombre, apellido, ID de asignatura (alias Asignatura),
-- dirección e ID de comuna (alias Comuna) de los profesores.
SELECT
    P.Nombre,
    P.Apellido,
    P.ID_Asignatura AS Asignatura,
    P.Direccion,
    P.ID_Comuna AS Comuna
FROM dbo.Profesor AS P;
GO

-- Query 12
-- Cantidad de alumnos por curso.
SELECT
    A.ID_Curso,
    COUNT(A.ID_Curso) AS Cantidad_de_alumnos
FROM dbo.Alumno AS A
GROUP BY A.ID_Curso
ORDER BY A.ID_Curso;
GO
