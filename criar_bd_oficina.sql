use bd_oficina;
-- Criação das tabelas

-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT,
    tipo ENUM('Carro', 'Moto') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela OrdemDeServico
CREATE TABLE OrdemDeServico (
    id_ordem INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_servico DATE NOT NULL,
    valor_mao_de_obra DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10, 2) NOT NULL
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Tabela OrdemDeServico_Produto (para relação muitos-para-muitos entre OrdemDeServico e Produto)
CREATE TABLE OrdemDeServico_Produto (
    id_ordem INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_utilizada INT NOT NULL,
    PRIMARY KEY (id_ordem, id_produto),
    FOREIGN KEY (id_ordem) REFERENCES OrdemDeServico(id_ordem),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);