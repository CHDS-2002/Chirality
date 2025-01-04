-- Создаем таблицу для хранения групп
CREATE TABLE groups (
	group_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name TEXT NOT NULL,
  	order_of_group INTEGER NOT NULL
);

-- Создаем таблицу для хранения элементов группы
create table elements (
	element_id INTEGER primary key AUTOINCREMENT,
  	group_id INTEGER,
  	value TEXT NOT NULL,
  	FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

-- Создаем таблицу для хранения операций между элементами
create table operations (
	operation_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	first_element_id INTEGER,
  	second_element_id INTEGER,
  	result_element_id INTEGER,
  	FOREIGN KEY (first_element_id) REFERENCES elements(element_id),
  	FOREIGN KEY (second_element_id) REFERENCES elements(element_id),
  	foreign key (result_element_id) references elements(element_id)
);

-- Пример добавления данных
insert into groups (name, order_of_group) VALUES ('Z2', 2);
insert into elements (group_id, value) values (1, '0'), (1, '1');
insert into operations (first_element_id, second_element_id, result_element_id) VALUES (1, 1, 1), (1, 2, 2), (2, 1, 2), (2, 2, 1);