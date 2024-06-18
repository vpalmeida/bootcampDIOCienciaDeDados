INSERT INTO Cliente (nome, telefone, endereco) VALUES
    ('João Silva', '(11) 98765-4321', 'Rua das Flores, 123'),
    ('Maria Santos', '(21) 91234-5678', 'Av. das Palmeiras, 456'),
    ('Pedro Oliveira', '(31) 99876-5432', 'Rua das Árvores, 789'),
    ('Ana Souza', '(41) 98765-1234', 'Alameda das Pedras, 321'),
    ('Carlos Ferreira', '(51) 91234-8765', 'Travessa dos Passarinhos, 654');

-- Inserção de dados na tabela Veiculo
INSERT INTO Veiculo (id_cliente, marca, modelo, ano, tipo) VALUES
    (1, 'Volkswagen', 'Gol', 2015, 'Carro'),
    (1, 'Honda', 'CB 500', 2018, 'Moto'),
    (2, 'Chevrolet', 'Onix', 2020, 'Carro'),
    (3, 'Yamaha', 'YZF R3', 2019, 'Moto'),
    (3, 'Fiat', 'Uno', 2016, 'Carro'),
    (4, 'Harley-Davidson', 'Sportster Iron 883', 2017, 'Moto'),
    (5, 'Ford', 'Ka', 2014, 'Carro'),
    (5, 'Honda', 'CG 160 Fan', 2021, 'Moto'),
    (5, 'Chevrolet', 'Prisma', 2017, 'Carro'),
    (2, 'Suzuki', 'GSX-S750', 2022, 'Moto');

-- Inserção de dados na tabela OrdemDeServico
INSERT INTO OrdemDeServico (id_cliente, id_veiculo, data_servico, valor_mao_de_obra) VALUES
    (1, 1, '2023-05-15', 250.00),
    (2, 2, '2023-06-20', 180.00),
    (3, 4, '2023-04-10', 300.00),
    (4, 6, '2023-07-05', 150.00),
    (5, 8, '2023-03-25', 200.00),
    (1, 3, '2023-05-30', 280.00),
    (2, 10, '2023-06-12', 220.00),
    (3, 5, '2023-04-15', 260.00),
    (4, 7, '2023-07-10', 180.00),
    (5, 9, '2023-03-28', 190.00);

-- Inserção de dados na tabela Produto
INSERT INTO Produto (nome, descricao, preco_unitario) VALUES
    ('Óleo lubrificante', 'Óleo mineral para motores a gasolina', 35.00),
    ('Pastilha de freio', 'Pastilha de freio para motocicletas', 80.00),
    ('Filtro de óleo', 'Filtro de óleo para carros', 45.00),
    ('Bateria', 'Bateria para veículos de 12V', 250.00),
    ('Correia dentada', 'Correia dentada para motores 1.0', 120.00),
    ('Lâmpada', 'Lâmpada automotiva H4 12V', 20.00),
    ('Disco de freio', 'Disco de freio ventilado para carros', 150.00),
    ('Pneu', 'Pneu aro 14 para carros de passeio', 300.00),
    ('Vela de ignição', 'Vela de ignição para motores a gasolina', 30.00),
    ('Kit de embreagem', 'Kit de embreagem para carros populares', 400.00);

-- Inserção de dados na tabela Estoque
INSERT INTO Estoque (id_produto, quantidade) VALUES
    (1, 50),
    (2, 20),
    (3, 30),
    (4, 10),
    (5, 15),
    (6, 40),
    (7, 25),
    (8, 18),
    (9, 35),
    (10, 12);

-- Inserção de dados na tabela OrdemDeServico_Produto
INSERT INTO OrdemDeServico_Produto (id_ordem, id_produto, quantidade_utilizada) VALUES
    (1, 1, 2),
    (1, 3, 1),
    (2, 5, 1),
    (3, 2, 1),
    (3, 4, 1),
    (4, 6, 2),
    (5, 8, 4),
    (6, 7, 2),
    (7, 9, 1),
    (8, 10, 1);