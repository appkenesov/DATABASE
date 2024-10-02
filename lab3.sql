CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  department INTEGER NOT NULL,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  city VARCHAR(255)
);

INSERT INTO departments(code, name, budget) 
VALUES(14, 'IT', 65000), 
      (37, 'Accounting', 15000),
      (59, 'Human Resources', 240000),
      (77, 'Research', 55000),
      (45, 'Management', 155000),
      (11, 'Sales', 85000);

INSERT INTO employees(ssn, name, lastname, department, city) 
VALUES(123234877, 'Michael', 'Rogers', 14, 'Almaty'),
      (152934485, 'Anand', 'Manikutty', 14, 'Shymkent'),
      (222364883, 'Carol', 'Smith', 37, 'Astana'),
      (326587417, 'Joe', 'Stevens', 37, 'Almaty'),
      (332154719, 'Mary-Anne', 'Foster', 14, 'Astana'),
      (332569843, 'George', 'ODonnell', 77, 'Astana'),
      (546523478, 'John', 'Doe', 59, 'Shymkent'),
      (631231482, 'David', 'Smith', 77, 'Almaty'),
      (654873219, 'Zacary', 'Efron', 59, 'Almaty'),
      (745685214, 'Eric', 'Goldsmith', 59, 'Atyrau'),
      (845657245, 'Elizabeth', 'Doe', 14, 'Almaty'),
      (845657246, 'Kumar', 'Swamy', 14, 'Almaty');

INSERT INTO customers(name, lastname, city) 
VALUES('John', 'Wills', 'Almaty'),
      ('Garry', 'Foster', 'London'),
      ('Amanda', 'Hills', 'Almaty'),
      ('George', 'Doe', 'Tokyo'),
      ('David', 'Little', 'Almaty'),
      ('Shawn', 'Efron', 'Astana'),
      ('Eric', 'Gomez', 'Shymkent'),
      ('Elizabeth', 'Tailor', 'Almaty'),
      ('Julia', 'Adams', 'Astana');
