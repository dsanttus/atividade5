-- criar banco de dados
CREATE DATABASE Loja;

-- usar o banco de dados
USE Loja;

-- criar tabela Clientes
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    DataCadastro DATE
);

-- inserir dados nas tabelas
INSERT INTO Cliente (Nome, DataCadastro) VALUES 
('João Silva', '2023-06-01'),
('Maria Oliveira', '2023-06-01'),
('Carlos Santos', '2023-06-01'),
('Ana Souza', '2023-06-02'),
('Pedro Almeida', '2023-06-02'),
('Mariana Lima', '2023-06-03');

-- criar função para contar novos clientes cadastrados em um dia
DELIMITER //

CREATE FUNCTION ContarNovosClientes(data_consulta DATE)
RETURNS INT
BEGIN
    DECLARE quantidade INT;
    SELECT COUNT(*) INTO quantidade
    FROM Cliente
    WHERE DataCadastro = data_consulta;
    RETURN quantidade;
END //

DELIMITER ;

-- usar a função para contar novos clientes cadastrados no dia 2023-06-02
SELECT ContarNovosClientes('2023-06-02') AS NovosClientes;
