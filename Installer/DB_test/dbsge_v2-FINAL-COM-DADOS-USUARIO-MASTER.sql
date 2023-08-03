-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 25-Jun-2023 às 21:14
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbsge_v2`
--
CREATE DATABASE IF NOT EXISTS `dbsge_v2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dbsge_v2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade_programada`
--

DROP TABLE IF EXISTS `atividade_programada`;
CREATE TABLE IF NOT EXISTS `atividade_programada` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `descricao_atividade` longtext NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_conclusao` date DEFAULT NULL,
  `fk_estagio_supervisionado_atividade_programada_pk_id` int DEFAULT NULL,
  `fk_equivalencia_estagio_atividade_programada_pk_id` int DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idatividade_programada_UNIQUE` (`pk_id`),
  KEY `fk_estagio_atividade_programada_pk_id_idx` (`fk_estagio_supervisionado_atividade_programada_pk_id`),
  KEY `fk_equivalencia_estagio_atividade_programada_pk_id_idx` (`fk_equivalencia_estagio_atividade_programada_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `atividade_programada`
--

TRUNCATE TABLE `atividade_programada`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `numero_contato` varchar(14) NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `contato`
--

TRUNCATE TABLE `contato`;
--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`pk_id`, `email`, `numero_contato`) VALUES
(1, 'diretoracademicomaster@hotmail.com', '(12)34567-8999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordenador_curso`
--

DROP TABLE IF EXISTS `coordenador_curso`;
CREATE TABLE IF NOT EXISTS `coordenador_curso` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `fk_usuario_coordenador_curso_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  UNIQUE KEY `fk_usuario_pk_id_UNIQUE` (`fk_usuario_coordenador_curso_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `coordenador_curso`
--

TRUNCATE TABLE `coordenador_curso`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `codigo_mec` int NOT NULL,
  `nome_curso` varchar(255) NOT NULL,
  `modalidade` enum('Educação Presencial','Educação a Distância (EaD)','Educação Semipresencial ou Híbrido') NOT NULL,
  `periodo` enum('Manhã','Tarde','Noite') NOT NULL,
  `carga_horaria` int NOT NULL,
  `status_funcionamento` enum('Em Atividade','Em Extinção','Extinto','Suspenso') NOT NULL,
  `fk_coordenador_curso_pk_id` int NOT NULL,
  `fk_orientador_estagio_pk_id` int DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_coordenador_curso_pk_id_UNIQUE` (`fk_coordenador_curso_pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`,`fk_orientador_estagio_pk_id`),
  KEY `fk_orientador_estagio_pk_id_idx` (`fk_orientador_estagio_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `curso`
--

TRUNCATE TABLE `curso`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `diretor_academico`
--

DROP TABLE IF EXISTS `diretor_academico`;
CREATE TABLE IF NOT EXISTS `diretor_academico` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `fk_usuario_diretor_academico_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  UNIQUE KEY `fk_usuario_pk_id_UNIQUE` (`fk_usuario_diretor_academico_pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `diretor_academico`
--

TRUNCATE TABLE `diretor_academico`;
--
-- Extraindo dados da tabela `diretor_academico`
--

INSERT INTO `diretor_academico` (`pk_id`, `fk_usuario_diretor_academico_pk_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `diretor_geral`
--

DROP TABLE IF EXISTS `diretor_geral`;
CREATE TABLE IF NOT EXISTS `diretor_geral` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `status` enum('Ativo') DEFAULT NULL,
  `fk_usuario_diretor_geral_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  UNIQUE KEY `fk_usuario_pk_id_UNIQUE` (`fk_usuario_diretor_geral_pk_id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `diretor_geral`
--

TRUNCATE TABLE `diretor_geral`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `discente`
--

DROP TABLE IF EXISTS `discente`;
CREATE TABLE IF NOT EXISTS `discente` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `fk_usuario_discente_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  UNIQUE KEY `fk_usuario_pk_id_UNIQUE` (`fk_usuario_discente_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `discente`
--

TRUNCATE TABLE `discente`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE IF NOT EXISTS `disciplina` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(10) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `fk_curso_disciplina_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  KEY `fk_curso_pk_id_idx` (`fk_curso_disciplina_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `disciplina`
--

TRUNCATE TABLE `disciplina`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos_pessoais`
--

DROP TABLE IF EXISTS `documentos_pessoais`;
CREATE TABLE IF NOT EXISTS `documentos_pessoais` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `tipo_pessoa` enum('Física','Jurídica') NOT NULL,
  `rg` varchar(12) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id_UNIQUE` (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `documentos_pessoais`
--

TRUNCATE TABLE `documentos_pessoais`;
--
-- Extraindo dados da tabela `documentos_pessoais`
--

INSERT INTO `documentos_pessoais` (`pk_id`, `tipo_pessoa`, `rg`, `cpf`, `cnpj`) VALUES
(1, 'Física', '12.345.678-9', '123.456.789-99', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `endereco`
--

TRUNCATE TABLE `endereco`;
--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`pk_id`, `estado`, `cidade`, `bairro`, `cep`, `logradouro`, `numero`, `complemento`) VALUES
(1, 'São Paulo (SP)', 'Guarulhos', 'Jardim Presidente Dutra', '07170-000', 'Avenida Rio Real', 123456, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equivalencia_estagio`
--

DROP TABLE IF EXISTS `equivalencia_estagio`;
CREATE TABLE IF NOT EXISTS `equivalencia_estagio` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `historico_empresa` longtext NOT NULL,
  `principais_atividades` longtext NOT NULL,
  `objetivo_empresa` longtext,
  `valores` longtext,
  `politica_qualidade` longtext,
  `missao` longtext,
  `setor_economico` longtext,
  `principais_caracteristicas` longtext,
  `fk_instituicao_concedente_equivalencia_estagio_pk_id` int NOT NULL,
  `fk_discente_equivalencia_estagio_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idequivalencia_estagio_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_instituicao_concedente_equivalencia_estagio_pk_id_UNIQUE` (`fk_instituicao_concedente_equivalencia_estagio_pk_id`),
  KEY `fk_discente_equivalencia_estagio_pk_id_idx` (`fk_discente_equivalencia_estagio_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `equivalencia_estagio`
--

TRUNCATE TABLE `equivalencia_estagio`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `equivalencia_estagio_entregue`
--

DROP TABLE IF EXISTS `equivalencia_estagio_entregue`;
CREATE TABLE IF NOT EXISTS `equivalencia_estagio_entregue` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `data_hora_entrega` datetime NOT NULL,
  `status_entrega` enum('Pendente','Recusado (Orientação de Estágio)','Recusado (Coordenação de Curso)','Recusado (Direção Geral)','Validado (Coordenação de Curso)','Validado (Direção Geral)','Aprovado','Finalizado') NOT NULL,
  `relatorio_estagio` mediumblob NOT NULL,
  `devolutiva` longtext,
  `data_hora_devolutiva` datetime DEFAULT NULL,
  `fk_protocolo_equivalencia_estagio_entregue_pk_id` int DEFAULT NULL,
  `fk_discente_equivalencia_estagio_entregue_pk_id` int NOT NULL,
  `fk_orientador_estagio_equivalencia_estagio_entregue_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idequivalencia_estagio_entregue_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_protocolo_equivalencia_estagio_entregue_pk_id_UNIQUE` (`fk_protocolo_equivalencia_estagio_entregue_pk_id`),
  KEY `fk_discente_equivalencia_estagio_entregue_pk_id_idx` (`fk_discente_equivalencia_estagio_entregue_pk_id`),
  KEY `fk_orientador_estagio_equivalencia_estagio_entregue_pk_id_idx` (`fk_orientador_estagio_equivalencia_estagio_entregue_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `equivalencia_estagio_entregue`
--

TRUNCATE TABLE `equivalencia_estagio_entregue`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `estagio_supervisionado`
--

DROP TABLE IF EXISTS `estagio_supervisionado`;
CREATE TABLE IF NOT EXISTS `estagio_supervisionado` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `areas_atuacao` mediumtext NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `total_horas` int NOT NULL,
  `fk_instituicao_concedente_estagio_supervisionado_pk_id` int NOT NULL,
  `fk_supervisao_estagio_supervisionado_pk_id` int NOT NULL,
  `fk_seguro_estagio_supervisionado_pk_id` int NOT NULL,
  `fk_termo_entregue_estagio_supervisionado_pk_id` int NOT NULL,
  `fk_discente_estagio_supervisionado_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_seguro_pk_id_UNIQUE` (`fk_seguro_estagio_supervisionado_pk_id`),
  UNIQUE KEY `fk_supervisao_estagio_supervisionado_UNIQUE` (`fk_supervisao_estagio_supervisionado_pk_id`),
  UNIQUE KEY `fk_instituicao_concedente_estagio_supervisionado_pk_id_UNIQUE` (`fk_instituicao_concedente_estagio_supervisionado_pk_id`),
  KEY `fk_discente_pk_id_idx` (`fk_discente_estagio_supervisionado_pk_id`),
  KEY `fk_termo_entregue_estagio_supervisionado_pk_id_idx` (`fk_termo_entregue_estagio_supervisionado_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `estagio_supervisionado`
--

TRUNCATE TABLE `estagio_supervisionado`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `estagio_supervisionado_entregue`
--

DROP TABLE IF EXISTS `estagio_supervisionado_entregue`;
CREATE TABLE IF NOT EXISTS `estagio_supervisionado_entregue` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `data_hora_entrega` datetime NOT NULL,
  `status_entrega` enum('Pendente','Recusado (Orientação de Estágio)','Recusado (Coordenação de Curso)','Recusado (Direção Geral)','Validado (Orientação de Estágio)','Validado (Coordenação de Curso)','Validado (Direção Geral)','Aprovado','Finalizado') NOT NULL,
  `tipo_estagio` enum('Estágio Remunerado','Estágio Voluntário') NOT NULL,
  `termo_compromisso` mediumblob NOT NULL,
  `relatorio_estagio` mediumblob NOT NULL,
  `devolutiva` longtext,
  `data_hora_devolutiva` datetime DEFAULT NULL,
  `fk_protocolo_estagio_supervisionado_entregue_pk_id` int DEFAULT NULL,
  `fk_discente_estagio_supervisionado_entregue_pk_id` int NOT NULL,
  `fk_orientador_estagio_supervisionado_entregue_pk_id` int NOT NULL,
  `fk_diretor_geral_estagio_supervisionado_entregue_pk_id` int NOT NULL,
  `fk_coordenador_estagio_supervisionado_entregue_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_protocolo_estagio_supervisionado_entregue_pk_id_UNIQUE` (`fk_protocolo_estagio_supervisionado_entregue_pk_id`),
  KEY `fk_discente_estagio_supervisionado_entregue_pk_id_idx` (`fk_discente_estagio_supervisionado_entregue_pk_id`),
  KEY `fk_orientador_estagio_supervisionado_entregue_pk_id_idx` (`fk_orientador_estagio_supervisionado_entregue_pk_id`),
  KEY `fk_diretor_geral_estagio_supervisionado_entregue_pk_id_idx` (`fk_diretor_geral_estagio_supervisionado_entregue_pk_id`),
  KEY `fk_coordenador_estagio_supervisionado_entregue_pk_id_idx` (`fk_coordenador_estagio_supervisionado_entregue_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `estagio_supervisionado_entregue`
--

TRUNCATE TABLE `estagio_supervisionado_entregue`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `horario_plantao`
--

DROP TABLE IF EXISTS `horario_plantao`;
CREATE TABLE IF NOT EXISTS `horario_plantao` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `status` enum('Ativo','Inativo') NOT NULL,
  `dia_semana` enum('Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado','Domingo') NOT NULL,
  `hora_inicio` varchar(20) NOT NULL,
  `hora_termino` varchar(20) NOT NULL,
  `fk_horario_plantao_orientador_estagio_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `fk_horario_plantao_orientador_estagio_pk_id_idx` (`fk_horario_plantao_orientador_estagio_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `horario_plantao`
--

TRUNCATE TABLE `horario_plantao`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao_concedente`
--

DROP TABLE IF EXISTS `instituicao_concedente`;
CREATE TABLE IF NOT EXISTS `instituicao_concedente` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(18) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `origem` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `setor_empresarial` varchar(255) NOT NULL,
  `fk_endereco_instituicao_concedente_pk_id` int NOT NULL,
  `fk_contato_instituicao_concedente_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_endereco_estagio_supervisionado_pk_id_UNIQUE` (`fk_endereco_instituicao_concedente_pk_id`),
  UNIQUE KEY `fk_contato_instituicao_concedente_pk_id_UNIQUE` (`fk_contato_instituicao_concedente_pk_id`),
  KEY `fk_contato_instituicao_concedente_pk_id_idx` (`fk_contato_instituicao_concedente_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `instituicao_concedente`
--

TRUNCATE TABLE `instituicao_concedente`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `usuario` longtext NOT NULL,
  `senha` longtext,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idlogin_UNIQUE` (`pk_id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`(100))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `login`
--

TRUNCATE TABLE `login`;
--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`pk_id`, `usuario`, `senha`) VALUES
(1, 'PFuQ002p/OPM/bQaQtrqNQmWVwRr5G29096XeVAowEA=', 'I7u9dUtYx0Xp0SxH6NqIgCVwI0W9sPT+3vLMLuRuHMoDojlh82BnvQ==');

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `ra` varchar(13) NOT NULL,
  `semestre` int NOT NULL,
  `ano_inicio` year NOT NULL,
  `ano_conclusao` year NOT NULL,
  `fk_curso_matricula_pk_id` int NOT NULL,
  `fk_discente_matricula_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  UNIQUE KEY `fk_discente_pk_id_UNIQUE` (`fk_discente_matricula_pk_id`),
  KEY `fk_curso_pk_id_idx` (`fk_curso_matricula_pk_id`),
  KEY `fk_discente_pk_id_idx` (`fk_discente_matricula_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `matricula`
--

TRUNCATE TABLE `matricula`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_relatorio_estagio`
--

DROP TABLE IF EXISTS `modelo_relatorio_estagio`;
CREATE TABLE IF NOT EXISTS `modelo_relatorio_estagio` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome_relatorio` varchar(255) NOT NULL,
  `relatorio` mediumblob NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idmodelo_relatorio_estagio_UNIQUE` (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `modelo_relatorio_estagio`
--

TRUNCATE TABLE `modelo_relatorio_estagio`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_termo_compromisso`
--

DROP TABLE IF EXISTS `modelo_termo_compromisso`;
CREATE TABLE IF NOT EXISTS `modelo_termo_compromisso` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome_termo` varchar(255) NOT NULL,
  `termo` mediumblob NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idmodelo_termo_compromisso_UNIQUE` (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `modelo_termo_compromisso`
--

TRUNCATE TABLE `modelo_termo_compromisso`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `orientador_estagio`
--

DROP TABLE IF EXISTS `orientador_estagio`;
CREATE TABLE IF NOT EXISTS `orientador_estagio` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `fk_usuario_orientador_estagio_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  UNIQUE KEY `fk_usuario_pk_id_UNIQUE` (`fk_usuario_orientador_estagio_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `orientador_estagio`
--

TRUNCATE TABLE `orientador_estagio`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `outro_documento_estagio_entregue`
--

DROP TABLE IF EXISTS `outro_documento_estagio_entregue`;
CREATE TABLE IF NOT EXISTS `outro_documento_estagio_entregue` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome_documento` mediumtext NOT NULL,
  `documento_estagio` mediumblob NOT NULL,
  `fk_estagio_supervisionado_entregue_pk_id` int DEFAULT NULL,
  `fk_equivalencia_estagio_entregue_pk_id` int DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `iddocumento_entregue_estagio_UNIQUE` (`pk_id`),
  KEY `fk_estagio_supervisionado_entregue_pk_id_idx` (`fk_estagio_supervisionado_entregue_pk_id`),
  KEY `fk_equivalencia_estagio_entregue_pk_id_idx` (`fk_equivalencia_estagio_entregue_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `outro_documento_estagio_entregue`
--

TRUNCATE TABLE `outro_documento_estagio_entregue`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `outro_modelo_documento`
--

DROP TABLE IF EXISTS `outro_modelo_documento`;
CREATE TABLE IF NOT EXISTS `outro_modelo_documento` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome_documento` varchar(255) NOT NULL,
  `documento` mediumblob NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idoutros_modelos_UNIQUE` (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `outro_modelo_documento`
--

TRUNCATE TABLE `outro_modelo_documento`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo_estagio_entregue`
--

DROP TABLE IF EXISTS `protocolo_estagio_entregue`;
CREATE TABLE IF NOT EXISTS `protocolo_estagio_entregue` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `data_hora_entrega` datetime NOT NULL,
  `protocolo_entrega` mediumblob NOT NULL,
  `fk_orientador_estagio_protocolo_estagio_entregue` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idprotocolo_relatorio_entregue_UNIQUE` (`pk_id`),
  KEY `fk_orientador_estagio_protocolo_estagio_entregue_idx` (`fk_orientador_estagio_protocolo_estagio_entregue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `protocolo_estagio_entregue`
--

TRUNCATE TABLE `protocolo_estagio_entregue`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `relacao_teoria_pratica`
--

DROP TABLE IF EXISTS `relacao_teoria_pratica`;
CREATE TABLE IF NOT EXISTS `relacao_teoria_pratica` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `fk_disciplina_relacao_teoria_pratica_pk_id` int NOT NULL,
  `fk_atividade_programada_relacao_teoria_pratica_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_atividade_programada_relacao_teoria_pratica_pk_id_UNIQUE` (`fk_atividade_programada_relacao_teoria_pratica_pk_id`),
  KEY `fk_disciplina_relacao_teoria_pratica_pk_id_idx` (`fk_disciplina_relacao_teoria_pratica_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `relacao_teoria_pratica`
--

TRUNCATE TABLE `relacao_teoria_pratica`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio_gerado`
--

DROP TABLE IF EXISTS `relatorio_gerado`;
CREATE TABLE IF NOT EXISTS `relatorio_gerado` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome_relatorio` varchar(255) NOT NULL,
  `relatorio_gerado` mediumblob NOT NULL,
  `data_hora` datetime NOT NULL,
  `fk_modelo_relatorio_gerado_pk_id` int NOT NULL,
  `fk_estagio_supervisionado_relatorio_gerado_pk_id` int DEFAULT NULL,
  `fk_equivalencia_estagio_relatorio_gerado_pk_id` int DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `fk_modelo_relatorio_gerado_pk_id_idx` (`fk_modelo_relatorio_gerado_pk_id`),
  KEY `fk_estagio_supervisionado_relatorio_gerado_pk_id_idx` (`fk_estagio_supervisionado_relatorio_gerado_pk_id`),
  KEY `fk_equivalencia_estagio_relatorio_gerado_pk_id_idx` (`fk_equivalencia_estagio_relatorio_gerado_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `relatorio_gerado`
--

TRUNCATE TABLE `relatorio_gerado`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `seguro_estagio`
--

DROP TABLE IF EXISTS `seguro_estagio`;
CREATE TABLE IF NOT EXISTS `seguro_estagio` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `companhia_seguradora` varchar(255) NOT NULL,
  `numero_apolice` varchar(255) NOT NULL,
  `data_apolice` date NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idseguro_UNIQUE` (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `seguro_estagio`
--

TRUNCATE TABLE `seguro_estagio`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `supervisao_estagio`
--

DROP TABLE IF EXISTS `supervisao_estagio`;
CREATE TABLE IF NOT EXISTS `supervisao_estagio` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome_responsavel` varchar(255) NOT NULL,
  `cargo_funcao` varchar(255) NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idsupervisao_estagio_UNIQUE` (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `supervisao_estagio`
--

TRUNCATE TABLE `supervisao_estagio`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `termo_entregue`
--

DROP TABLE IF EXISTS `termo_entregue`;
CREATE TABLE IF NOT EXISTS `termo_entregue` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `data_hora_entrega` datetime NOT NULL,
  `nome_termo` varchar(255) NOT NULL,
  `termo_compromisso` mediumblob NOT NULL,
  `status_entrega` enum('Pendente','Recusado','Validado','Aprovado','Finalizado') NOT NULL,
  `devolutiva` longtext,
  `data_hora_devolutiva` datetime DEFAULT NULL,
  `fk_modelo_termo_entregue_pk_id` int NOT NULL,
  `fk_curso_termo_entregue_pk_id` int NOT NULL,
  `fk_matricula_termo_entregue_pk_id` int NOT NULL,
  `fk_diretor_termo_entregue_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `idtermo_entregue_UNIQUE` (`pk_id`),
  KEY `fk_modelo_termo_entregue_pk_id_idx` (`fk_modelo_termo_entregue_pk_id`),
  KEY `fk_diretor_termo_entregue_pk_id_idx` (`fk_diretor_termo_entregue_pk_id`),
  KEY `fk_matricula_termo_entregue_pk_id_idx` (`fk_matricula_termo_entregue_pk_id`),
  KEY `fk_curso_termo_entregue_pk_id_idx` (`fk_curso_termo_entregue_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `termo_entregue`
--

TRUNCATE TABLE `termo_entregue`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(150) NOT NULL,
  `sexo` enum('Masculino','Feminino') NOT NULL,
  `data_nascimento` date NOT NULL,
  `estado_civil` enum('Solteiro(a)','Casado(a)','Separado(a)','Divorciado(a)') NOT NULL,
  `nacionalidade` varchar(50) NOT NULL,
  `profissao` varchar(100) NOT NULL DEFAULT 'Sem Profissão',
  `nome_mae` varchar(150) NOT NULL,
  `nome_pai` varchar(150) DEFAULT 'Não Especificado',
  `tipo_usuario` enum('Discente','Orientador(a) de Estágio','Diretor(a) Acadêmico','Coordenador(a) de Curso','Diretor(a) Geral') NOT NULL,
  `status_acesso` enum('Acesso Pendente','Acesso Liberado','Acesso Bloqueado') NOT NULL DEFAULT 'Acesso Liberado',
  `foto_perfil` mediumblob NOT NULL,
  `fk_documentos_pessoais_pk_id` int NOT NULL,
  `fk_contato_pk_id` int NOT NULL,
  `fk_endereco_usuario_pk_id` int NOT NULL,
  `fk_login_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id_UNIQUE` (`pk_id`),
  UNIQUE KEY `fk_endereco_pk_id_UNIQUE` (`fk_endereco_usuario_pk_id`),
  UNIQUE KEY `fk_contato_pk_id_UNIQUE` (`fk_contato_pk_id`),
  UNIQUE KEY `fk_tipo_pessoa_pk_id_UNIQUE` (`fk_documentos_pessoais_pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`,`fk_documentos_pessoais_pk_id`,`fk_contato_pk_id`,`fk_endereco_usuario_pk_id`),
  UNIQUE KEY `fk_login_pk_id_UNIQUE` (`fk_login_pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `usuario`
--

TRUNCATE TABLE `usuario`;
--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`pk_id`, `nome`, `sobrenome`, `sexo`, `data_nascimento`, `estado_civil`, `nacionalidade`, `profissao`, `nome_mae`, `nome_pai`, `tipo_usuario`, `status_acesso`, `foto_perfil`, `fk_documentos_pessoais_pk_id`, `fk_contato_pk_id`, `fk_endereco_usuario_pk_id`, `fk_login_pk_id`) VALUES
(1, 'Diretor', 'Academico Master Teste', 'Masculino', '2023-06-25', 'Solteiro(a)', 'Brasileira', 'Diretor Academico Master', 'Diretor Academico Master', 'Diretor Academico Master', 'Diretor(a) Acadêmico', 'Acesso Liberado', 0x89504e470d0a1a0a0000000d49484452000000be000000be0802000000041622ca00000d5249444154785eed9d79571a4b1387f3fd3fc51ba306d994454504057771015c88c10b6ad0882b9a401421f2fecef41b4f4eddbcf7620f48f54c3d7fe4e4dc45a7bb9ee9aa9aa5e75d47105ecfcf9f3fdfd17f26085d20ea089a883a8226a28ea089a8236822ea089a883a8226a28ea089a8236822ea089a883a8226a28ea089a8236822ea089a883a8226a28ea089a8236822ea089a883affa3dd6edfdfdf57abd572b9bcb7b797c964d2e9f4f4f4f4f8f8782412492693abababf97cbe582c9e9d9dd56ab566b3497f84cb70b53aad56ebfcfc7c7373137278bd5e9fcf873fc72c3c1ecfc78f1f477f81bf7b2cf0afbcbf0885422b2b2b272727eed4c88dea341a0d2c2dcbcbcb131313ca12c8313232f2224af728990281402a95c282747777477f997371913a30e6e0e0606e6e2e180cbe18d32bb02ce16762dd8ac5623b3b3bc87df4d73b0e57a8f3f8f80869a2d12849437d02bf251c0ee772b97abd4e0fc541385c1d5433c84d535353bd5d63ba018e42d6fdfdfd1f3f7ed0c372048e550703fbf2e54b3c1e471ea1517d43a02cc44519e4bc52da99ea5c5c5ccccfcfa3f2a0911c1010083550a552a1076a320e54e7f8f818cd368dde4051ed1b1a3ae4af76bb4d8fd84c9ca64ea15040034543c706afd7bbbabaea8ceac739eae06c5e5f5f476c68b8f8914c266bb51a1d806938449d46a381e2868688252316287daad52a1d865138419d9b9b9bd9d95915121a28c6a02043594607630ec6ab737f7fafbca191610f8e391c0e9b6b8ff1eaa4d36913bd510c0f0fcfcccc60d5a4a33201b3d541b732aa7be7920938f8542af5f0f040c7c61e83d529168b8140c0686f467f55cd8b8b8bad568b8e9037a6aaf3f5ebd768346aba370a8cc2e3f16c6c6cd041f2c64875501ca0447086370a8c052be8e7cf9fe95019639e3af57a3d914838c91b856ab88e8e8ee880b9629e3a8542c1e7f3394f9d51abe1c25961ca533e86a9737b7b3b3d3ded486f46ad85c7eff77ffaf4890e9b2586a9835a726c6ccca9ea8c5af6c4e371239e4f35499df3f3f34824e2606f462d75908ef7f6f6e8e0f9618c3aed763b9d4ed399762223d6cd51a4663a05cc30461db41ee3e3e3ce5e7214182392f2f6f6369d026698a1ce8f1f3f5001b8c11b05463a35357579794927821366a8737878e8807b0edda3169e6c364b27821366a8b3bcbcfc06ef4fb1627878787676f6f1f191ce051b0c50a75eaf63f5c654d2d97534186f381c3e3b3ba3d3c10603d42997cbc160d03dd94a81f17abdde7c3e4fa7830d06a893c9643c1e8fdbd419b5169eb9b9b9e7e7673a233ce0ae4eabd59a9999715bb65260d4d168f4fafa9a4e0a0fb8ab737e7e1e0a85dca90ef35b5adcd5c9e57248f92ecc560a9c33e9749a4e0a0fb8abe3c84773bae7c3870fd3d3d33cdf16e5ae0e26ce9dd94aa1ca9dabab2b3a2f0c60adcee3e3a30bafe8fc0ec68e528fe71619acd5f9f6ed1bce3937ab83641d0c060f0f0fe9d43080b53ae84bc3e1b0cbd5f1f97cbbbbbb746a18c05a9db3b3b38989093797c923d67b36994c864e0d0358abe3ce5b10040c7f6161814e0d0358ab737070e0f7fb5dae0efaf3442241a78601acd5c9e7f36ebe1ea8505b1a3c3d3dd1d91934acd5d9dede1675a04e2c1663b89f016b75d05938f56dbdee41c28ac7e388139d9d41c35a1d67ec656113a8934c26e9d43080b53ac7c7c72e790be29f595a5aa253c300d6eaa8272edcacce88f57cfbe6e6269d1a06b056e7e6e646ae26fbfd7e9e2f83b256e7fbf7ef720f0b29bb542ad1a961006b759acda6dc3967fb5e046b753af2bc0ee3c793b9ab63ca1eec7d029d792c16637829b9c35f1d54882ebf2ab8b2b242278507dcd571f3233b238c9ff3eaf0570718ba8fbf7d90add025b0dde1cb0075b2d9ac3b6f82b27d524761803aee7c56505d0c2c140a743ad860803acd66d3852d3ac61b894438efce64803a606d6dededbf363d5886adbd0a183e6bf18219ea94cbe54020e09e856784fd0e291d53d4797a7a42c1e89e8dbd7092a0b762be89a919ea804aa5120c06ddb0f018b1e4740c52e7f9f959553c8e6fb5d473ecdfbe7da353c00c63d4e9b8e3cab2eac9f7f7f7e9e0f961923a1deb1d09c77f23028d15cf5d510886a9f3fdfb7707efbd8d05158d64b158a4c3668961ea74ac57427d3e9f23d3164e89743add6c36e99859629e3a98d9656b076e87ad3dc3d6563a3c1f08fc23e6a9d3b1d2562291a0736f32f0064be9a74f9fd86e75fb778c540754ab55c7ec6c8a51a84fd198f5bd6a53d5019f3f7f7640d183b48be48b14ccf973107fc4607570e85b5b5ba6f7ea38f8643289144c87c71e83d5010f0f0f4b4b4b2a0034262630343434353555abd5e8c04cc06c753ad656950b0b0b50c7accc850356cf8ff2dcd8b61b8c5707dcdfdf6f6e6e2273211834442c81e5a86f603ccf17acbac409ea74aca732d0d9a26a460aa0816206fcc67166b3d97abd4e8761140e5147512a95a6a7a7472c68c47800b383c1202c37ab0fff238e52a763dd5d570f85712b7d94cdb158ac5c2e1b74ddef1f709a3a1deb5af3fafaba2a7d982c3f586c60f3e2e2a2b945f1df71a03aa0d1681c1c1c241209046cb0b5b3faede8a4767676f83fbdf52a9ca98ea256abe5723984ed25846fc9b045281442f787c5e627e3771bf470b23aa0dd6e5f5e5e6e6c6ca88de5dea60052d76cfc7effcacacae9e929cf7d2aece3707514cd66b352a92c2f2f0702810f16fd70481983b2c6ebf5cecfcf178b45869b1df71057a8a34001747c7c8c150835d0f8f838ec4198f1a7cd525afd1cb5ccccccccacadad419abbbb3bfaeb1d878bd45160c0a881e010caa0542a158944a0cefbf7ef5f562325d31f7d52290fa8ff18ff17fe3e3131914c26b7b6b64aa5126a1a075cb0e912d7a9f33bf57a1db5c8dede1e8a12a498783c3e393909157c3edfa8d551438e210b65091afe603008dbb0bacccdcd2103e6f3f9939313b6fb98f41557abf302aa6974ced7d7d7e7e7e758909071e0d3f6f6f6fafa3afc8058e892d05da3e12f97cbb00da53774716afddb25a2cebf8012db3d39e855883a8226a28ea089a8236822ea089a18a9cef3f333ba9ba6b3c088ccbacfc55a1df4cc777777575757d56a152d31dae652a9840e797777776b6b6bd3596044f97cbe50281c1e1e1e1d1d552a95af5fbf5e5e5edededef2dcbd80a33a68866bb5da972f5f3095f3f3f3b1582c12890402018fc7333434f41f8bf70e450d6d7474d4e7f38542a1a9a9a94422b1b6b6069f2e2e2e5839c4481d2cda38c3604c2e974b269310e5fd6ff707fedfcd0147a206fb72d343cd43341a85435874e150bd5e1ff8a3862cd469341a27272758b46767675f8c718f285d028dd4cc600d5e5a5a426ac399869c4e67f3ad18b03a0f0f0f676767ababab5eaf57dd7f1663fe95e15ff7fc676666f6f7f7510e0e64051a983a484fa80133994c30181463f450f386e48e2cf6f6af1e0f401d74a1d7d7d7dbdbdb2803551d43a744780dead5b3743a5d2e9791fae974f78db756073dc2cececee4e4a448d34346ac0714c7c6c6565656aeaeaede267fbda93af7f7f7286bd438e9e805dba8a60ca7253af966ff77957b3b757036241209d566d3410bbd03338c9e239bcdf63b79bd853a68208f8e8ed4e3c074a0421f50e7271af8be3e22dd7775d07ea381546b291da2d037d484a37befdf661afd55073f7d63634392d4a0404d89c5be4f9f29e9af3a8542c179bbd49a05263f1289f4e3e6571fd5393d3d156f388028a0eee9f92d8b7ea953afd7b1548a371c40143c1ecfeeee6e6faff7f4451d94c6a954ca3d5f3ee38fb2a7542ad150d9a0f7ea3c3d3dadadada9c3a523100607c2813c7071714103a64befd5c1c2a80e941ebbc0804422d1ab92b9c7eadcdcdc0402017abc020f46ac9de137373769d8b4e8a53af859a8e4a5c4e18c4a5b3db9d2d34b752a958a1bbecd693a88d1eaea2a0ddeebe9993aad562b994cca92c31f9cdb3e9fcf7ebddc33750e0e0ee402a02960e1416961f3324f6fd4797878989c9ca407287065c4fa94fae9e9290de46be88d3ab95c4e529559205ea9548a06f235f4401dac7bd168941e9ac01b55f1d8d902bc07ea54abd5b1b1317a68027b90b37677776938bba607eae4f37951c74490b36667676938bba607eac4e37129744c0439cbeff76b7f03d0ae3a8d4603eb9ef4e48682d8edededd1a076875d75fefaeb2fc956e6622767d95567717151b295b9a89ca5f73d40bbea8c8f8fd3c3118c0239ebf0f090c6b50b6ca9f3f8f8a8363617cc05f5c6cece0e0d6d17d852e7f6f616ced263118cc2e3f16432191ada2eb0a5cee9e9a9a8633a5007052b0d6d17d852a7582c4a7b653ada4d962d75b2d92c9ca5c7229846341aa5a1ed025bea2c2f2f4b676e3ae8cf83c1200d6d17d852070b9da8633a4a1d8dfd786ca9130a85e88108a60175028180c65684b6d4918b3a0e405d50d67847c2963af895f44004d3d0be7f2eeab81d5147d044d411341175044d441d41135147d044d411341175044d441d41135147d06430eac83d2c0730987b58b26da00350ea687c88c4963a0b0b0b6a3b26c168c2e1300d6d17d852e7e2e222168b61edf10bc6120a850a85020d6d17d8524781b50e99b2269806a286d8b55a2d1ad1eee8813a823b1175044d441d41135147d044d411341175044d441d41135147d044d411341175044d441d41135147d044d411341175044d441d41135147d0e4f9f9f9dd4f417825f0a6dd6eff17316b894a34e7e1a30000000049454e44ae426082, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas_estagio`
--

DROP TABLE IF EXISTS `vagas_estagio`;
CREATE TABLE IF NOT EXISTS `vagas_estagio` (
  `pk_id` int NOT NULL AUTO_INCREMENT,
  `data_publicacao` date NOT NULL,
  `titulo_vaga` varchar(150) NOT NULL,
  `empresa_concedente` varchar(150) NOT NULL,
  `contato` varchar(150) NOT NULL,
  `descricao` text,
  `fk_curso_vagas_estagio_pk_id` int NOT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `pk_id` (`pk_id`),
  KEY `fk_curso_vagas_estagio_pk_id_idx` (`fk_curso_vagas_estagio_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Truncar tabela antes do insert `vagas_estagio`
--

TRUNCATE TABLE `vagas_estagio`;
--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atividade_programada`
--
ALTER TABLE `atividade_programada`
  ADD CONSTRAINT `fk_equivalencia_estagio_atividade_programada_pk_id` FOREIGN KEY (`fk_equivalencia_estagio_atividade_programada_pk_id`) REFERENCES `equivalencia_estagio` (`pk_id`),
  ADD CONSTRAINT `fk_estagio_supervisionado_atividade_programada_pk_id` FOREIGN KEY (`fk_estagio_supervisionado_atividade_programada_pk_id`) REFERENCES `estagio_supervisionado` (`pk_id`);

--
-- Limitadores para a tabela `coordenador_curso`
--
ALTER TABLE `coordenador_curso`
  ADD CONSTRAINT `fk_usuario_coordenador_curso_pk_id` FOREIGN KEY (`fk_usuario_coordenador_curso_pk_id`) REFERENCES `usuario` (`pk_id`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_coordenador_curso_pk_id` FOREIGN KEY (`fk_coordenador_curso_pk_id`) REFERENCES `coordenador_curso` (`pk_id`),
  ADD CONSTRAINT `fk_orientador_estagio_pk_id` FOREIGN KEY (`fk_orientador_estagio_pk_id`) REFERENCES `orientador_estagio` (`pk_id`);

--
-- Limitadores para a tabela `diretor_academico`
--
ALTER TABLE `diretor_academico`
  ADD CONSTRAINT `fk_usuario_diretor_academico_pk_id` FOREIGN KEY (`fk_usuario_diretor_academico_pk_id`) REFERENCES `usuario` (`pk_id`);

--
-- Limitadores para a tabela `diretor_geral`
--
ALTER TABLE `diretor_geral`
  ADD CONSTRAINT `fk_usuario_diretor_geral_pk_id` FOREIGN KEY (`fk_usuario_diretor_geral_pk_id`) REFERENCES `usuario` (`pk_id`);

--
-- Limitadores para a tabela `discente`
--
ALTER TABLE `discente`
  ADD CONSTRAINT `fk_usuario_discente_pk_id` FOREIGN KEY (`fk_usuario_discente_pk_id`) REFERENCES `usuario` (`pk_id`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `fk_curso_disciplina_pk_id` FOREIGN KEY (`fk_curso_disciplina_pk_id`) REFERENCES `curso` (`pk_id`);

--
-- Limitadores para a tabela `equivalencia_estagio`
--
ALTER TABLE `equivalencia_estagio`
  ADD CONSTRAINT `fk_discente_equivalencia_estagio_pk_id` FOREIGN KEY (`fk_discente_equivalencia_estagio_pk_id`) REFERENCES `discente` (`pk_id`),
  ADD CONSTRAINT `fk_instituicao_concedente_equivalencia_estagio_pk_id` FOREIGN KEY (`fk_instituicao_concedente_equivalencia_estagio_pk_id`) REFERENCES `instituicao_concedente` (`pk_id`);

--
-- Limitadores para a tabela `equivalencia_estagio_entregue`
--
ALTER TABLE `equivalencia_estagio_entregue`
  ADD CONSTRAINT `fk_discente_equivalencia_estagio_entregue_pk_id` FOREIGN KEY (`fk_discente_equivalencia_estagio_entregue_pk_id`) REFERENCES `discente` (`pk_id`),
  ADD CONSTRAINT `fk_orientador_estagio_equivalencia_estagio_entregue_pk_id` FOREIGN KEY (`fk_orientador_estagio_equivalencia_estagio_entregue_pk_id`) REFERENCES `orientador_estagio` (`pk_id`),
  ADD CONSTRAINT `fk_protocolo_equivalencia_estagio_entregue_pk_id` FOREIGN KEY (`fk_protocolo_equivalencia_estagio_entregue_pk_id`) REFERENCES `protocolo_estagio_entregue` (`pk_id`);

--
-- Limitadores para a tabela `estagio_supervisionado`
--
ALTER TABLE `estagio_supervisionado`
  ADD CONSTRAINT `fk_discente_estagio_supervisionado_pk_id` FOREIGN KEY (`fk_discente_estagio_supervisionado_pk_id`) REFERENCES `discente` (`pk_id`),
  ADD CONSTRAINT `fk_instituicao_concedente_estagio_supervisionado_pk_id` FOREIGN KEY (`fk_instituicao_concedente_estagio_supervisionado_pk_id`) REFERENCES `instituicao_concedente` (`pk_id`),
  ADD CONSTRAINT `fk_seguro_estagio_supervisionado_pk_id` FOREIGN KEY (`fk_seguro_estagio_supervisionado_pk_id`) REFERENCES `seguro_estagio` (`pk_id`),
  ADD CONSTRAINT `fk_supervisao_estagio_supervisionado_pk_id` FOREIGN KEY (`fk_supervisao_estagio_supervisionado_pk_id`) REFERENCES `supervisao_estagio` (`pk_id`),
  ADD CONSTRAINT `fk_termo_entregue_estagio_supervisionado_pk_id` FOREIGN KEY (`fk_termo_entregue_estagio_supervisionado_pk_id`) REFERENCES `termo_entregue` (`pk_id`);

--
-- Limitadores para a tabela `estagio_supervisionado_entregue`
--
ALTER TABLE `estagio_supervisionado_entregue`
  ADD CONSTRAINT `fk_coordenador_estagio_supervisionado_entregue_pk_id` FOREIGN KEY (`fk_coordenador_estagio_supervisionado_entregue_pk_id`) REFERENCES `coordenador_curso` (`pk_id`),
  ADD CONSTRAINT `fk_diretor_geral_estagio_supervisionado_entregue_pk_id` FOREIGN KEY (`fk_diretor_geral_estagio_supervisionado_entregue_pk_id`) REFERENCES `diretor_geral` (`pk_id`),
  ADD CONSTRAINT `fk_discente_estagio_supervisionado_entregue_pk_id` FOREIGN KEY (`fk_discente_estagio_supervisionado_entregue_pk_id`) REFERENCES `discente` (`pk_id`),
  ADD CONSTRAINT `fk_orientador_estagio_supervisionado_entregue_pk_id` FOREIGN KEY (`fk_orientador_estagio_supervisionado_entregue_pk_id`) REFERENCES `orientador_estagio` (`pk_id`),
  ADD CONSTRAINT `fk_protocolo_estagio_supervisionado_entregue_pk_id` FOREIGN KEY (`fk_protocolo_estagio_supervisionado_entregue_pk_id`) REFERENCES `protocolo_estagio_entregue` (`pk_id`);

--
-- Limitadores para a tabela `horario_plantao`
--
ALTER TABLE `horario_plantao`
  ADD CONSTRAINT `fk_horario_plantao_orientador_estagio_pk_id` FOREIGN KEY (`fk_horario_plantao_orientador_estagio_pk_id`) REFERENCES `orientador_estagio` (`pk_id`);

--
-- Limitadores para a tabela `instituicao_concedente`
--
ALTER TABLE `instituicao_concedente`
  ADD CONSTRAINT `fk_contato_instituicao_concedente_pk_id` FOREIGN KEY (`fk_contato_instituicao_concedente_pk_id`) REFERENCES `contato` (`pk_id`),
  ADD CONSTRAINT `fk_endereco_instituicao_concedente_pk_id` FOREIGN KEY (`fk_endereco_instituicao_concedente_pk_id`) REFERENCES `endereco` (`pk_id`);

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_curso_matricula_pk_id` FOREIGN KEY (`fk_curso_matricula_pk_id`) REFERENCES `curso` (`pk_id`),
  ADD CONSTRAINT `fk_discente_matricula_pk_id` FOREIGN KEY (`fk_discente_matricula_pk_id`) REFERENCES `discente` (`pk_id`);

--
-- Limitadores para a tabela `orientador_estagio`
--
ALTER TABLE `orientador_estagio`
  ADD CONSTRAINT `fk_usuario_estagio_pk_id` FOREIGN KEY (`fk_usuario_orientador_estagio_pk_id`) REFERENCES `usuario` (`pk_id`);

--
-- Limitadores para a tabela `outro_documento_estagio_entregue`
--
ALTER TABLE `outro_documento_estagio_entregue`
  ADD CONSTRAINT `fk_equivalencia_estagio_entregue_pk_id` FOREIGN KEY (`fk_equivalencia_estagio_entregue_pk_id`) REFERENCES `equivalencia_estagio_entregue` (`pk_id`),
  ADD CONSTRAINT `fk_estagio_supervisionado_entregue_pk_id` FOREIGN KEY (`fk_estagio_supervisionado_entregue_pk_id`) REFERENCES `estagio_supervisionado_entregue` (`pk_id`);

--
-- Limitadores para a tabela `protocolo_estagio_entregue`
--
ALTER TABLE `protocolo_estagio_entregue`
  ADD CONSTRAINT `fk_orientador_estagio_protocolo_estagio_entregue` FOREIGN KEY (`fk_orientador_estagio_protocolo_estagio_entregue`) REFERENCES `orientador_estagio` (`pk_id`);

--
-- Limitadores para a tabela `relacao_teoria_pratica`
--
ALTER TABLE `relacao_teoria_pratica`
  ADD CONSTRAINT `fk_atividade_programada_relacao_teoria_pratica_pk_id` FOREIGN KEY (`fk_atividade_programada_relacao_teoria_pratica_pk_id`) REFERENCES `atividade_programada` (`pk_id`),
  ADD CONSTRAINT `fk_disciplina_relacao_teoria_pratica_pk_id` FOREIGN KEY (`fk_disciplina_relacao_teoria_pratica_pk_id`) REFERENCES `disciplina` (`pk_id`);

--
-- Limitadores para a tabela `relatorio_gerado`
--
ALTER TABLE `relatorio_gerado`
  ADD CONSTRAINT `fk_equivalencia_estagio_relatorio_gerado_pk_id` FOREIGN KEY (`fk_equivalencia_estagio_relatorio_gerado_pk_id`) REFERENCES `equivalencia_estagio` (`pk_id`),
  ADD CONSTRAINT `fk_estagio_supervisionado_relatorio_gerado_pk_id` FOREIGN KEY (`fk_estagio_supervisionado_relatorio_gerado_pk_id`) REFERENCES `estagio_supervisionado` (`pk_id`),
  ADD CONSTRAINT `fk_modelo_relatorio_gerado_pk_id` FOREIGN KEY (`fk_modelo_relatorio_gerado_pk_id`) REFERENCES `modelo_relatorio_estagio` (`pk_id`);

--
-- Limitadores para a tabela `termo_entregue`
--
ALTER TABLE `termo_entregue`
  ADD CONSTRAINT `fk_curso_termo_entregue_pk_id` FOREIGN KEY (`fk_curso_termo_entregue_pk_id`) REFERENCES `curso` (`pk_id`),
  ADD CONSTRAINT `fk_diretor_termo_entregue_pk_id` FOREIGN KEY (`fk_diretor_termo_entregue_pk_id`) REFERENCES `diretor_geral` (`pk_id`),
  ADD CONSTRAINT `fk_matricula_termo_entregue_pk_id` FOREIGN KEY (`fk_matricula_termo_entregue_pk_id`) REFERENCES `matricula` (`pk_id`),
  ADD CONSTRAINT `fk_modelo_termo_entregue_pk_id` FOREIGN KEY (`fk_modelo_termo_entregue_pk_id`) REFERENCES `modelo_termo_compromisso` (`pk_id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_contato_pk_id` FOREIGN KEY (`fk_contato_pk_id`) REFERENCES `contato` (`pk_id`),
  ADD CONSTRAINT `fk_documentos_pessoais_pk_id` FOREIGN KEY (`fk_documentos_pessoais_pk_id`) REFERENCES `documentos_pessoais` (`pk_id`),
  ADD CONSTRAINT `fk_endereco_usuario_pk_id` FOREIGN KEY (`fk_endereco_usuario_pk_id`) REFERENCES `endereco` (`pk_id`),
  ADD CONSTRAINT `fk_login_pk_id` FOREIGN KEY (`fk_login_pk_id`) REFERENCES `login` (`pk_id`),
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_documentos_pessoais_pk_id`) REFERENCES `documentos_pessoais` (`pk_id`);

--
-- Limitadores para a tabela `vagas_estagio`
--
ALTER TABLE `vagas_estagio`
  ADD CONSTRAINT `fk_curso_vagas_estagio_pk_id` FOREIGN KEY (`fk_curso_vagas_estagio_pk_id`) REFERENCES `curso` (`pk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
