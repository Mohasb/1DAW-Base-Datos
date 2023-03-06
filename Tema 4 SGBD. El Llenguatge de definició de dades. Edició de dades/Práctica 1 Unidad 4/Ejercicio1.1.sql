CREATE TABLE COMARCAS(
	nombre_c varchar(20),
	provincia varchar(20),
	CONSTRAINT PK_COMARCAS PRIMARY KEY(nombre_c)
);

CREATE TABLE POBLACIONES(
	nombre varchar(20),
	poblacion varchar(20),
	extension_p float4,
	altura float4,
	longitud float4,
	latitud float4,
	lengua float4,
	nombre_c varchar(20),
	CONSTRAINT PK_POBLACIONES PRIMARY KEY(nombre)
);

ALTER TABLE POBLACIONES ADD CONSTRAINT FK_POBLACIONES_COMARCAS FOREIGN KEY(nombre_c) REFERENCES COMARCAS(nombre_c);

CREATE TABLE INSTITUTOS(
	codigo serial,
	nombre varchar(20),
	direccion varchar(20),
	numero varchar(20),
	codpostal varchar(20),
	localidad varchar(20),
	CONSTRAINT PK_INSTITUTOS PRIMARY KEY(codigo)
);

ALTER TABLE INSTITUTOS ADD CONSTRAINT FK_INSTITUTOS_POBLACIONES FOREIGN KEY(localidad) REFERENCES POBLACIONES(nombre);