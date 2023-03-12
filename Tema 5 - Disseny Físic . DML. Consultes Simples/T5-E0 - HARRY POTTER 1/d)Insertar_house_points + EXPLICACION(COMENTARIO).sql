--Inserta en la tabla house_points la columna 'id' es serial y se auto rellena y auto incrementa con cada nuevo registro
--								   la columna 'giver' se rellena mediante la consulta: (SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape')->(id de la person llamada 'Severus' y de apellido ''Snape)
--								   la columna 'receiver' se rellena  mediante la consulta: (SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter')->(id de la person llamada 'Harry' y de apellido 'Potter')
--								   la cloumna 'points' se rellena mediante el valor dado como último parámetro(-50)
--Así se rellenan seis tuplas de la tabla 'house_points'
INSERT INTO house_points (giver,receiver,points)VALUES
((SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'),
(SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter'),-50),

((SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'),
(SELECT id FROM person WHERE first_name='Ron' AND last_name='Weasley'),-50),

((SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'),
(SELECT id FROM person WHERE first_name='Hermione' AND last_name='Granger'),-50),

((SELECT id FROM person WHERE first_name='Minerva' AND last_name='McGonagall'),
(SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter'),50),

((SELECT id FROM person WHERE first_name='Albus' AND last_name='Dumbledore'),
(SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter'),100),

((SELECT id FROM person WHERE first_name='Pomona' AND last_name='Sprout'),
(SELECT id FROM person WHERE first_name='Hermione' AND last_name='Granger'),20);
