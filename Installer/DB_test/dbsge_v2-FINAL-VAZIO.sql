-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 25-Jun-2023 às 20:05
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
