/*
    Proyecto: Gestión de Datos Escolares con SQL Server
    Archivo: 04_data_quality_checks.sql

    EXTENSIÓN DE PORTAFOLIO
    -----------------------
    Este archivo NO formó parte de la Prueba 2 original.

    Se ejecuta sobre los datos ficticios proporcionados por el curso y
    permite revisar volumen, duplicados, integridad referencial y completitud.
*/

USE ColegioPortfolio;
GO

SET NOCOUNT ON;
GO

-- 1. Control de volumen esperado.
SELECT N'Comuna' AS Tabla, COUNT(*) AS Filas, 37 AS Esperadas
FROM dbo.Comuna
UNION ALL
SELECT N'Asignatura', COUNT(*), 7
FROM dbo.Asignatura
UNION ALL
SELECT N'Curso', COUNT(*), 8
FROM dbo.Curso
UNION ALL
SELECT N'Profesor', COUNT(*), 11
FROM dbo.Profesor
UNION ALL
SELECT N'Alumno', COUNT(*), 60
FROM dbo.Alumno
UNION ALL
SELECT N'Clase', COUNT(*), 200
FROM dbo.Clase;
GO

-- 2. RUN duplicados en profesores.
SELECT
    P.RUN,
    COUNT(*) AS Repeticiones
FROM dbo.Profesor AS P
GROUP BY P.RUN
HAVING COUNT(*) > 1;
GO

-- 3. RUN duplicados en alumnos.
-- El dataset ficticio original reutiliza RUN en distintos registros.
-- Se detectan, pero no se modifican, para conservar fidelidad con la fuente.
SELECT
    A.RUN,
    COUNT(*) AS Repeticiones
FROM dbo.Alumno AS A
GROUP BY A.RUN
HAVING COUNT(*) > 1
ORDER BY A.RUN;
GO

-- 4. Registros de Clase sin profesor o alumno relacionado.
SELECT
    C.ID,
    C.ID_Profesor,
    C.ID_Alumno
FROM dbo.Clase AS C
LEFT JOIN dbo.Profesor AS P
    ON P.ID = C.ID_Profesor
LEFT JOIN dbo.Alumno AS A
    ON A.ID = C.ID_Alumno
WHERE P.ID IS NULL
   OR A.ID IS NULL;
GO

-- 5. Alumnos con claves de catálogo no resolubles.
SELECT
    A.ID,
    A.ID_Comuna,
    A.ID_Curso
FROM dbo.Alumno AS A
LEFT JOIN dbo.Comuna AS CO
    ON CO.ID = A.ID_Comuna
LEFT JOIN dbo.Curso AS CU
    ON CU.ID = A.ID_Curso
WHERE (A.ID_Comuna IS NOT NULL AND CO.ID IS NULL)
   OR (A.ID_Curso IS NOT NULL AND CU.ID IS NULL);
GO

-- 6. Perfil de completitud de datos de contacto.
SELECT
    COUNT(*) AS Total_Alumnos,
    SUM(CASE WHEN A.email IS NULL THEN 1 ELSE 0 END) AS Sin_Email,
    SUM(CASE WHEN A.Direccion IS NULL THEN 1 ELSE 0 END) AS Sin_Direccion,
    SUM(CASE WHEN A.Telefono IS NULL THEN 1 ELSE 0 END) AS Sin_Telefono
FROM dbo.Alumno AS A;
GO
