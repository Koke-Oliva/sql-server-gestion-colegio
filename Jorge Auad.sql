-- 1. Crear la Base de Datos Colegio.

CREATE DATABASE Colegio
GO

USE Colegio
GO 

-- 2. Crear las tablas de la Base de Datos

CREATE TABLE Profesor			
(ID	int	Primary Key	NOT NULL,
RUN	nvarchar(13) NOT NULL,
Nombre nvarchar(50) NOT NULL,
Apellido nvarchar(80) NOT NULL,
Fecha_Nac date NULL,
ID_Asignatura int NULL,
Direccion nvarchar(255)	NULL,
ID_Comuna int NULL,
email nvarchar(120)	NULL,
Telefono nvarchar(15) NULL)
GO

CREATE TABLE Alumno			
(ID int PRIMARY KEY NOT NULL,
RUN	nvarchar(13) NOT NULL,
Nombre nvarchar(50)	NOT NULL,
Apellido nvarchar(80) NOT NULL,
Fecha_Nac date NULL,
Direccion nvarchar(255)	NULL,
ID_Comuna int NULL,
ID_Curso int NULL,
email nvarchar(120) NULL,
Telefono nvarchar(15) NULL)
GO

CREATE TABLE Asignatura			
(ID	int	PRIMARY KEY	NOT NULL,
Nombre nvarchar(20) NULL)
GO

CREATE TABLE Comuna			
(ID	int	PRIMARY KEY	NOT NULL,
Nombre nvarchar(20) NULL)
GO

CREATE TABLE Curso			
(ID	int	PRIMARY KEY NOT NULL,
Nombre	nvarchar(20) NOT NULL)
GO

CREATE TABLE Clase			
(ID	int	PRIMARY KEY	NOT NULL,
ID_Profesor	int	NOT NULL,
ID_Alumno int NOT NULL)
GO

-- 3. Relacionamiento de tablas -- 
ALTER TABLE Profesor ADD CONSTRAINT FK_Profesor_Asignatura
FOREIGN KEY (ID_Asignatura) REFERENCES Asignatura(ID)
GO

ALTER TABLE Profesor ADD CONSTRAINT FK_Profesor_Comuna
FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID)
GO

ALTER TABLE Clase ADD CONSTRAINT FK_Clase_Profesor
FOREIGN KEY (ID_Profesor) REFERENCES Profesor(ID)
GO

ALTER TABLE Clase ADD CONSTRAINT FK_Clase_Alumno			
FOREIGN KEY (ID_Alumno) REFERENCES Alumno(ID)
GO

ALTER TABLE Alumno ADD CONSTRAINT FK_Alumno_Curso						
FOREIGN KEY (ID_Curso) REFERENCES Curso(ID)
GO

ALTER TABLE Alumno ADD CONSTRAINT FK_Alumno_Comuna									
FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID)
GO

-- 4. Poblado de tablas --
INSERT Comuna 
	 VALUES (1,'Cerrillos'),
			(2,'Cerro Navia'),
			(3,'Conchal�'),
			(4,'El Bosque'),
			(5,'Estaci�n Central'),
			(6,'Huechuraba'),
			(7,'Independencia'),
			(8,'La Cisterna'),
			(9,'La Florida'),
			(10,'La Granja'),
			(11,'La Pintana'),
			(12,'LaReina'),
			(13,'Las Condes'),
			(14,'Lo Barnechea'),
			(15,'Lo Espejo'),
			(16,'Lo Prado'),
			(17,'Macul'),
			(18,'Maip�'),
			(19,'�u�oa'),
			(20,'Padre Hurtado'),
			(21,'Pedro Aguirre Cerda'),
			(22,'Pe�alol�n'),
			(23,'Pirque'),
			(24,'Providencia'),
			(25,'Pudahuel'),
			(26,'Puente Alto'),
			(27,'Quilicura'),
			(28,'Quinta Normal'),
			(29,'Recoleta'),
			(30,'Renca'),
			(31,'San Bernardo'),
			(32,'San Joaqu�n'),
			(33,'San Jos� de Maipo'),
			(34,'San Miguel'),
			(35,'San Ram�n'),
			(36,'Santiago'),
			(37,'Vitacura');
GO
INSERT Asignatura
	 VALUES (1,'Matem�ticas'),
			(2,'Lenguaje'),
			(3,'Arte'),
			(4,'Historia'),
			(5,'Ciencias'),
			(6,'Educaci�n F�sica'),
			(7,'Ingl�s');
