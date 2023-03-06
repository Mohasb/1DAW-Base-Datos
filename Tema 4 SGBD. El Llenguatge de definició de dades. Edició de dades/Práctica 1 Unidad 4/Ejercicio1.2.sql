CREATE TABLE EQUIPO(
	pais varchar(20),
	seleccionador varchar(20),
	CONSTRAINT PK_EQUIPO PRIMARY KEY(pais)
);
CREATE TABLE COLEGIADO(
	nombre varchar(20),
	nacionalidad varchar(20),
	direccion varchar(20),
	CONSTRAINT PK_COLEGIADO PRIMARY KEY(nombre)
);
CREATE TABLE JUGADOR(
	nombre varchar(20),
	direccion varchar(20),
	fecha_nac date,
	puesto_habitual varchar(20),
	seleccion varchar(20) NOT NULL,
	CONSTRAINT PK_JUGADOR PRIMARY KEY(nombre),
	CONSTRAINT FK_JUGADOR_EQUIPO FOREIGN KEY(seleccion) REFERENCES EQUIPO(pais)
);
CREATE TABLE PARTIDO(
	seleccion_l varchar(20),
	seleccion_v varchar(20),
	fecha date,
	hora time,
	resultado varchar(5),
	sede varchar(20),
	CONSTRAINT PK_PARTIDO PRIMARY KEY(fecha, seleccion_l, seleccion_v),
	CONSTRAINT FK_seleccion_l_EQUIPO FOREIGN KEY(seleccion_l) REFERENCES EQUIPO(pais),
	CONSTRAINT FK_seleccion_v_EQUIPO FOREIGN KEY(seleccion_v) REFERENCES EQUIPO(pais)
);
CREATE TABLE JUGAR(
	nombre_jugador varchar(20),
	seleccion_l varchar(20),
	seleccion_v varchar(20),
	fecha date,
	minutos int,
	puesto varchar(10),
	CONSTRAINT PK_JUGAR PRIMARY KEY(nombre_jugador, seleccion_l, seleccion_v, fecha),
	CONSTRAINT FK_JUGAR_JUGADOR FOREIGN KEY(nombre_jugador) REFERENCES JUGADOR(nombre),
	CONSTRAINT FK_JUGAR_PARTIDO FOREIGN KEY(seleccion_l, seleccion_v, fecha) REFERENCES PARTIDO(seleccion_l, seleccion_v, fecha)
);
CREATE TABLE GOL(
	nombre_jugador varchar(20),
	seleccion_l varchar(20),
	seleccion_v varchar(20),
	fecha date,
	minuto_Gol int,
	CONSTRAINT PK_GOL PRIMARY KEY(minuto_gol, nombre_jugador, seleccion_l, seleccion_v, fecha),
	CONSTRAINT FK_GOL_JUGAR FOREIGN KEY(nombre_jugador, seleccion_l, seleccion_v, fecha) REFERENCES JUGAR(nombre_jugador, seleccion_l, seleccion_v, fecha)
);
CREATE TABLE ARBITRAR(
	seleccion_l varchar(20),
	seleccion_v varchar(20),
	fecha date,
	nombre_arbitro varchar(20),
	tipo varchar(10),
	CONSTRAINT PK_ARBITRAR PRIMARY KEY(seleccion_l, seleccion_v, fecha, nombre_arbitro),
	CONSTRAINT FK_ARBRITRAR_PARTIDO FOREIGN KEY(seleccion_l, seleccion_v, fecha) REFERENCES PARTIDO(seleccion_l, seleccion_v, fecha),
	CONSTRAINT FK_ARBRITRAR_COLEGIADO FOREIGN KEY(nombre_arbitro) REFERENCES COLEGIADO(nombre)
);
CREATE TABLE LABORATORIO(
	CIF varchar(10),
	nombre varchar(20),
	direccion varchar(30),
	telefono varchar(9),
	CONSTRAINT PK_LABORATORIO PRIMARY KEY(CIF)
);
CREATE TABLE FEDERATIVO(
	tarjeta_id int,
	nombre varchar(20),
	telefono  varchar(9),
	CONSTRAINT PK_FEDERATIVO PRIMARY KEY(tarjeta_id)
);
CREATE TABLE ANALISIS(
	nombre_jugador varchar(20),
	seleccion_l varchar(20),
	seleccion_v varchar(20),
	fecha date,
	CIF varchar(10),
	tarjeta_id int,
	resultado varchar(5),
	CONSTRAINT PK_ANALISIS PRIMARY KEY(nombre_jugador, seleccion_l, seleccion_v, fecha, CIF),
	CONSTRAINT FK_ANALISIS_JUGAR FOREIGN KEY(nombre_jugador, seleccion_l, seleccion_v, fecha) REFERENCES JUGAR(nombre_jugador, seleccion_l, seleccion_v, fecha),
	CONSTRAINT FK_ANALISIS_LABORATORIO FOREIGN KEY(CIF) REFERENCES LABORATORIO(CIF),
	CONSTRAINT FK_ANALISIS_FEDERATIVO FOREIGN KEY(tarjeta_id) REFERENCES FEDERATIVO(tarjeta_id)
);