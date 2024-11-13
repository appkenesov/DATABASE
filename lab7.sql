CREATE INDEX idx_countries_name ON countries (name);
CREATE INDEX idx_employees_name_surname ON employees (name, surname);
CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);
CREATE INDEX idx_employees_name_substring ON employees ((substring(name from 1 for 4)));
CREATE INDEX idx_employees_departments_salary_budget ON employees (department_id, salary);
CREATE INDEX idx_departments_budget ON departments (budget);