GO

INSERT Curso
	 VALUES (1,'1 A'),
			(2,'1 B'),
			(3,'2 A'),
			(4,'2 B'),
			(5,'3 A'),
			(6,'3 B'),
			(7,'4 A'),
			(8,'4 B');

GO

INSERT Profesor
	 VALUES	(1,'7.444.673-4','Irene','Gallardo','1947-1-23',1,'Los Militares 6543',13,'igallardo@email.com',224137766),
			(2,'8.132.420-5','Maria','Herrera','1953-7-20',1,'Providencia 678',24,'mherrera@email.com',226589748),
			(3,'9.934.176-9','Victor','Ya�ez','1963-10-19',2,'Chacabuco 245',18,'vya�ez@email.com',225989185),
			(4,'8.441.763-9','Mariela','Pujado','1954-10-20',3,'Nataniel Cox 667',36,'mpujado@email.com',NULL),
			(5,'9.441.200-0','M�nica','Varas','1959-8-8',4,'Antonio Varas 876',24,'mvaras@email.com',227838812),
			(6,'7.218.313-K','Gustavo','Encina','1946-12-27',5,'Portugal 645',36,'gencina@email.com',224569874),
			(7,'9.304.721-3','Patricia','Toro','1957-1-11',5,'Alberto Llona 472',18,NULL,223698547),
			(8,'9.819.938-6','Silvia','Velasco','1963-2-10',6,NULL,NULL,'svelasco@email.com',222575976),
			(9,'9.278.913-8','Nelson','Soto','1956-9-1',7,NULL,NULL,'nsoto@email.com',226785413),
			(10,'7.691.632-2','Mar�a','Ponce','1959-11-23',2,'Las Encinas 25',19,'mponce@email.com',NULL),
			(11,'7.008.269-1','Nancy','Rojas','1958-3-1',4,'Los Alerces 236',19,NULL,227656789);

GO

