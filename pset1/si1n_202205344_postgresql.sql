
--Apagando a database uvv, usuário e esquema para evitar conflitos de duplicados
DROP DATABASE IF EXISTS uvv;
DROP user if exists williamrodrigues;
DROP schema if exists lojas;


--Criando usuário e configurando seus direitos
create user williamrodrigues with
CREATEDB
CREATEROLE
encrypted password 'teste';

--Usando o usuário
SET ROLE williamrodrigues;

-- CRIANDO o Banco de Dados
CREATE database uvv WITH
owner             = williamrodrigues
template          = template0
encoding          = UTF8
LC_collate        = "pt_BR.UTF-8"
LC_CTYPE          = "pt_BR.UTF-8"
ALLOW_CONNECTIONS = true;

--Usando o Bando de Dados UVV
\c uvv
set role williamrodrigues;

SELECT current_user;

Create schema lojas
authorization williamrodrigues;

ALTER USER williamrodrigues;
SET SEARCH_PATH TO lojas, "$user", public;

--Criação da tabela produtos e distribuindo seus atributos
CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                imagem BYTEA,
                detalhes BYTEA,
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                imagem_arquivo VARCHAR(512),
                imagem_meme_type VARCHAR(512),
                CONSTRAINT produtos_pk PRIMARY KEY (produto_id)
);

--Atribuindo Comentários sobre a tabela produtos
COMMENT ON TABLE produtos IS 'tabela produtos';
COMMENT ON COLUMN produtos.produto_id IS 'id do produto comprado';
COMMENT ON COLUMN produtos.nome IS 'nome do produto cadastrado';
COMMENT ON COLUMN produtos.preco_unitario IS 'preço do produto cadastrado';
COMMENT ON COLUMN produtos.imagem IS 'imagem sobre o produto cadastrado';
COMMENT ON COLUMN produtos.detalhes IS 'detalhes contando sobre o produto';
COMMENT ON COLUMN produtos.imagem_charset IS 'imagem sobre o produto';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'ultima atualização da imagem do produto';
COMMENT ON COLUMN produtos.imagem_arquivo IS 'arquivo da imagem do produto';
COMMENT ON COLUMN produtos.imagem_meme_type IS 'imagem do produto meme type';

--Criação da tabela lojas e distribuindo seus atributos
CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                longitude NUMERIC,
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                endereco_fisico VARCHAR(512),
                logo_ultima_atualizacao DATE,
                logo_mime_type VARCHAR(512),
                logo BYTEA,
                latitude NUMERIC,
                CONSTRAINT lojas_pk PRIMARY KEY (loja_id)
);

--Atribuindo comentários sobre a tabela lojas
COMMENT ON TABLE lojas IS 'tabela lojas';
COMMENT ON COLUMN lojas.loja_id IS 'id da loja';
COMMENT ON COLUMN lojas.nome IS 'nome da loja';
COMMENT ON COLUMN lojas.endereco_web IS 'endereço web da loja';
COMMENT ON COLUMN lojas.longitude IS 'longitude em que a loja está';
COMMENT ON COLUMN lojas.logo_arquivo IS 'arquivo da logo da loja';
COMMENT ON COLUMN lojas.logo_charset IS 'charset da logo';
COMMENT ON COLUMN lojas.endereco_fisico IS 'endereço fisico da loja';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'ultima atualização na logo da loja';
COMMENT ON COLUMN lojas.logo_mime_type IS 'logo da loja em mime type';
COMMENT ON COLUMN lojas.logo IS 'logo da loja';
COMMENT ON COLUMN lojas.latitude IS 'latitude em que esta a loja';

--Criação da tabela Estoques e distribuindo seus atributos
CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                CONSTRAINT estoques_pk PRIMARY KEY (estoque_id)
);

--Comentário da tabela Estoques
COMMENT ON TABLE estoques IS 'tabelas estoques';
COMMENT ON COLUMN estoques.estoque_id IS 'ID da tabela Estoques';
COMMENT ON COLUMN estoques.quantidade IS 'Quantidade de Itens armazenados no estoque';
COMMENT ON COLUMN estoques.loja_id IS 'ID de relação da tabela lojas com a tabela estoques';
COMMENT ON COLUMN estoques.produto_id IS 'ID de relação da tabela produtos com a tabela estoques';

--Criação da tabela Clientes e distribuindo seus  atributos
CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                nome VARCHAR(255) NOT NULL,
                telefone3 VARCHAR(20),
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);

--Comentários da tabela Clientes e seus atributos
COMMENT ON TABLE clientes IS 'tabela de clientes';
COMMENT ON COLUMN clientes.cliente_id IS 'id do cliente para o cadastro';
COMMENT ON COLUMN clientes.email IS 'email do cliente para o cadastro';
COMMENT ON COLUMN clientes.telefone1 IS 'email do primeiro telefone para o cadastro';
COMMENT ON COLUMN clientes.telefone2 IS 'email do segundo telefone para o cadastro';
COMMENT ON COLUMN clientes.nome IS 'email do nome para o cadastro';
COMMENT ON COLUMN clientes.telefone3 IS 'email doterceiro telefone para o cadastro';

