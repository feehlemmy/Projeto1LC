CREATE DATABASE locare_v2 WITH ENCODING = 'UTF8';

\connect locare_v2

CREATE TABLE pessoa(
    id serial PRIMARY KEY NOT NULL,
	email character varying(50) UNIQUE NOT NULL,
    senha character varying(30) NOT NULL,
    cpf character varying(15) UNIQUE,
    nome character varying(80) NOT NULL,
    endereco character varying(100),
    cep character varying(10),
    cidade character varying(50),
    estado character varying(50),
    telefone character varying(15),
    data_nascimento character varying(12),
    conta_confirmada boolean DEFAULT('FALSE'),
    security_key character varying(9) NOT NULL,
    foto character varying(100)
);

CREATE TABLE contratante(
    pessoa_id_contratante integer PRIMARY KEY NOT NULL,
    saldo DOUBLE PRECISION,
    numero_cartao character varying(20)
);

ALTER TABLE contratante ADD CONSTRAINT fk_pessoa_id_contratante FOREIGN KEY (pessoa_id_contratante) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE profissional(
    pessoa_id_profissional integer PRIMARY KEY NOT NULL,
    numero_registro character varying(20) NOT NULL,
    uf_registro character varying(2) NOT NULL,
    data_formacao character varying(12) NOT NULL,
    formacao character varying(30) NOT NULL,
    saldo DOUBLE PRECISION,
    avaliacao text
);

ALTER TABLE profissional ADD CONSTRAINT fk_pessoa_id_profissional FOREIGN KEY (pessoa_id_profissional) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE solicitacao_orcamento(
    id serial PRIMARY KEY NOT NULL,
    id_contratante integer NOT NULL,
    id_profissional integer NOT NULL,
    data_inicio_atendimento character varying(12) NOT NULL,
    data_fim_atendimento character varying(12),
    horario_inicio_atendimento character varying(5) NOT NULL,
    tempo_atendimento character varying(10) NOT NULL,
    descricao_atendimento text NOT NULL,
	valor_atendimento DOUBLE PRECISION,
    status_atual character varying(10) DEFAULT('SOLICITADO') NOT NULL
);

ALTER TABLE solicitacao_orcamento ADD CONSTRAINT fk_contratante_id FOREIGN KEY (id_contratante) REFERENCES contratante(pessoa_id_contratante) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE solicitacao_orcamento ADD CONSTRAINT fk_profissional_id FOREIGN KEY (id_profissional) REFERENCES profissional(pessoa_id_profissional) ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE servico(
    id serial PRIMARY KEY NOT NULL,
    id_solicitacao_orcamento integer NOT NULL,
    status_servico character varying(10) DEFAULT('AGENDADO') NOT NULL,
    avaliacao_servico text
);

ALTER TABLE servico ADD CONSTRAINT fk_id_solicitacao_orcamento FOREIGN KEY (id_solicitacao_orcamento) REFERENCES solicitacao_orcamento(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE mensagem(
    id serial PRIMARY KEY NOT NULL,
    id_servico integer NOT NULL,
    mensagem character varying(300) NOT NULL
);

ALTER TABLE mensagem ADD CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id) ON UPDATE CASCADE ON DELETE NO ACTION;

CREATE TABLE pagamento(
    id serial PRIMARY KEY NOT NULL,
    id_servico integer UNIQUE NOT NULL,
    metodo_pagamento character varying(6) NOT NULL,
    data_pagamento character varying(12) NOT NULL
);

ALTER TABLE pagamento ADD CONSTRAINT fk_id_servico_pagamento FOREIGN KEY (id_servico) REFERENCES servico(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE cartao(
    numero character varying(20) PRIMARY KEY NOT NULL,
    codigo_seguranca character varying(3) NOT NULL,
    bandeira character varying(20) NOT NULL
);