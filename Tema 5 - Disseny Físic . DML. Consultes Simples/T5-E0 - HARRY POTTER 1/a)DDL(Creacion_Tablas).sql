--Creación de las tablas según requerimientos:
CREATE TABLE house(
	id numeric(1),
	name varchar(50) NOT NULL,
	CONSTRAINT PK_house PRIMARY KEY(id)
);
CREATE TABLE person(
	id numeric(4),
	first_name varchar(50),
	last_name varchar(50),
	house_id numeric(1),
 	CONSTRAINT PK_person PRIMARY KEY(id),
	CONSTRAINT FK_person_house FOREIGN KEY(house_id) REFERENCES house(id) ON UPDATE CASCADE ON DELETE NO ACTION

);
CREATE TABLE course(
	id numeric(4),
	name varchar(50),
	teacher_id numeric(4),
	CONSTRAINT PK_course PRIMARY KEY(id),
	CONSTRAINT UK_course UNIQUE(name),
	CONSTRAINT FK_course_person FOREIGN KEY(teacher_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE NO ACTION
);
CREATE TABLE enrollment(
	person numeric(4),
	course numeric(4),
	CONSTRAINT PK_person_course PRIMARY KEY(person, course),
	CONSTRAINT FK_person_person FOREIGN KEY(person) REFERENCES person(id) ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT FK_course_course FOREIGN KEY(course) REFERENCES course(id) ON UPDATE CASCADE ON DELETE NO ACTION
);
CREATE TABLE house_points(
	id serial,
	giver numeric(4),
	receiver numeric(4),
	points numeric(4),
	CONSTRAINT PK_house_points PRIMARY KEY(id),
	CONSTRAINT FK_giver_person FOREIGN KEY(giver) REFERENCES person(id) ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT FK_reciver_person FOREIGN KEY(receiver) REFERENCES person(id) ON UPDATE CASCADE ON DELETE NO ACTION
)