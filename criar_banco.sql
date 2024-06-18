-- MySQL Workbench Synchronization
-- Generated: 2024-06-18 15:43
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: vagner.pa

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `bd_e_commerce` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NULL DEFAULT NULL,
  `tipoPessoa` ENUM("Pessoa Física", "Pessoa Jurídica") NOT NULL,
  `contato` VARCHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente` INT(11) NOT NULL,
  `status` ENUM("Aguardando Pagamento", "Pagamento aprovado", "Cancelado") NULL DEFAULT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `valorTotal` FLOAT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `bd_e_commerce`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Produto` (
  `idProduto` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `kids` TINYINT(4) NULL DEFAULT 0,
  `categoria` ENUM("Eletrônico", "Vestimenta", "Brinquedos", "Alimentos", "Móveis") NOT NULL,
  `avaliacao` FLOAT(11) NULL DEFAULT 0,
  `tamanho` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Pedido_has_Produto` (
  `idPedido` INT(11) NOT NULL,
  `idProduto` INT(11) NOT NULL,
  `quantidade` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPedido`, `idProduto`),
  INDEX `fk_Pedido_has_Produto_Produto1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Produto_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `bd_e_commerce`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `bd_e_commerce`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Estoque` (
  `idEstoque` INT(11) NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Fornecedor` (
  `idFornecedor` INT(11) NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `contato` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Produto_has_Fornecedor` (
  `idProduto` INT(11) NOT NULL,
  `idFornecedor` INT(11) NOT NULL,
  PRIMARY KEY (`idProduto`, `idFornecedor`),
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`idFornecedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Fornecedor_Produto1_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `bd_e_commerce`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `bd_e_commerce`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Vendedor` (
  `idVendedor` INT(11) NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NULL DEFAULT NULL,
  `local` VARCHAR(45) NULL DEFAULT NULL,
  `nome_fantasia` VARCHAR(45) NULL DEFAULT NULL,
  `cnpj` VARCHAR(14) NULL DEFAULT NULL,
  `cpf` VARCHAR(11) NULL DEFAULT NULL,
  `contato` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Produto_has_Vendedor` (
  `idProduto` INT(11) NOT NULL,
  `idVendedor` INT(11) NOT NULL,
  PRIMARY KEY (`idProduto`, `idVendedor`),
  INDEX `fk_Produto_has_Vendedor_Vendedor1_idx` (`idVendedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Vendedor_Produto1_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Vendedor_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `bd_e_commerce`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Vendedor_Vendedor1`
    FOREIGN KEY (`idVendedor`)
    REFERENCES `bd_e_commerce`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Estoque_has_Produto` (
  `idEstoque` INT(11) NOT NULL,
  `idProduto` INT(11) NOT NULL,
  `quantidade` INT(11) NULL DEFAULT 0,
  PRIMARY KEY (`idEstoque`, `idProduto`),
  INDEX `fk_Estoque_has_Produto_Produto1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Estoque_has_Produto_Estoque1_idx` (`idEstoque` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_has_Produto_Estoque1`
    FOREIGN KEY (`idEstoque`)
    REFERENCES `bd_e_commerce`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_has_Produto_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `bd_e_commerce`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`ClientePessoaFisica` (
  `idCliente` INT(11) NOT NULL,
  `primeiroNome` VARCHAR(15) NOT NULL,
  `nomeMeio` VARCHAR(3) NULL DEFAULT NULL,
  `ultimoNome` VARCHAR(20) NULL DEFAULT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `data_nascimento` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_ClientePessoaFisica_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ClientePessoaFisica_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `bd_e_commerce`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`ClientePessoaJuridica` (
  `idCliente` INT(11) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `razaoSocial` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_ClientePessoaJuridica_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `bd_e_commerce`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Entrega` (
  `idPedido` INT(11) NOT NULL,
  `statusEntrega` ENUM("Encaminhado a transportadora", "Em trânsito", "Entregue") NOT NULL,
  `codigoRastreamento` VARCHAR(45) NOT NULL,
  `valor_entrega` FLOAT(11) NOT NULL,
  INDEX `fk_Entrega_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  PRIMARY KEY (`idPedido`),
  CONSTRAINT `fk_Entrega_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `bd_e_commerce`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`Pagamentos` (
  `idPagamentos` INT(11) NOT NULL AUTO_INCREMENT,
  `idPedido` INT(11) NOT NULL,
  `idTipoPagamento` INT(11) NOT NULL,
  `numeroCartao` VARCHAR(16) NULL DEFAULT NULL,
  `valorPagamento` FLOAT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPagamentos`),
  INDEX `fk_Pagamentos_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  INDEX `fk_Pagamentos_TipoPagamento1_idx` (`idTipoPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamentos_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `bd_e_commerce`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagamentos_TipoPagamento1`
    FOREIGN KEY (`idTipoPagamento`)
    REFERENCES `bd_e_commerce`.`TipoPagamento` (`idTipoPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bd_e_commerce`.`TipoPagamento` (
  `idTipoPagamento` INT(11) NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoPagamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
