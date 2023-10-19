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


SELECT ar.nombre, ar.apellido, cli.ciudad FROM Artista AS ar, Transaccion as tran, Cliente as cli, Pintura as pin
         WHERE tran.idCliente = cli.idCliente AND tran.idPintura = pin.idPintura AND ar.idArtista = pin.idArtista;


INSERT INTO Cliente(idCliente, nombre, apellido, ciudad, email) VALUES (1,'Juan', 'Perez', 'UIO', 'j@gmail.com');
INSERT INTO Cliente(idCliente, nombre, apellido, ciudad, email) VALUES (2,'Pedro', 'Saona', 'MAD', 'preuba@gmail.com');
INSERT INTO Cliente(idCliente, nombre, apellido, ciudad, email) VALUES (3,'Juan F', 'Cisneros', 'MED', 'preubaj@gmail.com');
INSERT INTO Cliente(idCliente, nombre, apellido, ciudad, email) VALUES (4,'Maria', 'Rodriguez', 'LIM', 'preubaa@gmail.com');

INSERT INTO Cliente_Artista (idCliente, idArtista) VALUES (1,1);
INSERT INTO Cliente_Artista (idCliente, idArtista) VALUES (2,1);
INSERT INTO Cliente_Artista (idCliente, idArtista) VALUES (3,2);
INSERT INTO Cliente_Artista (idCliente, idArtista) VALUES (4,1);

INSERT INTO Pintura(titulo,idArtista,idPintura) VALUES ('La persistencia de la memoria',1,1);
INSERT INTO Pintura(titulo,idArtista,idPintura) VALUES ('La tentación de San Antonio',1,2);
INSERT INTO Pintura(titulo,idArtista,idPintura) VALUES ('La persistencia de la memoria',2,3);
INSERT INTO Pintura(titulo,idArtista,idPintura) VALUES ('La tentación de San Antonio',2,4);
INSERT INTO Pintura(titulo,idArtista,idPintura) VALUES ('La persistencia de la memoria',3,5);
INSERT INTO Pintura(titulo,idArtista,idPintura) VALUES ('La tentación de San Antonio',3,6);

INSERT INTO Transaccion(idTransaccion, idCliente, idPintura, dia_venta, precio, dia_creada) VALUES ( 2,1, 1, '2019-01-01', 1000, '2019-01-01');
INSERT INTO Transaccion(idTransaccion, idCliente, idPintura, dia_venta, precio, dia_creada) VALUES ( 3,2, 2, '2019-01-01', 1000, '2019-01-01');


# cuanto se vendio de Salvador Dali
SELECT SUM(tran.precio) FROM Transaccion as tran, Pintura as pin, Artista as ar
WHERE tran.idPintura = pin.idPintura AND pin.idArtista = ar.idArtista AND ar.nombre = 'Salvador';

#BORRAR TODOS LOS DATOS DE LA TABLA PINTURA
DELETE FROM Pintura;
