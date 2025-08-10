CREATE DATABASE Locadora;
USE Locadora;

CREATE TABLE Diretores (
    id_diretor INT AUTO_INCREMENT PRIMARY KEY,
    nome_diretor VARCHAR(255) NOT NULL
);

CREATE TABLE Filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_diretor INT,
    FOREIGN KEY (id_diretor) REFERENCES Diretores(id_diretor)
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE Alugueis (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT,
    id_cliente INT,
    data_aluguel DATE NOT NULL,
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Diretores (nome_diretor) VALUES 
('Quentin Tarantino'), 
('Christopher Nolan'), 
('Tatsuki Fujimoto');

INSERT INTO Filmes (titulo, id_diretor) VALUES 
('Pulp Fiction', 1), 
('Inception', 2), 
('Barbie', 3);

INSERT INTO Clientes (nome_cliente) VALUES 
('João Lima'), 
('Maria Costa'), 
('Pedro Almeida');

INSERT INTO Alugueis (id_filme, id_cliente, data_aluguel) VALUES 
(1, 1, '2025-01-15'), 
(2, 2, '2025-02-20'), 
(3, 3, '2025-03-10');

SELECT F.titulo, D.nome_diretor
FROM Filmes F
INNER JOIN Diretores D ON F.id_diretor = D.id_diretor;

SELECT C.nome_cliente, A.data_aluguel
FROM Clientes C
LEFT JOIN Alugueis A ON C.id_cliente = A.id_cliente;

SELECT F.titulo, A.data_aluguel
FROM Filmes F
RIGHT JOIN Alugueis A ON F.id_filme = A.id_filme;

SELECT titulo
FROM Filmes
WHERE id_diretor IN (
    SELECT id_diretor
    FROM Filmes
    GROUP BY id_diretor
    HAVING COUNT(*) > 1
);

SELECT nome_cliente, (
    SELECT COUNT(*) 
    FROM Alugueis A 
    WHERE A.id_cliente = C.id_cliente
) AS total_alugueis
FROM Clientes C;

CREATE VIEW View_Filmes_Diretores AS
SELECT F.titulo, D.nome_diretor
FROM Filmes F
JOIN Diretores D ON F.id_diretor = D.id_diretor;

CREATE VIEW View_Alugueis_Detalhados AS
SELECT A.id_aluguel, F.titulo, C.nome_cliente, A.data_aluguel
FROM Alugueis A
JOIN Filmes F ON A.id_filme = F.id_filme
JOIN Clientes C ON A.id_cliente = C.id_cliente;

SELECT F.titulo, COUNT(A.id_aluguel) AS total_alugueis
FROM Filmes F
LEFT JOIN Alugueis A ON F.id_filme = A.id_filme
GROUP BY F.titulo;