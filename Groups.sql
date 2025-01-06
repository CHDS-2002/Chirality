-- Создаем таблицу для хранения групп
CREATE TABLE groups (
	group_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name TEXT NOT NULL,
  	order_of_group INTEGER NOT NULL
);

-- Создаем таблицу для хранения элементов группы
CREATE TABLE elements (
	element_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	group_id INTEGER,
  	VALUE TEXT NOT NULL,
  	FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

-- Создаем таблицу для хранения операций между элементами
CREATE TABLE operations (
	operation_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	first_element_id INTEGER,
  	second_element_id INTEGER,
  	result_element_id INTEGER,
  	FOREIGN KEY (first_element_id) REFERENCES elements(element_id),
  	FOREIGN KEY (second_element_id) REFERENCES elements(element_id),
  	FOREIGN KEY (result_element_id) REFERENCES elements(element_id)
);

-- Пример добавления данных
INSERT INTO groups (name, order_of_group) VALUES ('Z2', 2);
INSERT INTO elements (group_id, VALUE) VALUES (1, '0'), (1, '1');
INSERT INTO operations (first_element_id, second_element_id, result_element_id) VALUES (1, 1, 1), (1, 2, 2), (2, 1, 2), (2, 2, 1);
