
---------- EJEMPLO 1

-- creacion de la tabla libro
CREATE TABLE books  
(  
    book_name varchar(150) PRIMARY KEY NOT NULL,
    sold_copies int NOT NULL
);

go

-- creacion de la tabla autor
CREATE TABLE authors  
(  
    author_name varchar(150) PRIMARY KEY NOT NULL,
    book_name varchar(150) NOT NULL,
	CONSTRAINT fk_Books FOREIGN KEY (book_name) REFERENCES books (book_name)
);
go

-- insert en tabla libro
INSERT INTO books (book_name,sold_copies)
VALUES
    ('book_1', 1000),
    ('book_2', 1500),
    ('book_3', 34000),
	('book_4', 29000),
	('book_5', 40000),
	('book_6', 4400)
go

-- insertar en tabla autor
INSERT INTO authors (author_name,book_name)
VALUES
    ('author_1', 'book_1'),
    ('author_2', 'book_2'),
    ('author_3', 'book_3'),
	('author_4', 'book_4'),
	('author_5', 'book_5'),
	('author_6', 'book_6')
go

-- consulta del top 3 de autores con libros mas vendidos
CREATE PROCEDURE sp_aut_vent
as
	SELECT TOP(3) A.author_name AS Autor, MAX(b.sold_copies) as Ventas
	FROM authors A
	INNER JOIN books b
	ON A.book_name = b.book_name
	GROUP BY A.author_name
	ORDER BY 2 DESC;
go

exec sp_aut_vent