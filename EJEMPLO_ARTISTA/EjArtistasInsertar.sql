use EjArtistas;

INSERT INTO Artista(idArtista,nombre, apellido, nacionalidad,fecha_nacimiento, fech_muerte)
VALUES (1,'Salvador', 'Dalí', 'es', '1881-10-25', '1973-04-08');

DELETE FROM Artista WHERE idArtista = 1;

INSERT INTO Artista(idArtista,nombre, apellido, nacionalidad,fecha_nacimiento, fech_muerte)
VALUES (2,'Pablo', 'Salvador', 'es', '1881-10-25', '1973-04-08');

UPDATE Artista SET apellido = 'Picasso' WHERE idArtista = 2;

INSERT INTO Artista(idArtista,nombre, apellido, nacionalidad,fecha_nacimiento, fech_muerte)
Values (3,'David', 'Hopney' , 'us', '1937-07-09', NULL);

UPDATE Artista SET nacionalidad = 'br' WHERE idArtista = 3;

SELECT nombre,apellido FROM Artista WHERE nombre LIKE '%o%';



