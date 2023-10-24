
# SI EXISTE LA BASE DE DATOS LA BORRA Y LA CREA DE NUEVO
CREATE DATABASE IF NOT EXISTS EjArtistas;
USE EjArtistas;
CREATE TABLE IF NOT EXISTS Cliente(
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(50), #NO SULEN HABER NOMBRES MAS LARGOS
    apellido VARCHAR(50),
                        ciudad CHAR(3)
);

CREATE TABLE IF NOT EXISTS Artista(
    idArtista INT PRIMARY KEY,
    nombre VARCHAR(50), #NO SULEN HABER NOMBRES MAS LARGOS
    apellido VARCHAR(50),
    nacionalidad CHAR(2),
    fecha_nacimiento DATE,
    fech_muerte DATE
);

CREATE TABLE IF NOT EXISTS Pintura (
    idPintura INT PRIMARY KEY,
    titulo VARCHAR(50),
    idArtista INT REFERENCES Artista(idArtista)
);

ALTER TABLE Artista CHANGE nombre nombre VARCHAR(50) NOT NULL;


ALTER TABLE Cliente CHANGE nombre nombre VARCHAR(50) NOT NULL;
ALTER TABLE Cliente CHANGE apellido apellido VARCHAR(50) NOT NULL;
ALTER TABLE Cliente ADD COLUMN email VARCHAR(50);

ALTER TABLE Cliente CHANGE idCliente idCliente VARCHAR(15) NOT NULL;

DROP TABLE IF EXISTS Transaccion;
CREATE TABLE IF NOT EXISTS Transaccion(
    idTransaccion INT PRIMARY KEY,
    dia_creada DATE,
    precio DECIMAL(10,2),
    dia_venta DATE,
    idCliente VARCHAR(15),
    CONSTRAINT idCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
    idPintura INT,
    CONSTRAINT idPintura FOREIGN KEY(idPintura) REFERENCES Pintura(idPintura)
);

DROP TABLE IF EXISTS Cliente_Artista;
CREATE TABLE IF NOT EXISTS Cliente_Artista(
    # IDCLIENTE Y EL IDARTISTA SON PRIMARY KEY Y FOREIGN KEY
    idCliente VARCHAR(15) NOT NULL,
    idArtista INT NOT NULL,
    PRIMARY KEY(idCliente, idArtista),
    CONSTRAINT fk_interes_client FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_interes_Artista FOREIGN KEY(idArtista) REFERENCES Artista(idArtista)
);

ALTER TABLE Pintura ADD CONSTRAINT fk_idArtista  foreign key (idArtista) references Artista(idArtista);


USE EjArtistas;
SELECT art.nombre,art.apellido,COUNT(idPintura) FROM Pintura AS pin, Artista as art WHERE pin.idArtista = art.idArtista
GROUP BY art.idArtista;

SELECT cli.nombre, cli.apellido, COUNT(idTransaccion) as Cantidad, SUM(tran.precio) as Subtotal,
       AVG(tran.precio) as Total FROM Transaccion AS tran, Cliente as cli
        WHERE cli.idCliente = tran.idCliente GROUP BY cli.idCliente HAVING Cantidad > 1;


SELECT ar.nombre, ar.apellido , COUNT(pin.idPintura) AS CUANTOS,SUM(precio) AS PRECIO FROM Pintura AS pin ,Artista AS ar,
                                                     Transaccion AS tran
                                                     WHERE pin.idPintura = tran.idPintura AND pin.idPintura = tran.idPintura
                                                     AND precio<10000
                                                     GROUP BY ar.idArtista HAVING SUM(tran.precio) < 1000;

SELECT PIN.titulo, COUNT(TRAN.idTransaccion) AS TOTAL_VENTAS FROM Pintura AS PIN, Transaccion AS TRAN
                                                             WHERE PIN.idPintura = TRAN.idPintura
                                                             GROUP BY PIN.idPintura HAVING TOTAL_VENTAS >= 2;