INSERT Alumno
	 VALUES (1,'4.857.208-8','Francisco','Alvarez','1942-3-18','Eche�ique 8625',12,8,NULL,223226438),
			(2,'6.028.434-9','Carlos','Araya','1942-4-3','El Salto 167',29,5,'caraya@email.com',225011561),
			(3,'6.324.328-7','Clara','Barraza','1943-9-27',NULL,NULL,5,'cbarraza@email.com',222543964),
			(4,'16.199.353-0','Jorge','Berr�os','1990-1-22','Sim�n Bol�var 7432',12,7,'jberr�os@email.com',226826874),
			(5,'19.950.982-0','Germ�n','Carre�o','1996-1-8',NULL,NULL,3,'gcarre�o@email.com',226801339),
			(6,'19.308.207-1','Pamela','Castro','1995-1-30',NULL,NULL,2,'pcastro@email.com',228560015),
			(7,'7.008.269-0','Gloria','Cornejo','1944-6-17','Chile Espa�a 876',19,7,NULL,225819412),
			(8,'13.472.018-3','Julio','Gallardo','1983-8-5',NULL,NULL,3,'jgallardo@email.com',223835647),
			(9,'7.808.919-3','Ivo','Guti�rrez','1948-5-31','Santa Isabel 076',36,7,'igutierrez@email.com',228119292),
			(10,'16.321.962-3','Rosa','Lira','1991-8-7',NULL,NULL,1,'rlira@email.com',223485960),
			(11,'14.475.005-3','Carlos','L�pez','1984-6-12','Jos� Zapiola 8678',12,3,'cl�pez@email.com',223788925),
			(12,'17.559.399-9','Karina','Morande','1991-9-19',NULL,NULL,3,'kmorande@email.com',NULL),
			(13,'7.833.272-3','Jorge','Oro','1953-1-26','Campo de Deporte 457',19,4,'joro@email.com',226301385),
			(14,'14.534.494-5','Mar�a','Paz','1988-3-16',NULL,NULL,2,'mpaz@email.com',223730108),
			(15,'10.729.545-4','Juan','Pe�a','1969-4-11',NULL,NULL,6,'jpena@email.com',227119350),
			(16,'7.977.572-0','Marcela','Perez','1953-1-29','Los Maitenes 574',12,5,'mperez@email.com',NULL),
			(17,'12.836.186-4','Juan','Pi�a','1980-3-9',NULL,NULL,6,'jpina@email.com',228750990),
			(18,'20.499.764-1','Guillermo','Quiroz','1996-7-3','Los Zapadores 516',29,2,'gquiroz@email.com',227426067),
			(19,'8.733.113-0','Miguel','Recabarren','1955-3-7',NULL,NULL,7,NULL,NULL),
			(20,'12.196.260-0','Juan','Riquelme','1973-4-9',NULL,NULL,1,'jriquelme@email.com',222443020),
			(21,'8.827.579-8','Andr�s','Rivera','1955-10-2','Las Palmeras 125',19,3,NULL,223503779),
			(22,'12.260.835-9','Rolando','Rocco','1978-1-29',NULL,NULL,6,'rrocco@email.com',226359092),
			(23,'20.798.844-7','Omar','Romero','1999-3-14','El Greco 459',12,6,'oromero@email.com',228634098),
			(24,'18.486.116-0','Karen','Salinas','1992-12-15',NULL,NULL,2,'ksalinas@email.com',225317389),
			(25,'6.857.752-7','Edgar','Sanhueza','1944-4-14','Lira 1454',36,2,'esanhueza@email.com',223329246),
			(26,'14.628.513-8','Mat�as','Santander','1989-3-4',NULL,NULL,8,'msantander@email.com',225580432),
			(27,'11.201.692-3','Ang�lica','Silva','1971-10-2','Ort�z de Rozas 457',29,8,'asilva@email.com',227902328),
			(28,'11.041.393-5','Estela','Toledo','1969-4-20',NULL,NULL,2,'etoledo@email.com',224019249),
			(29,'12.549.867-3','Diego','Troncoso','1979-2-28',NULL,NULL,8,'dtroncoso@email.com',227366524),
			(30,'9.427.032-9','Raul','Trujillo','1957-12-3','Los Leones 789',24,1,'rtrujillo@email.com',226707558),
			(31,'4.857.208-8','Andr�s','Trujillo','1942-3-18','Eche�ique 8625',12,7,'atrujillo@micorreo.cl',228750990),
			(32,'6.028.434-9','Ang�lica','Troncoso','1942-4-3',NULL,NULL,3,'atroncoso@micorreo.cl',228634098),
			(33,'6.324.328-7','Carlos','Toledo','1943-9-27','El Salto 167',29,8,'ctoledo@micorreo.cl',228560015),
			(34,'16.199.353-0','Carlos','Silva','1990-1-22','Sim�n Bol�var 7432',12,3,'csilva@micorreo.cl',228119292),
			(35,'19.950.982-0','Clara','Santander','1996-1-8','Chile Espa�a 876',19,6,NULL,NULL),
			(36,'19.308.207-1','Diego','Sanhueza','1995-1-30',NULL,NULL,1,'dsanhueza@micorreo.cl',227426067),
			(37,'7.008.269-0','Edgar','Salinas','1944-6-17',NULL,NULL,8,'esalinas@micorreo.cl',227366524),
			(38,'13.472.018-3','Estela','Romero','1983-8-5',NULL,NULL,2,'eromero@micorreo.cl',227119350),
			(39,'7.808.919-3','Francisco','Rocco','1948-5-31','Santa Isabel 076',36,3,NULL,NULL),
			(40,'16.321.962-3','Germ�n','Rivera','1991-8-7','Jos� Zapiola 8678',12,2,'grivera@micorreo.cl',226826874),
			(41,'14.475.005-3','Gloria','Riquelme','1984-6-12',NULL,NULL,4,'griquelme@micorreo.cl',226801339),
			(42,'17.559.399-9','Guillermo','Recabarren','1991-9-19',NULL,NULL,8,'grecabarren@micorreo.cl',226707558),
			(43,'7.833.272-3','Ivo','Quiroz','1953-1-26','Campo de Deporte 457',19,4,'iquiroz@micorreo.cl',226359092),
			(44,'14.534.494-5','Jorge','Pi�a','1988-3-16','Los Maitenes 574',12,2,'jpi�a@micorreo.cl',226301385),
			(45,'10.729.545-4','Jorge','Perez','1969-4-11',NULL,NULL,1,'jperez@micorreo.cl',225988150),
			(46,'7.977.572-0','Juan','Pe�a','1953-1-29',NULL,NULL,5,'jpe�a@micorreo.cl',NULL),
			(47,'12.836.186-4','Juan','Paz','1980-3-9',NULL,NULL,1,'jpaz@micorreo.cl',225580432),
			(48,'20.499.764-1','Juan','Oro','1996-7-3',NULL,NULL,6,'joro@micorreo.cl',NULL),
			(49,'8.733.113-0','Julio','Morande','1955-3-7','Los Zapadores 516',29,8,'jmorande@micorreo.cl',225011561),
			(50,'12.196.260-0','Karen','L�pez','1973-4-9',NULL,NULL,3,'kl�pez@micorreo.cl',224019249),
			(51,'8.827.579-8','Karina','Lira','1955-10-2','El Greco 459',12,3,NULL,NULL),
			(52,'12.260.835-9','Marcela','Guti�rrez','1978-1-29',NULL,NULL,4,'mguti�rrez@micorreo.cl',223835647),
			(53,'20.798.844-7','Mar�a','Gallardo','1999-3-14','Los Leones 789',24,1,'mgallardo@micorreo.cl',223788925),
			(54,'18.486.116-0','Mat�as','Cornejo','1992-12-15','Las Palmeras 125',19,1,'mcornejo@micorreo.cl',223730108),
			(55,'6.857.752-7','Miguel','Castro','1944-4-14',NULL,NULL,1,NULL,NULL),
			(56,'14.628.513-8','Omar','Carre�o','1989-3-4',NULL,NULL,5,'ocarre�o@micorreo.cl',223485960),
			(57,'11.201.692-3','Pamela','Berr�os','1971-10-2','Ort�z de Rozas 457',29,1,'pberr�os@micorreo.cl',223329246),
			(58,'11.041.393-5','Raul','Barraza','1969-4-20','Lira 1454',36,1,'rbarraza@micorreo.cl',223226438),
			(59,'12.549.867-3','Rolando','Araya','1979-2-28',NULL,NULL,2,NULL,222543964),
			(60,'9.427.032-9','Rosa','Alvarez','1957-12-3',NULL,NULL,8,'ralvarez@micorreo.cl',222443020);

