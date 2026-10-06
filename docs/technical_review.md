# Revisión técnica y decisiones de profesionalización

## Diagnóstico del repositorio original

| Observación | Impacto | Ajuste |
|---|---|---|
| Un único archivo mezclaba DDL, carga y consultas | Dificulta revisión rápida | Separación modular en cuatro scripts |
| El README hablaba de consultas “avanzadas” | Sobreestima la complejidad real | Se describen como fundamentos SQL Server |
| No quedaba clara la autoría del modelo y dataset | Podía atribuir trabajo proporcionado por el curso | Se documenta explícitamente el alcance |
| Los INSERT dependían del orden de columnas | Menor robustez y legibilidad | La versión modular agrega listas de columnas |
| Objetos sin esquema explícito | Menor precisión | Uso de `dbo` |
| No había controles de calidad | Menor trazabilidad | Script separado de validaciones |
| Las capturas estaban dispersas | Evidencia menos accesible | Galería documentada de resultados |

## Fidelidad con la evaluación

La versión de portafolio conserva:

- las seis entidades;
- las seis relaciones;
- los **datos ficticios originales proporcionados por el curso**;
- la lógica de las consultas 7 a 12;
- la entrega académica original sin alterar.

## Qué se añadió después

`04_data_quality_checks.sql` es una **extensión posterior de portafolio**. No formó parte de la Prueba 2.

Sus JOIN y controles de volumen, duplicados, integridad y completitud deben interpretarse como una demostración adicional de criterio de calidad de datos, no como parte del desempeño evaluado originalmente.

## Hallazgo de calidad de datos

El dataset ficticio de alumnos reutiliza valores de RUN en distintos registros. La versión de portafolio **no corrige esos datos**, porque fueron proporcionados por el curso; simplemente los detecta y documenta mediante una consulta de calidad.

Esto permite mostrar una práctica importante: separar la fidelidad a una fuente de datos de la evaluación de su calidad.

## Mejoras que corresponderían a producción

Dependiendo de las reglas de negocio:

- restricciones `UNIQUE` para identificadores naturales una vez saneados los datos;
- índices nonclustered sobre claves foráneas según patrones de consulta;
- `CHECK` constraints para dominios;
- transacciones y manejo de errores en cargas;
- roles y permisos;
- auditoría y trazabilidad;
- revisión de la relación profesor–asignatura si existiera cardinalidad muchos-a-muchos;
- análisis de planes de ejecución antes de optimizar.

## Nivel técnico defendible

Este proyecto permite defender:

- `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE`;
- PK y FK;
- carga con `INSERT`;
- `WHERE`, `LIKE`, `IS NULL`, `OR`;
- alias y `ORDER BY`;
- `COUNT` y `GROUP BY`;
- controles básicos de calidad añadidos posteriormente.

No demuestra por sí solo SQL avanzado, tuning, administración de SQL Server, procedimientos almacenados, CTE ni funciones de ventana.
