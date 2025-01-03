-- Создаем таблицу molecules
CREATE TABLE molecules (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  formula VARCHAR(255),
  chirality BOOLEAN
);

-- Заполняем таблицу данными
INSERT INTO molecules (id, name, formula, chirality) VALUES
(1, 'Молекула A', 'C6H12O6', true),
(2, 'Молекула B', 'CH4', false),
(3, 'Молекула C', 'C10H16N2O3', true);

-- Получаем все хиральные молекулы
SELECT * FROM molecules WHERE chirality = true;