CREATE TABLE PROFESORES(
	dni varchar(10),
	nombre varchar(40),
	categoria varchar(4),
	ingreso date,
	CONSTRAINT PK_Profesores PRIMARY KEY(dni)
);
CREATE TABLE ASIGNATURAS(
	codigo varchar(5),
	descripcion varchar(35),
	creditos numeric(4,1),
	creditosp numeric(4,1),
	CONSTRAINT PK_Asignaturas PRIMARY KEY(codigo)
);
CREATE TABLE IMPARTE(
	dni varchar(10),
	asignatura varchar(5),
	CONSTRAINT PK_Imparte PRIMARY KEY(dni, asignatura),
	CONSTRAINT FK_Imparte_Profesores FOREIGN KEY(dni) REFERENCES PROFESORES(dni),
	CONSTRAINT FK_Imparte_Asignatura FOREIGN KEY(asignatura) REFERENCES ASIGNATURAS(codigo)
)