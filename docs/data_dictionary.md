# Diccionario de datos

El esquema corresponde a la estructura implementada para la Prueba 2. Los registros de personas utilizados en la evaluación son ficticios.

## Profesor

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador del profesor |
| RUN | nvarchar(13) | No |  | RUN ficticio del dataset de prueba |
| Nombre | nvarchar(50) | No |  | Nombre ficticio |
| Apellido | nvarchar(80) | No |  | Apellido ficticio |
| Fecha_Nac | date | Sí |  | Fecha de nacimiento ficticia |
| ID_Asignatura | int | Sí | FK | Referencia a Asignatura |
| Direccion | nvarchar(255) | Sí |  | Dirección ficticia |
| ID_Comuna | int | Sí | FK | Referencia a Comuna |
| email | nvarchar(120) | Sí |  | Email ficticio |
| Telefono | nvarchar(15) | Sí |  | Teléfono ficticio |

## Alumno

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador del alumno |
| RUN | nvarchar(13) | No |  | RUN ficticio del dataset de prueba |
| Nombre | nvarchar(50) | No |  | Nombre ficticio |
| Apellido | nvarchar(80) | No |  | Apellido ficticio |
| Fecha_Nac | date | Sí |  | Fecha de nacimiento ficticia |
| Direccion | nvarchar(255) | Sí |  | Dirección ficticia |
| ID_Comuna | int | Sí | FK | Referencia a Comuna |
| ID_Curso | int | Sí | FK | Referencia a Curso |
| email | nvarchar(120) | Sí |  | Email ficticio |
| Telefono | nvarchar(15) | Sí |  | Teléfono ficticio |

## Asignatura

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador de asignatura |
| Nombre | nvarchar(20) | Sí |  | Nombre de asignatura |

## Comuna

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador de comuna |
| Nombre | nvarchar(20) | Sí |  | Nombre de comuna |

## Curso

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador del curso |
| Nombre | nvarchar(20) | No |  | Nombre del curso |

## Clase

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador del registro |
| ID_Profesor | int | No | FK | Referencia a Profesor |
| ID_Alumno | int | No | FK | Referencia a Alumno |

## Relaciones

- Profesor.ID_Asignatura → Asignatura.ID
- Profesor.ID_Comuna → Comuna.ID
- Alumno.ID_Comuna → Comuna.ID
- Alumno.ID_Curso → Curso.ID
- Clase.ID_Profesor → Profesor.ID
- Clase.ID_Alumno → Alumno.ID
