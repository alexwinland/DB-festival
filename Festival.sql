CREATE TABLE artist (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE show (
  id INTEGER PRIMARY KEY,
  artist_id INTEGER NOT NULL,
  date_time DATETIME NOT NULL,
  stage TEXT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist (id)
);

CREATE TABLE ticket (
  id INTEGER PRIMARY KEY,
  show_id INTEGER NOT NULL,
  price REAL NOT NULL,
  type TEXT NOT NULL,
  FOREIGN KEY (show_id) REFERENCES show (id)
);

CREATE TABLE customer (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE purchase (
  id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  ticket_id INTEGER NOT NULL,
  purchase_date DATETIME NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (id),
  FOREIGN KEY (ticket_id) REFERENCES ticket (id)
);
INSERT INTO artist (id, name) VALUES
(1, 'Coldplay'),
(2, 'Foo Fighters'),
(3, 'Radiohead');

INSERT INTO show (id, artist_id, date_time, stage) VALUES
(1, 1, '2023-07-15 20:00:00', 'Main Stage'),
(2, 2, '2023-07-15 22:00:00', 'Main Stage'),
(3, 3, '2023-07-16 20:30:00', 'Second Stage'),
(4, 1, '2023-07-16 22:00:00', 'Main Stage'),
(5, 2, '2023-07-17 20:30:00', 'Main Stage'),
(6, 3, '2023-07-17 22:00:00', 'Main Stage');

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

INSERT INTO customer (id, name, email) VALUES
(1, 'Ana Silva', 'ana.silva@gmail.com'),
(2, 'João Oliveira', 'joao.oliveira@hotmail.com'),
(3, 'Maria Santos', 'maria.santos@yahoo.com');

INSERT INTO purchase (id, customer_id, ticket_id, purchase_date) VALUES
(1, 1, 1, '2023-06-15 15:00:00'),
(2, 2, 3, '2023-06-15 16:00:00'),
(3, 3, 5, '2023-06-16 10:30:00'),
(4, 1, 9, '2023-06-17 14:00:00'),
(5, 2, 12, '2023-06-17 16:30:00');