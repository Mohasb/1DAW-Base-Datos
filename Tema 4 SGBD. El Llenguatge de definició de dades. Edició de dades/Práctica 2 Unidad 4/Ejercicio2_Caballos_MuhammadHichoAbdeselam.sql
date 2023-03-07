------------------------------------CREAR TABLA CABALLO---------------------------------------------------
CREATE TABLE CABALLOS(
	CodCaballo VARCHAR(4),
	Nombre VARCHAR(20) NOT NULL,
	Peso NUMERIC(3) CHECK (PESO BETWEEN 240 AND 300),
	Fecha_Nacimiento date CHECK (TO_CHAR(Fecha_Nacimiento, 'YYYY') > '2000'),
	Propietario VARCHAR(25),
	Nacionalidad VARCHAR(20),
	CONSTRAINT PK_CABALLOS PRIMARY KEY(CodCaballo)
);
------------------------------------CREAR TABLA CARRERA--------------------------------------------------
CREATE TABLE CARRERAS(
	CodCarrera VARCHAR(4),
	FechaHora timestamptz CHECK(TO_CHAR(fechahora, 'HH24:MI') >= '09:00' AND TO_CHAR(fechahora, 'HH24:MI') <= '14:30'),
	Nombre VARCHAR(20),
	ImportePremio numeric(6),
	ApuestaLimite NUMERIC(7,2),
	CHECK (ApuestaLimite < 20000),
	CONSTRAINT PK_CARRERAS PRIMARY KEY(CodCarrera)
);
------------------------------------CREAR TABLA PARTICIPACIONES---------------------------------------------------
CREATE TABLE PARTICIPACIONES(
	CodCaballo VARCHAR(4),
	CodCarrera VARCHAR(4),
	Dorsal NUMERIC(2) NOT NULL,
	Jokey VARCHAR(20) NOT NULL,
	PosicionFinal NUMERIC(2),
	CHECK (PosicionFinal > 0),
	CONSTRAINT PK_PARTICIPACIONES PRIMARY KEY(CodCaballo, CodCarrera),
	CONSTRAINT FK_PARTICIPACIONES_CABALLOS FOREIGN KEY(CodCaballo) REFERENCES CABALLOS(CodCaballo),
	CONSTRAINT FK_PARTICIPACIONES_CARRERAS FOREIGN KEY (CodCarrera) REFERENCES CARRERAS(CodCarrera)
);
------------------------------------CREAR TABLA CLIENTES---------------------------------------------------
CREATE TABLE CLIENTES(
	Dni VARCHAR(10),
	Nombre VARCHAR(20),
	Nacionalidad VARCHAR(20),
	CONSTRAINT PK_CLIENTES PRIMARY KEY(Dni)
);
------------------------------------CREAR TABLA APUESTAS---------------------------------------------------
CREATE TABLE APUESTAS(
	DniCliente VARCHAR(10),
	CodCaballo VARCHAR(4),
	CodCarrera VARCHAR(4),
	Importe numeric(6) DEFAULT 300 NOT NULL,
	Tantoporuno numeric(6, 2),
	CHECK(Tantoporuno > 1),
	CONSTRAINT PK_APUESTAS PRIMARY KEY(DniCliente, CodCaballo, CodCarrera),
	CONSTRAINT FK_APUESTAS_CLIENTE FOREIGN KEY(DniCliente) REFERENCES CLIENTES(DNI),
	CONSTRAINT FK_APUESTAS_CABALLO FOREIGN KEY(CodCaballo) REFERENCES CABALLOS(CodCaballo),
	CONSTRAINT FK_APUESTAS_CARRERA FOREIGN KEY(CodCarrera) REFERENCES CARRERAS(CodCarrera)
);













------------------------------------PRUEBAS CHECK CABALLO------------------------------------------------
--INSERT INTO CABALLOS(CodCaballo, nombre, peso, fecha_nacimiento) VALUES(001, 'uno', 400, '01-01-1999')
--Entrada no valida peso > 300 & fecha menor a 2000 -> Error
--INSERT INTO CABALLOS(CodCaballo, nombre, peso, fecha_nacimiento) VALUES(001, 'uno', 260, '01-01-2002')
--Entrada Correcta
--SELECT * FROM CABALLOS
------------------------------------PRUEBAS CHECK CARRERA------------------------------------------------
--INSERT INTO CARRERAS(codCarrera, nombre, fechahora, apuestaLimite) VALUES('001', 'uno', '2000-01-01 07:00:00', 25478.22)
--Error apuesta limite superior a 20000
--INSERT INTO CARRERAS(codCarrera, nombre, fechahora, apuestaLimite) VALUES('001', 'uno', '2000-01-01 07:00:00', 19000.22)
--Error fechahora inferior a 9:00
--INSERT INTO CARRERAS(codCarrera, fechahora) VALUES('003', '21-11-2015 09:01:00')
--CORRECTA
--DROP TABLE CARRERAS cascade
--INSERT INTO CARRERAS(codCarrera, nombre, fechahora, apuestaLimite) VALUES('003', 'tres', '2000-01-01 10:00:00', 19000)
--SELECT * FROM CARRERAS
------------------------------------PRUEBAS CHECK PARTICIPACIONES------------------------------------------------
--SELECT * FROM CABALLOS
--INSERT INTO PARTICIPACIONES(codCaballo, codcarrera, Dorsal, jokey, PosicionFinal) VALUES('1','001', 2, 'uno', 8)
------------------------------------PRUEBAS CHECK PARTICIPACIONES------------------------------------------------
--SELECT * FROM APUESTAS
--DROP TABLE APUESTAS
--INSERT INTO APUESTAS(DNICLIENTE, TANTOPORUNO) VALUES('1234', 22)

--INSERT INTO CABALLOS(codCaballo, nombre, PESO) VALUES('h','hol', 250)
--SELECT * FROM CABALLOS
--INSERT INTO CABALLOS(codCaballo, nombre, FECHA_NACIMIENTO) VALUES('D','hSl', '01-01-2001')
--SELECT * FROM CABALLOS
--INSERT INTO CARRERAS(codCarrera, ApuestaLimite) VALUES('SD', 25)
--SELECT * FROM CARRERAS
--set datestyle to 'european'
