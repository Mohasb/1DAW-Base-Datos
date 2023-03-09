--Modifico la tabla house para anadir la columna 'head_teacher' según requerimientos y la asigno como FK referenciando el id de person
ALTER TABLE house ADD COLUMN head_teacher numeric(4) NOT NULL;
ALTER TABLE house ADD CONSTRAINT FK_head_teacher FOREIGN KEY(head_teacher) REFERENCES person(id) ON UPDATE CASCADE ON DELETE NO ACTION
