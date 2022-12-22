-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Jun-2022 às 22:55
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdcinema`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbator`
--

CREATE TABLE `tbator` (
  `codAtor` int(11) NOT NULL,
  `nomeAtor` varchar(100) NOT NULL,
  `anoNascimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbator`
--

INSERT INTO `tbator` (`codAtor`, `nomeAtor`, `anoNascimento`) VALUES
(2, 'nathalia', 2005),
(3, 'call me by your name', 0),
(4, 'david', 2004);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbatorfilme`
--

CREATE TABLE `tbatorfilme` (
  `CodAtorFilme` int(11) NOT NULL,
  `codAtor` int(11) NOT NULL,
  `codFilme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbatorfilme`
--

INSERT INTO `tbatorfilme` (`CodAtorFilme`, `codAtor`, `codFilme`) VALUES
(4, 3, 1),
(5, 4, 4),
(6, 4, 4),
(7, 4, 9),
(8, 2, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbdiretor`
--

CREATE TABLE `tbdiretor` (
  `codDiretor` int(11) NOT NULL,
  `nomeDiretor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbdiretor`
--

INSERT INTO `tbdiretor` (`codDiretor`, `nomeDiretor`) VALUES
(2, 'nat linda'),
(3, 'b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfilme`
--

CREATE TABLE `tbfilme` (
  `codFilme` int(11) NOT NULL,
  `nomeFilme` varchar(50) NOT NULL,
  `anoLancamento` int(11) NOT NULL,
  `codGenero` int(11) DEFAULT NULL,
  `codDiretor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbfilme`
--

INSERT INTO `tbfilme` (`codFilme`, `nomeFilme`, `anoLancamento`, `codGenero`, `codDiretor`) VALUES
(1, 'heartstopper', 1900, NULL, NULL),
(4, 'aa', 2005, 2, 2),
(9, 'teste1', 2000, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgenerofilme`
--

CREATE TABLE `tbgenerofilme` (
  `codGenero` int(11) NOT NULL,
  `genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbgenerofilme`
--

INSERT INTO `tbgenerofilme` (`codGenero`, `genero`) VALUES
(2, 'romance'),
(3, 'gay');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbator`
--
ALTER TABLE `tbator`
  ADD PRIMARY KEY (`codAtor`);

--
-- Índices para tabela `tbatorfilme`
--
ALTER TABLE `tbatorfilme`
  ADD PRIMARY KEY (`CodAtorFilme`),
  ADD KEY `FKCODATOR` (`codAtor`),
  ADD KEY `FKCODFILME` (`codFilme`);

--
-- Índices para tabela `tbdiretor`
--
ALTER TABLE `tbdiretor`
  ADD PRIMARY KEY (`codDiretor`);

--
-- Índices para tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD PRIMARY KEY (`codFilme`),
  ADD KEY `FKCODGENERO` (`codGenero`),
  ADD KEY `FKCODDIRETOR` (`codDiretor`);

--
-- Índices para tabela `tbgenerofilme`
--
ALTER TABLE `tbgenerofilme`
  ADD PRIMARY KEY (`codGenero`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbator`
--
ALTER TABLE `tbator`
  MODIFY `codAtor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbatorfilme`
--
ALTER TABLE `tbatorfilme`
  MODIFY `CodAtorFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tbdiretor`
--
ALTER TABLE `tbdiretor`
  MODIFY `codDiretor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  MODIFY `codFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tbgenerofilme`
--
ALTER TABLE `tbgenerofilme`
  MODIFY `codGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbatorfilme`
--
ALTER TABLE `tbatorfilme`
  ADD CONSTRAINT `FKCODATOR` FOREIGN KEY (`codAtor`) REFERENCES `tbator` (`codAtor`),
  ADD CONSTRAINT `FKCODFILME` FOREIGN KEY (`codFilme`) REFERENCES `tbfilme` (`codFilme`);

--
-- Limitadores para a tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD CONSTRAINT `FKCODDIRETOR` FOREIGN KEY (`codDiretor`) REFERENCES `tbdiretor` (`codDiretor`),
  ADD CONSTRAINT `FKCODGENERO` FOREIGN KEY (`codGenero`) REFERENCES `tbgenerofilme` (`codGenero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
