
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    base_salary NUMERIC(10, 2) NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_category TEXT NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL
);

INSERT INTO employees (full_name, base_salary) VALUES
('Kenesov Nurkhan', 5500.00),
('Tursynbaev Bakdaulet', 6200.75),
('Kenesov Daryn', 4700.30);

INSERT INTO products (product_name, product_category, unit_price) VALUES
('Smartphone', 'Gadgets', 800.00),
('Wireless Earbuds', 'Gadgets', 120.00),
('Office Chair', 'Furniture', 250.00),
('Floor Lamp', 'Furniture', 70.00),
('Keyboard', 'Gadgets', 45.00);

-- 1.
create or replace function add_fifteen(val integer)
returns integer as $$
    begin
        return val + 15;
    end;
$$ language plpgsql;

select add_fifteen(25);

-- 2.
create or replace function evaluate_numbers(a integer, b integer)
returns text as $$
    begin
    if a > b then
        return 'Above';
    elseif a = b then
        return 'Match';
    else
        return 'Below';
    end if;
    end;
$$ language plpgsql;

select evaluate_numbers(15, 10);
select evaluate_numbers(10, 10);
select evaluate_numbers(5, 10);

-- 3.
create or replace function generate_sequence(limit_val integer)
returns setof integer as $$
declare
       idx integer;
begin
     for idx in 1..limit_val loop
         return next idx;
     end loop;
     return;
end;
$$ language plpgsql;

select generate_sequence(7);

-- 4.
create or replace function search_employee(emp_name text)
returns table(employee_id int, employee_name text, employee_salary numeric) as $$
    begin
        return query
        select id, full_name, base_salary
        from employees
        where full_name ilike emp_name || '%';
    end;
$$ language plpgsql;

select * from search_employee('Nurkhan');

-- 5. 
create or replace function get_products_by_category(cat_name text)
returns table(prod_id int, prod_name text, prod_price numeric) as $$
    begin
        return query
        select id, product_name, unit_price
        from products
        where product_category = cat_name;
    end;
$$ language plpgsql;

select * from get_products_by_category('Furniture');

-- 6a.
create or replace function calculate_bonus(emp_identifier integer)
returns numeric as $$
    declare calculated_bonus numeric;
    begin
        select base_salary * 0.15 into calculated_bonus
        from employees
        where id = emp_identifier;
        return calculated_bonus;
    end;
$$ language plpgsql;

-- 6b. 
create or replace function apply_bonus_to_salary(emp_identifier integer)
returns void as $$
    declare bonus_amount numeric;
    begin
        bonus_amount := calculate_bonus(emp_identifier);
        update employees 
        set base_salary = base_salary + bonus_amount 
        where id = emp_identifier;
    end;
$$ language plpgsql;

select calculate_bonus(2);
select apply_bonus_to_salary(2);

-- 7. 
create or replace function perform_combination_calculation(input_num integer, input_text text)
returns text as $$
declare
    numeric_result integer;
    text_result text;
begin
    begin
        numeric_result := (input_num * 3) - 7;
    end;

    begin
        text_result := 'Modified: ' || lower(input_text);
    end;

    return 'Num Result: ' || numeric_result || ', Text Result: ' || text_result;
end;
$$ language plpgsql;

select perform_combination_calculation(4, 'WORLD');
