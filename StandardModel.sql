-- Таблица для хранения информации о частицах
CREATE TABLE particles (
	particle_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name TEXT NOT NULL,
  	symbol TEXT NOT NULL,
  	mass REAL NOT NULL,
  	spin REAL NOT NULL,
  	charge REAL NOT NULL,
  	type TEXT CHECK(type IN ('Fermion', 'Boson'))
);

-- Таблица для хранения информации о взаимодействиях
CREATE TABLE interactions (
	interaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name TEXT NOT NULL,
  	description TEXT
);

-- Таблица для связи частиц и взаимодействий
CREATE TABLE particle_interactions (
  	particle_id INTEGER,
  	interaction_id INTEGER,
  	FOREIGN KEY (particle_id) REFERENCES particles(particle_id),
  	FOREIGN KEY (interaction_id) REFERENCES interactions(interaction_id)
);

-- Таблица для хранения информации о гравитонах
CREATE TABLE gravitons (
  	graviton_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name TEXT NOT NULL,
  	symbol TEXT NOT NULL,
  	mass REAL NOT NULL,
  	spin REAL NOT NULL,
  	charge REAL NOT NULL,
  	type TEXT CHECK (type = 'Graviton')
);

-- Таблица для связи гравитонов и взаимодействий
CREATE TABLE graviton_interactions (
	graviton_id INTEGER,
  	interaction_id INTEGER,
  	FOREIGN KEY (graviton_id) REFERENCES gravitons(graviton_id),
  	FOREIGN KEY (interaction_id) REFERENCES interactions(interaction_id)
);

-- Пример добавления данных
INSERT INTO particles (name, symbol, mass, spin, charge, type) VALUES
('Electron', 'e-', 0.000511, 0.5, -1, 'Fermion'),
('Photon', 'y', 0, 1, 0, 'Boson');

INSERT INTO interactions (name, description) VALUES
('Electromagnetic Interaction', 'Interaction mediated by photons'),
('Strong Interaction', 'Interaction mediated by gluons'),
('Weak Interaction', 'Interaction mediated by W and Z bosons'),
('Gravitational Interactions', 'Hypothetical interaction mediated by gravitons');

INSERT INTO particle_interactions (particle_id, interaction_id) VALUES
('Graviton', 'G', 0, 2, 0, 'Graviton');

INSERT INTO graviton_interactions (graviton_id, interaction_id) VALUES
(1, 4); -- Graviton mediates gravitational interaction
