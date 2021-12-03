CREATE DATABASE peliculas;

--acceder a la base de datos desde consola
\c peliculas;

--crear tabla peliculas
CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR(80),
    estreno INT,
    director VARCHAR(50),
    PRIMARY KEY (id)
);

--en caso de necesitar:
--drop table peliculas;

--visualizar
SELECT * FROM peliculas;

--cargar archivos a tabla peliculas
COPY peliculas FROM 'peliculas.csv' csv header;

CREATE TABLE reparto(
    id INT,
    elenco VARCHAR(60),
    FOREIGN KEY (id) REFERENCES peliculas (id)
);

--visualizar
SELECT * FROM reparto;

--en caso de necesitar:
--drop table reparto;

--cargar archivos a tabla reparto
COPY reparto FROM 'reparto.csv' csv header;

--obtener ID de pelicula titanic
SELECT id FROM peliculas WHERE pelicula='Titanic';

--listar actores de pelicula titanic
SELECT elenco FROM reparto WHERE id=2;

--consultar en cuantas peliculas participa harrison ford
SELECT elenco FROM reparto WHERE elenco='Harrison Ford';
SELECT id FROM reparto WHERE elenco='Harrison Ford';
SELECT pelicula FROM peliculas WHERE id in (48, 59, 63, 67, 69,87,88,97);
SELECT COUNT (elenco)
FROM reparto WHERE elenco ='Harrison Ford';

--indicar las peliculas estrenadas entre años 1990 y 1999
SELECT pelicula FROM peliculas WHERE estreno in(1990, 1991,1992, 1993, 1994, 1995, 1996, 1997, 1998,1999);

--ordenar las peliculas por titulo de manera ascendente
SELECT pelicula FROM peliculas WHERE estreno in(1990, 1991,1992, 1993, 1994, 1995, 1996, 1997, 1998,1999)
ORDER BY estreno ASC;

--consulta sql que muestre los titulos con su longitud, la longitud debe ser nombrada como 'longitud_titulo'

ALTER TABLE peliculas 
ADD longitud_titulo FLOAT;

UPDATE peliculas SET longitud_titulo= LENGTH(pelicula);

--consulta sql que muestre la longitud mas grande de todos los titulos de las peliculas

SELECT MAX(LENGTH(pelicula)) AS longitud_titulo FROM peliculas;
SELECT pelicula FROM peliculas WHERE longitud_titulo=52;