GO

INSERT Clase
	 VALUES (1,1,2),
			(2,1,44),
			(3,1,21),
			(4,1,33),
			(5,1,25),
			(6,1,49),
			(7,1,7),
			(8,1,45),
			(9,1,41),
			(10,1,14),
			(11,1,54),
			(12,1,48),
			(13,1,13),
			(14,1,19),
			(15,1,11),
			(16,1,43),
			(17,1,42),
			(18,1,57),
			(19,1,11),
			(20,1,20),
			(21,1,52),
			(22,1,52),
			(23,1,8),
			(24,1,6),
			(25,1,51),
			(26,1,44),
			(27,1,40),
			(28,1,30),
			(29,1,31),
			(30,3,21),
			(31,3,56),
			(32,3,1),
			(33,3,40),
			(34,3,59),
			(35,3,38),
			(36,3,27),
			(37,3,20),
			(38,3,18),
			(39,3,1),
			(40,3,30),
			(41,3,4),
			(42,3,36),
			(43,3,15),
			(44,3,38),
			(45,3,23),
			(46,3,37),
			(47,3,19),
			(48,3,54),
			(49,3,59),
			(50,3,5),
			(51,3,40),
			(52,3,19),
			(53,3,17),
			(54,3,22),
			(55,3,41),
			(56,3,22),
			(57,3,28),
			(58,3,52),
			(59,3,19),
			(60,3,55),
			(61,3,19),
			(62,3,57),
			(63,3,22),
			(64,3,23),
			(65,3,11),
			(66,3,37),
			(67,3,11),
			(68,3,20),
			(69,3,52),
			(70,3,59),
			(71,5,40),
			(72,5,37),
			(73,5,57),
			(74,5,37),
			(75,5,16),
			(76,5,60),
			(77,5,16),
			(78,5,38),
			(79,5,44),
			(80,5,28),
			(81,5,5),
			(82,5,36),
			(83,5,45),
			(84,5,9),
			(85,5,5),
			(86,5,42),
			(87,5,14),
			(88,5,10),
			(89,5,51),
			(90,5,32),
			(91,5,6),
			(92,5,13),
			(93,5,9),
			(94,5,39),
			(95,5,28),
			(96,5,20),
			(97,5,55),
			(98,5,46),
			(99,6,23),
			(100,6,53),
			(101,6,46),
			(102,6,12),
			(103,6,21),
			(104,6,18),
			(105,6,49),
			(106,6,33),
			(107,6,59),
			(108,6,39),
			(109,6,39),
			(110,6,56),
			(111,6,18),
			(112,6,31),
			(113,6,19),
			(114,6,34),
			(115,6,1),
			(116,6,37),
			(117,6,40),
			(118,6,4),
			(119,6,59),
			(120,6,51),
			(121,6,14),
			(122,6,4),
			(123,6,43),
			(124,8,19),
			(125,8,17),
			(126,8,19),
			(127,8,14),
			(128,8,27),
			(129,8,47),
			(130,8,56),
			(131,8,21),
			(132,8,19),
			(133,8,50),
			(134,8,8),
			(135,8,10),
			(136,8,24),
			(137,8,2),
			(138,8,52),
			(139,8,56),
			(140,8,30),
			(141,8,9),
			(142,8,33),
			(143,8,30),
			(144,8,17),
			(145,8,13),
			(146,8,9),
			(147,8,54),
			(148,8,14),
			(149,8,39),
			(150,9,59),
			(151,9,6),
			(152,9,13),
			(153,9,40),
			(154,9,17),
			(155,9,5),
			(156,9,59),
			(157,9,40),
			(158,9,47),
			(159,9,53),
			(160,9,13),
			(161,9,43),
			(162,9,16),
			(163,9,57),
			(164,9,8),
			(165,9,46),
			(166,9,25),
			(167,9,29),
			(168,9,32),
			(169,9,20),
			(170,9,12),
			(171,9,39),
			(172,9,59),
			(173,10,18),
			(174,10,23),
			(175,10,34),
			(176,10,21),
			(177,10,9),
			(178,10,27),
			(179,10,35),
			(180,10,34),
			(181,10,1),
			(182,10,38),
			(183,10,44),
			(184,10,2),
			(185,10,2),
			(186,10,39),
			(187,10,15),
			(188,10,9),
			(189,10,4),
			(190,10,48),
			(191,10,35),
			(192,10,33),
			(193,10,22),
			(194,10,14),
			(195,10,59),
			(196,10,59),
			(197,10,16),
			(198,10,54),
			(199,10,9),
			(200,10,7);
