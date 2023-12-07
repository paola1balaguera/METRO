use filtro;

CREATE TABLE zona (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE ruta (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tiempo TIME NOT NULL,
    estacion_inicial VARCHAR(50) NOT NULL,
    estacion_final VARCHAR(50) NOT NULL
);

CREATE TABLE estacion (
    id_estacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE estacion_ruta (
    id_estacion INT,
    id_ruta INT,
    FOREIGN KEY(id_estacion) REFERENCES estacion(id_estacion),
    FOREIGN KEY(id_ruta) REFERENCES ruta(id_ruta)
);

CREATE TABLE conductor (
    id_conductor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE buses(
    id_bus INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(50) NOT NULL
);

CREATE TABLE recorrido (
    id_conductor INT,
    id_bus INT,
    dia ENUM('1','2','3','4','5','6','7') NOT NULL,
    id_ruta INT,
    id_zona INT,
    FOREIGN KEY(id_conductor) REFERENCES conductor(id_conductor),
    FOREIGN KEY(id_bus) REFERENCES buses(id_bus),
    FOREIGN KEY(id_ruta) REFERENCES ruta(id_ruta),
    FOREIGN KEY(id_zona) REFERENCES zona(id_zona)
);


####POBLAMIENTO 2.0
INSERT INTO zona(nombre) 
VALUES 
("Norte"),
("Sur"),
("Oriente"),
("Occidente"),
("Floridablanca"),
("Girón"),
("Piedecuesta");

INSERT INTO estacion(nombre)
VALUES 
("Colseguros"),
("Clínica Chicamocha"),
("Plaza Guarín"),
("Mega Mall"),
("UIS"),
("UDI"),
("Santo Tomás"),
("Boulevard Santander"),
("Búcaros"), ("Rosita"),
("Puerta del Sol"),
("Cacique"),
("Plaza Satélite"),
("La Sirena"),
("Provenza"),
("Fontana"),
("Gibraltar"),
("Terminal"),
("Mutis"),
("Plaza Real");

INSERT INTO buses(placa)
VALUES
("XVH345"),
("XDL965"),
("XFG847"),
("XRJ452"),
("XDF459"),
("XET554"),
("XKL688"),
("XXL757");

INSERT INTO conductor(nombre)
VALUES
("Andrés Manuel López Obrador"),
("Nicolás Maduro Moros"),
("Alberto Fernández"),
("Luiz Inácio Lula da Silva"),
("Gabriel Boric"),
("Miguel Díaz-Canel"),
("Daniel Ortega"),
("Gustavo Petro Urrego"),
("Luis Arce"),
("Xiomara Castro");




INSERT INTO RUTA (nombre, tiempo, estacion_inicial, estacion_final)
VALUES 
("Universidades", '2:00:00', 1, 2), 
("Café Madrid", '2:15:00', 3, 4),
("Cacique", '1:45:00', 5, 6), 
("Diamantes", '1:50:00', 7, 8), 
("Terminal", '2:00:00', 9, 10), 
("Prado", '1:30:00', 11, 12), 
("Cabecera", '2:00:00', 13, 14), 
("Ciudadela", '2:00:00', 15, 16), 
("Punta Estrella", '2:30:00', 17, 18), 
("Niza", '2:45:00', 19, 20), 
("Autopista", '2:15:00', 21, 22), 
("Lagos", '2:15:00', 23, 24), 
("Centro Florida", '2:30:00', 25, 26);



INSERT INTO estacion_ruta(id_estacion, id_ruta)
VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,3),
(9,3),
(10,3),
(11,3),
(12,3),
(13,4),
(14,4),
(15,4),
(16,5),
(17,5),
(18,8),
(19,8),
(20,8);

INSERT INTO recorrido(id_conductor, id_bus, dia, id_ruta, id_zona)
VALUES
(5,1,1,1,1),
(5,1,2,1,1),
(5,3,3,1,1),
(5,3,4,1,1),
(5,5,5,2,1),
(5,5,6,2,1),
(5,5,7,2,1),
(3,5,1,4,4),
(3,6,2,4,4),
(3,1,3,4,4),
(3,1,4,5,4),
(3,3,5,5,4),
(3,3,6,5,4),
(3,3,7,5,4),
(10,3,1,10,5),
(10,3,2,10,5),
(10,5,3,10,5),
(10,5,4,10,5),
(10,4,5,10,5),
(10,7,6,11,5),
(10,7,7,11,5),
(7,7,1,11,5),
(7,7,2,11,5),
(6,7,3,12,5),
(6,7,4,12,5),
(6,7,5,12,5),
(6,6,6,12,5),
(6,6,7,12,5)
;