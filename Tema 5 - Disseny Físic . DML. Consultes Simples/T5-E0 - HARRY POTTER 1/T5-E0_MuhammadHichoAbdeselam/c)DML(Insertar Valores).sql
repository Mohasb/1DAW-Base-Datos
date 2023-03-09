--Añado los datos de la tabla person menos el 'house_id'(puede ser NULL) por que aún no esta rellenada la tabla house
INSERT INTO person(id, first_name, last_name) VALUES(1, 'Euan', 'Abercrombie');
INSERT INTO person(id, first_name, last_name) VALUES(2, 'Katie', 'Bell');
INSERT INTO person(id, first_name, last_name) VALUES(3, 'Lavender', 'Brown');
INSERT INTO person(id, first_name, last_name) VALUES(4, 'Colin', 'Creevey');
INSERT INTO person(id, first_name, last_name) VALUES(5, 'Dennis', 'Creevey');
INSERT INTO person(id, first_name, last_name) VALUES(6, 'Seamus', 'Finnigan');
INSERT INTO person(id, first_name, last_name) VALUES(7, 'Hermione', 'Granger');
INSERT INTO person(id, first_name, last_name) VALUES(8, 'Neville', 'Longbottom');
INSERT INTO person(id, first_name, last_name) VALUES(9, 'Harry', 'Potter');
INSERT INTO person(id, first_name, last_name) VALUES(10, 'Ron', 'Weasley');
INSERT INTO person(id, first_name, last_name) VALUES(11, 'Hannah', 'Abbott');
INSERT INTO person(id, first_name, last_name) VALUES(12, 'Susan', 'Bones');
INSERT INTO person(id, first_name, last_name) VALUES(13, 'Eleanor', 'Branstone');
INSERT INTO person(id, first_name, last_name) VALUES(14, 'Cedric', 'Diggory');
INSERT INTO person(id, first_name, last_name) VALUES(15, 'Ernie', 'Macmillan');
INSERT INTO person(id, first_name, last_name) VALUES(16, 'Cho', 'Chang');
INSERT INTO person(id, first_name, last_name) VALUES(17, 'Penelope', 'Clearwater');
INSERT INTO person(id, first_name, last_name) VALUES(18, 'Luna', 'Lovegood');
INSERT INTO person(id, first_name, last_name) VALUES(19, 'Padma', 'Patil');
INSERT INTO person(id, first_name, last_name) VALUES(20, 'Malcolm', 'Baddock');
INSERT INTO person(id, first_name, last_name) VALUES(21, 'Gregory', 'Goyle');
INSERT INTO person(id, first_name, last_name) VALUES(22, 'Draco', 'Malfoy');
INSERT INTO person(id, first_name, last_name) VALUES(23, 'Godric', 'Gryffindor');
INSERT INTO person(id, first_name, last_name) VALUES(24, 'Helga', 'Hufflepuff');
INSERT INTO person(id, first_name, last_name) VALUES(25, 'Rowena', 'Ravenclaw');
INSERT INTO person(id, first_name, last_name) VALUES(26, 'Salazar', 'Slytherin');
INSERT INTO person(id, first_name, last_name) VALUES(27, 'Albus', 'Dumbledore');
INSERT INTO person(id, first_name, last_name) VALUES(28, 'Rubeus', 'Hagrid');
INSERT INTO person(id, first_name, last_name) VALUES(29, 'Minerva', 'McGonagall');
INSERT INTO person(id, first_name, last_name) VALUES(30, 'Pomona', 'Sprout');
INSERT INTO person(id, first_name, last_name) VALUES(31, 'Severus', 'Snape');
INSERT INTO person(id, first_name, last_name) VALUES(32, 'Cuthbert', 'Binns');
INSERT INTO person(id, first_name, last_name) VALUES(33, 'Aurora', 'Sinistra');
INSERT INTO person(id, first_name, last_name) VALUES(34, 'Rolanda', 'Hooch');
INSERT INTO person(id, first_name, last_name) VALUES(35, 'Charity', 'Burbage');
INSERT INTO person(id, first_name, last_name) VALUES(36, 'Sybill', 'Trelawney');
INSERT INTO person(id, first_name, last_name) VALUES(37, 'Septima', 'Vector');
INSERT INTO person(id, first_name, last_name) VALUES(38, 'Bathsheda', 'Babbling');
INSERT INTO person(id, first_name, last_name) VALUES(39, 'Horace', 'Slughorn');
INSERT INTO person(id, first_name, last_name) VALUES(40, 'Alastor', 'Moody');
INSERT INTO person(id, first_name, last_name) VALUES(41, 'Filius', 'Flitwick');
INSERT INTO person(id, first_name, last_name) VALUES(42, 'Charity', 'Burbage');
INSERT INTO person(id, first_name, last_name) VALUES(43, 'Cuthbert', 'Binns');
INSERT INTO person(id, first_name, last_name) VALUES(44, 'Remus', 'Lupin');
--Relleno de la tabla house (ahora que esta rellena la tabla person puedo rellenar el valor no nulo de 'head_teacher'(person(id)))
INSERT INTO house VALUES(1, 'Griffindor', 29);
INSERT INTO house VALUES(2, 'Hufflepuff', 30);
INSERT INTO house VALUES(3, 'Ravenclaw', 41);
INSERT INTO house VALUES(4, 'Slytherin', 31);
--Una vez rellena la tabla 'house' y 'person' establezco el 'house_id' de la tabla 'person' referenciado a la 'id' de la tabla 'house'
UPDATE person SET house_id = 1
WHERE person.id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 23, 27, 28, 29, 32, 33, 34, 35, 36, 37, 38, 40, 42, 43, 44);
UPDATE person SET house_id = 2
WHERE person.id IN (11, 12, 13, 14, 15, 24, 30);
UPDATE person SET house_id = 3
WHERE person.id IN (16, 17, 18, 19, 25, 41);
UPDATE person SET house_id = 4
WHERE person.id IN (20, 21, 22, 26, 31, 39);
--Relleno de la tabla course según requerimientos
INSERT INTO course VALUES(1, 'Potions', 31);
INSERT INTO course VALUES(2, 'Transfiguration', 29);
INSERT INTO course VALUES(3, 'charms', 41);
INSERT INTO course VALUES(4, 'Herbology', 30);
INSERT INTO course VALUES(5, 'Defense Against the Dark Arts', 44);
INSERT INTO course VALUES(6, 'Astronomy', 33);
INSERT INTO course VALUES(7, 'Flying', 34);
INSERT INTO course VALUES(8, 'Muggle Studies', 42);
INSERT INTO course VALUES(10, 'Headmaster', 27);
INSERT INTO course VALUES(11, 'Care of Magical Creatures', 28);
INSERT INTO course VALUES(12, 'Divination', 36);
INSERT INTO course VALUES(13, 'Arithmancy', 37);
INSERT INTO course VALUES(14, 'Ancient Runes', 38);
