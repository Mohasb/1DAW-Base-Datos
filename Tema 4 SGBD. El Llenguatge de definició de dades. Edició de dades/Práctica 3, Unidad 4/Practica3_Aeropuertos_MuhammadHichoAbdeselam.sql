CREATE TABLE AEROPUERTO(
	codigo int,
	nombre varchar(10),
	ciudad varchar(10),
	pais varchar(10),
	CONSTRAINT PK_AEROPUERTO PRIMARY KEY(codigo)
);
CREATE TABLE DIRECTOR(
	dni varchar(9),
	nombre varchar(10),
	direccion varchar(20),
	pais varchar(10),
	telefono numeric(9),
	dni_controlado varchar(9),
	cod_aeropuerto int,
	CONSTRAINT PK_DIRECTOR PRIMARY KEY(dni),
	CONSTRAINT UK_DIRECTOR UNIQUE(cod_aeropuerto),
	CONSTRAINT FK_DIRECTOR_DIRECTOR FOREIGN KEY(dni_controlado) REFERENCES DIRECTOR(dni),
	CONSTRAINT FK_DIRECTOR_AEROPUERTO FOREIGN KEY(cod_aeropuerto) REFERENCES AEROPUERTO(codigo)
);
CREATE TABLE AVION(
	codigo int,
	companyia varchar(20),
	modelo varchar(20),
	capacidad int,
	CONSTRAINT PK_AVION PRIMARY KEY(codigo)
);
CREATE TABLE PROGRAMA_VUELO(
	num_vuelo int,
	companyia varchar(20),
	dia numeric(2),
	cod_aero_despegar int NOT NULL,
	cod_aero_aterrizar int NOT NULL,
	CONSTRAINT PK_PROGRAMA_VUELO PRIMARY KEY(num_vuelo),
	CONSTRAINT FK_DESPEGAR_PROGRAMA_VUELO FOREIGN KEY(cod_aero_despegar) REFERENCES AEROPUERTO(codigo),
	CONSTRAINT FK_ATERRIZAR_PROGRAMA_VUELO FOREIGN KEY(cod_aero_aterrizar) REFERENCES AEROPUERTO(codigo)
);
CREATE TABLE VOLAR(
	num_vuelo int,
	cod_avion int,
	plazas_ocupadas int,
	CONSTRAINT PK_VUELO PRIMARY KEY(num_vuelo, cod_avion),
	CONSTRAINT FK_VOLAR_PROGRAMA_VUELO FOREIGN KEY(num_vuelo) REFERENCES PROGRAMA_VUELO(num_vuelo),
	CONSTRAINT FK_VOLAR_AVION FOREIGN KEY(cod_avion) REFERENCES AVION(codigo)
);
CREATE TABLE TENER_ESCALA(
	num_vuelo int,
	cod_avion int,
	cod_aeropuerto int,
	num_orden int,
	pasajeros_suben int,
	pasajeros_bajan int,
	CONSTRAINT PK_TENER_ESCALA PRIMARY KEY(num_vuelo, cod_avion, cod_aeropuerto),
	CONSTRAINT FK_TENER_ESCALA_VOLAR FOREIGN KEY(num_vuelo, cod_avion) REFERENCES VOLAR(num_vuelo, cod_avion),
	CONSTRAINT FK_TENER_ESCALA_AEROPUERTO FOREIGN KEY(cod_aeropuerto) REFERENCES AEROPUERTO(codigo)
);
CREATE TABLE PASAJE(
	num_pasaporte int,
	nombre varchar(20),
	direccion varchar(20),
	nacionalidad varchar(10),
	CONSTRAINT PK_PASAJE PRIMARY KEY(num_pasaporte)
);
CREATE TABLE PASAJEROS(
	num_pasaporte int,
	num_veces int,
	CONSTRAINT PK_PASAJEROS PRIMARY KEY(num_pasaporte),
	CONSTRAINT FK_PASJEROS_PASAJE FOREIGN KEY(num_pasaporte) REFERENCES PASAJE(num_pasaporte)
	
);
CREATE TABLE TRIPULACION(
	num_pasaporte int,
	anyos_exp int,
	CONSTRAINT PK_TRIPULACION PRIMARY KEY(num_pasaporte),
	CONSTRAINT FK_TRIPULACION_PASAJE FOREIGN KEY(num_pasaporte) REFERENCES PASAJE(num_pasaporte)
);
CREATE TABLE ABORDO(
	num_pasaporte int,
	num_vuelo int,
	cod_avion int,
	CONSTRAINT PK_ABORDO PRIMARY KEY(num_pasaporte, num_vuelo, cod_avion),
	CONSTRAINT FK_ABORDO_PASAJE FOREIGN KEY(num_pasaporte) REFERENCES PASAJE(num_pasaporte),
	CONSTRAINT FK_ABORDO_VOLAR FOREIGN KEY(num_vuelo, cod_avion) REFERENCES VOLAR(num_vuelo, cod_avion)
);
CREATE TABLE SUBIR_BAJA_ESCALA(
	num_pasaporte int,
	num_vuelo int,
	cod_avion int,
	cod_aeropuerto int,
	CONSTRAINT PK_SUBIR_BAJA_ESCALA PRIMARY KEY(num_pasaporte, num_vuelo, cod_avion, cod_aeropuerto),
	CONSTRAINT FK_SUBIR_BAJA_ESCALA_PASAJEROS FOREIGN KEY(num_pasaporte) REFERENCES PASAJEROS(num_pasaporte),
	CONSTRAINT FK_SUBIR_BAJA_ESCALA_TENER_ESCALA FOREIGN KEY(num_vuelo, cod_avion, cod_aeropuerto) REFERENCES TENER_ESCALA(num_vuelo, cod_avion, cod_aeropuerto)
);