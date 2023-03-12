INSERT INTO PROFESORES VALUES('21111222', 'Eva Giner', 'TEU', '1992-10-02');
INSERT INTO PROFESORES VALUES('21222333', 'Manuel Perez', 'TEU', '1988-06-15');
INSERT INTO PROFESORES VALUES('21333444', 'Rafaela Gomis', 'ASO6', '1993-06-15');

INSERT INTO ASIGNATURAS VALUES('DGBD', 'Diseño y gestión de bases de datos', '6.0', '3.0');
INSERT INTO ASIGNATURAS VALUES('FBD', 'Fundamentos de las bases de datos', '6.0', '1.5');
INSERT INTO ASIGNATURAS VALUES('FP', 'Fundamentos de la programación', '9.0', '4.5');
INSERT INTO ASIGNATURAS (codigo, descripcion, creditos)VALUES('HI', 'Historia de la informática', '4.5');
INSERT INTO ASIGNATURAS VALUES('PC', 'Programación concurrente', '6.0', '1.5');

INSERT INTO IMPARTE VALUES('21111222', 'DGBD');
INSERT INTO IMPARTE VALUES('21111222', 'FBD');
INSERT INTO IMPARTE VALUES('21333444', 'PC');