--Criação da tabela Envios e distribuindo seus atributos
CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT envios_pk PRIMARY KEY (envio_id)
);

--Comentários da tabela Envios e seus atributos
COMMENT ON TABLE envios IS 'tabela envios';
COMMENT ON COLUMN envios.envio_id IS 'id envio';
COMMENT ON COLUMN envios.endereco_entrega IS 'endereço a ser entregue o pedido';
COMMENT ON COLUMN envios.status IS 'status do envio';
COMMENT ON COLUMN envios.cliente_id IS 'id do cliente a receber da tabela clientes';
COMMENT ON COLUMN envios.loja_id IS 'loja que ocorreu a compra, da tabela lojas';

--Criação da tabela Pedidos e distribuindo seus atributos
CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                status VARCHAR(15) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedidos_pk PRIMARY KEY (pedido_id)
);

--Comentários da tabela Pedidos e seus atributos
COMMENT ON TABLE pedidos IS 'tabela pedidos';
COMMENT ON COLUMN pedidos.pedido_id IS 'id do pedido sobre a compra';
COMMENT ON COLUMN pedidos.data_hora IS 'data e hora em que o pedido foi feito';
COMMENT ON COLUMN pedidos.status IS 'status do pedido';
COMMENT ON COLUMN pedidos.cliente_id IS 'qual o id do cliente que fez o pedido da compra da tabela clientes';
COMMENT ON COLUMN pedidos.loja_id IS 'qual loja que foi efetuado o pedido da tabela lojas';

--Criação da tabela Pedidos_itens e distribuindo seus atributos
CREATE TABLE pedidos_itens (
                produto_id NUMERIC(38) NOT NULL,
                pedido_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedidos_itens_pk PRIMARY KEY (produto_id, pedido_id)
);

--Comentários da tabela Pedidos_itens e seus atributos
COMMENT ON TABLE pedidos_itens IS 'tabela pedidos_itens';
COMMENT ON COLUMN pedidos_itens.produto_id IS 'id do item pedido da tabela produtos';
COMMENT ON COLUMN pedidos_itens.pedido_id IS 'id da tabela pedidos';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'numero da linha do pedido';
COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'preço do pedido';
COMMENT ON COLUMN pedidos_itens.quantidade IS 'quantidade comprada do pedido';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'envio do pedido da tabela envios';

--Criação do relacionamento da chave estrangeira entre as tabelas pedidos_itens e produtos
ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas estoques e produtos
ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas pedidos e lojas
ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas envios e lojas
ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas estoques e lojas
ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas pedidos e clientes
ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas envios e clientes
ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas pedidos_itens e envios
ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação do relacionamento da chave estrangeira entre as tabelas pedidos_itens e pedidos
ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da Verificação por meio do Check seguindo o PDF

--Verificação sugerida no PDF a um padrão de input
ALTER TABLE pedidos
ADD CONSTRAINT cc_pedidos_status
CHECK(status='CANCELADO' or status='COMPLETO' or status='ABERTO' or status='PAGO' or status='REEMBOLSADO' or status='ENVIADO')
;

--Verificação sugerida no PDF a um padrão de input
ALTER TABLE envios
ADD CONSTRAINT cc_envios_status
CHECK(status='CRIADO' or status='ENVIADO' or status='TRANSITO' or status='ENTREGUE')
;

--Verificação de preço unitário na tabela produtos não ser negativo
ALTER TABLE produtos
ADD CONSTRAINT cc_produtos_preco_unitario
CHECK (preco_unitario >= 0)
;

--Verificação de preço unitário na tabela pedidos_itens não ser negativo
ALTER TABLE pedidos_itens
ADD CONSTRAINT cc_pedidos_items_preco_unitario
CHECK (preco_unitario >= 0)
;

--Verificação de produto_id não ser negativo
ALTER TABLE produtos
ADD CONSTRAINT cc_produtos_produto_id
CHECK (produto_id > 0)
;

--Verificação de loja_id não ser negativo
ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_loja_id
CHECK (loja_id > 0)
;

--Verificação de estoque_id não ser negativo
ALTER TABLE estoques
ADD CONSTRAINT cc_estoques_estoque_id
CHECK (estoque_id > 0) 
;

--Verificação de cliente_id não ser negativo
ALTER TABLE clientes
ADD CONSTRAINT cc_clientes_cliente_id
CHECK (cliente_id > 0)
;

--Verificação de envio_id não ser negativo
ALTER TABLE envios
ADD CONSTRAINT cc_envios_envio_id
CHECK (envio_id > 0)
;

--Verificação de pedido_id não ser negativo
ALTER TABLE pedidos
ADD CONSTRAINT cc_pedidos_pedido_id
CHECK (pedido_id > 0)
;

ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_endereço_cadastrado
CHECK ((endereço_físico IS NOT NULL) OR (endereço_web IS NOT NULL))
;
