# Sistema de Gestão de Shows e Vendas de Ingressos

Este sistema foi projetado para gerenciar shows, artistas, ingressos e compras realizadas por clientes. Ele permite registrar informações sobre os artistas, os shows realizados, os ingressos disponíveis para cada show, os clientes e suas respectivas compras.

## Estrutura do Banco de Dados

O banco de dados é composto por 5 tabelas principais:

### 1. **Tabela de Artistas (`artist`)**
Esta tabela armazena as informações dos artistas que se apresentam nos shows.

- **id**: Identificador único do artista (chave primária).
- **name**: Nome do artista ou banda.

### 2. **Tabela de Shows (`show`)**
Esta tabela armazena informações sobre os shows realizados pelos artistas, incluindo a data, o horário e o palco onde o show será realizado.

- **id**: Identificador único do show (chave primária).
- **artist_id**: Relacionamento com o artista que se apresenta no show (chave estrangeira referenciando a tabela `artist`).
- **date_time**: Data e hora do show.
- **stage**: Nome do palco onde o show será realizado.

### 3. **Tabela de Ingressos (`ticket`)**
Esta tabela armazena os ingressos disponíveis para cada show, incluindo o preço e o tipo de ingresso (ex.: VIP ou Regular).

- **id**: Identificador único do ingresso (chave primária).
- **show_id**: Relacionamento com o show associado a esse ingresso (chave estrangeira referenciando a tabela `show`).
- **price**: Preço do ingresso.
- **type**: Tipo de ingresso (ex.: VIP, Regular).

### 4. **Tabela de Clientes (`customer`)**
Esta tabela armazena informações sobre os clientes que compram ingressos para os shows.

- **id**: Identificador único do cliente (chave primária).
- **name**: Nome do cliente.
- **email**: E-mail do cliente.

### 5. **Tabela de Compras (`purchase`)**
Esta tabela armazena informações sobre as compras feitas pelos clientes, incluindo o cliente, o ingresso adquirido e a data da compra.

- **id**: Identificador único da compra (chave primária).
- **customer_id**: Relacionamento com o cliente que fez a compra (chave estrangeira referenciando a tabela `customer`).
- **ticket_id**: Relacionamento com o ingresso comprado (chave estrangeira referenciando a tabela `ticket`).
- **purchase_date**: Data e hora da compra.

## Funcionalidades

### 1. **Cadastro de Artistas**
A tabela de artistas permite o registro de artistas ou bandas que realizarão shows. Cada artista recebe um identificador único (`id`) e seu nome é armazenado.

### 2. **Cadastro de Shows**
Os shows são registrados com informações sobre o artista, data, hora e palco. Cada show é associado a um artista específico, criando um relacionamento entre as tabelas `show` e `artist`.

### 3. **Cadastro de Ingressos**
Ingressos são cadastrados para cada show com diferentes tipos (por exemplo, VIP ou Regular). O preço de cada ingresso é registrado, assim como o tipo de ingresso disponível para venda.

### 4. **Cadastro de Clientes**
Informações sobre os clientes, como nome e e-mail, são registradas para poder associá-los às compras realizadas.

### 5. **Registro de Compras de Ingressos**
As compras feitas pelos clientes são registradas na tabela `purchase`. Cada compra é associada a um cliente e a um ingresso específico, com a data e hora da compra.

### 6. **Consulta e Acompanhamento de Shows e Compras**
O sistema permite consultar os shows programados, os ingressos disponíveis para cada show e as compras feitas pelos clientes, facilitando o gerenciamento de eventos e vendas.

## Exemplo de Uso

### Inserindo Artistas

```sql
INSERT INTO artist (id, name) VALUES
(1, 'Coldplay'),
(2, 'Foo Fighters'),
(3, 'Radiohead');
```

### Inserindo Shows

```sql
INSERT INTO show (id, artist_id, date_time, stage) VALUES
(1, 1, '2023-07-15 20:00:00', 'Main Stage'),
(2, 2, '2023-07-15 22:00:00', 'Main Stage'),
(3, 3, '2023-07-16 20:30:00', 'Second Stage'),
(4, 1, '2023-07-16 22:00:00', 'Main Stage'),
(5, 2, '2023-07-17 20:30:00', 'Main Stage'),
(6, 3, '2023-07-17 22:00:00', 'Main Stage');
```

### Inserindo Ingressos

```sql
INSERT INTO ticket (id, show_id, price, type) VALUES
(1, 1, 250.0, 'VIP'),
(2, 1, 120.0, 'Regular'),
(3, 2, 300.0, 'VIP'),
(4, 2, 150.0, 'Regular'),
(5, 3, 200.0, 'VIP'),
(6, 3, 100.0, 'Regular'),
(7, 4, 250.0, 'VIP'),
(8, 4, 120.0, 'Regular'),
(9, 5, 300.0, 'VIP'),
(10, 5, 150.0, 'Regular'),
(11, 6, 200.0, 'VIP'),
(12, 6, 100.0, 'Regular');
```

### Inserindo Clientes

```sql
INSERT INTO customer (id, name, email) VALUES
(1, 'Ana Silva', 'ana.silva@gmail.com'),
(2, 'João Oliveira', 'joao.oliveira@hotmail.com'),
(3, 'Maria Santos', 'maria.santos@yahoo.com');
```

### Registrando Compras

```sql
INSERT INTO purchase (id, customer_id, ticket_id, purchase_date) VALUES
(1, 1, 1, '2023-06-15 15:00:00'),
(2, 2, 3, '2023-06-15 16:00:00'),
(3, 3, 5, '2023-06-16 10:30:00'),
(4, 1, 9, '2023-06-17 14:00:00'),
(5, 2, 12, '2023-06-17 16:30:00');
```

## Como Funciona

### 1. **Cadastro de Artistas**
Os artistas (ou bandas) são cadastrados, permitindo que os shows sejam atribuídos a eles posteriormente. Isso cria um relacionamento entre shows e artistas.

### 2. **Cadastro de Shows**
Para cada show, são registradas informações como o artista, data e hora do evento, e o palco onde ele ocorrerá. Isso cria um vínculo entre os shows e os ingressos vendidos para esses eventos.

### 3. **Cadastro de Ingressos**
Ingressos de diferentes tipos (VIP e Regular) são associados a um show específico. Cada ingresso tem um preço, que pode variar de acordo com o tipo.

### 4. **Cadastro de Clientes**
Clientes são cadastrados para que possam realizar compras de ingressos para os shows. As informações dos clientes incluem nome e e-mail.

### 5. **Registro de Compras**
Quando um cliente compra um ingresso, as informações sobre a compra (cliente, ingresso, data e hora da compra) são registradas na tabela `purchase`. Isso permite o acompanhamento de todas as transações realizadas.

## Conclusão

Este sistema de banco de dados para gestão de shows e vendas de ingressos oferece uma solução completa para eventos musicais. Ele permite registrar informações sobre artistas, shows, ingressos, clientes e compras, além de possibilitar consultas eficientes para gerenciamento de vendas e eventos. Ideal para gerenciar desde pequenos eventos até grandes festivais.
