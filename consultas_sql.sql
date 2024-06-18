-- Consulta para listar todos os clientes e seus veículos
SELECT 
    c.nome AS Cliente,
    v.marca AS Marca,
    v.modelo AS Modelo,
    v.ano AS Ano,
    v.tipo AS Tipo
FROM 
    Cliente c
JOIN 
    Veiculo v ON c.id_cliente = v.id_cliente
ORDER BY 
    c.nome;

-- Consulta para listar todas as ordens de serviço, com informações do cliente e do veículo
SELECT 
    o.id_ordem AS OrdemID,
    c.nome AS Cliente,
    v.marca AS Marca,
    v.modelo AS Modelo,
    v.tipo AS Tipo,
    o.data_servico AS Data,
    o.valor_mao_de_obra AS ValorMaoDeObra
FROM 
    OrdemDeServico o
JOIN 
    Cliente c ON o.id_cliente = c.id_cliente
JOIN 
    Veiculo v ON o.id_veiculo = v.id_veiculo
ORDER BY 
    o.data_servico DESC;
    
-- Consulta para listar os produtos utilizados em cada ordem de serviço, incluindo a quantidade utilizada e o valor total dos produtos
SELECT 
    o.id_ordem AS OrdemID,
    p.nome AS Produto,
    osp.quantidade_utilizada AS QuantidadeUtilizada,
    (osp.quantidade_utilizada * p.preco_unitario) AS ValorTotalProduto
FROM 
    OrdemDeServico_Produto osp
JOIN 
    Produto p ON osp.id_produto = p.id_produto
JOIN 
    OrdemDeServico o ON osp.id_ordem = o.id_ordem
ORDER BY 
    o.id_ordem, p.nome;
    
-- Consulta para listar o estoque atual de produtos
SELECT 
    p.nome AS Produto,
    e.quantidade AS QuantidadeEmEstoque
FROM 
    Estoque e
JOIN 
    Produto p ON e.id_produto = p.id_produto
ORDER BY 
    p.nome;
    
-- Consulta para listar os clientes que possuem mais de um veículo
SELECT 
    c.nome AS Cliente,
    COUNT(v.id_veiculo) AS NumeroDeVeiculos
FROM 
    Cliente c
JOIN 
    Veiculo v ON c.id_cliente = v.id_cliente
GROUP BY 
    c.nome
HAVING 
    COUNT(v.id_veiculo) > 1
ORDER BY 
    NumeroDeVeiculos DESC;
    