GO

-- 5.
-- ** Querys 1, 2, 3, 4, 5 y 6 **
SELECT * FROM Comuna  -- 37 filas
GO
SELECT * FROM Asignatura -- 7 filas
GO
SELECT * FROM Curso  -- 8 filas
GO
SELECT * FROM Profesor  -- 11 filas
GO
SELECT * FROM Alumno  -- 60 filas
GO
SELECT * FROM Clase  -- 200 filas
GO

-- ** Query 7 **
-- Profesores que nombre termine con a
SELECT * 
FROM Profesor
WHERE Nombre LIKE '%a'
GO

-- ** Query 8 **
-- Alumnos sin email
SELECT * 
FROM Alumno
WHERE email IS NULL
GO

-- ** Query 9 **
-- Profesores sin direcci�n o sin email
SELECT * 
FROM Profesor
WHERE Direccion IS NULL OR email IS NULL
GO

-- ** Query 10 **
-- Profesores que no sean de Santiago (36), incluyendo los que no tienen comuna
-- Mostrando RUN, nombre, apellido, email y telefono
-- Ordenados por Nombre Ascendente
SELECT P.RUN, 
       P.Nombre,
	   P.Apellido,
	   P.email,
	   P.Telefono
FROM Profesor AS P
WHERE ID_Comuna <> 36 OR ID_Comuna IS NULL
ORDER BY P.Nombre ASC
GO

-- ** Query 11 **
-- Seleccionar el nombre, el apellido, ID de asignatura (Alias: Asignatura), 
-- la direcci�n e ID de Comuna (Alias: Comuna) de los Profesores
SELECT 
       P.Nombre,
	   P.Apellido,
	   P.ID_Asignatura AS Asignatura,
	   P.Direccion,
	   P.ID_Comuna AS Comuna
FROM Profesor AS P
GO

-- ** Query 12 **
-- Mostrar cuantos alumnos hay por cada curso, 
-- s�lo mostrando el ID del curso y su cantidad de alumnos
SELECT A.ID_Curso, COUNT(A.ID_Curso) AS Cantidad_de_alumnos
FROM Alumno AS A
GROUP BY A.ID_Curso
GO






















