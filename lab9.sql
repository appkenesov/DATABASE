-- 1.
create or replace function increase_value(num integer)
returns integer as
$$
begin
    return num + 10;
end;
$$
language plpgsql;

-- 2.
create or replace function compare_numbers(a integer, b integer, out result text)
as $$
begin
    if a > b then
        result := 'Greater';
    elsif a < b then
        result := 'Lesser';
    else
        result := 'Equal';
    end if;
end;
$$
language plpgsql;

-- 3.
create or replace function number_series(n integer)
returns table(series integer) as
$$
begin
    for series in 1..n loop
        return query select series;
    end loop;
end;
$$
language plpgsql;

-- 4.
create or replace function find_employee(name text)
returns table(first_name text, last_name text, salary int) as
$$
begin
    return query select * from employees where first_name = name;
end;
$$
language plpgsql;

-- 5.
create or replace function list_products(given_category text)
returns table(product_id int, name text, category text, price int) as
$$
begin
    return query select * from products where category = given_category;
end;
$$
language plpgsql;

-- 6.
create or replace function calculate_bonus(name text)
returns int as
$$
declare
    bonus int;
begin
    select salary * 0.10 into bonus from employees where first_name = name;
    return bonus;
end;
$$
language plpgsql;

create or replace function update_salary(name text)
returns void as
$$
declare
    bonus int;
begin
    bonus := calculate_bonus(name);
    update employees
    set salary = salary + bonus
    where first_name = name;
end;
$$
language plpgsql;

-- 7.
create or replace function complex_calculation(input_number integer, input_string varchar)
returns varchar as
$$
declare
    result_string varchar;
    result_number integer;
    final_result varchar;
begin
    <<main>>
    begin
        <<work_with_string>>
        declare
            reversed_string varchar;
        begin
            reversed_string := reverse(input_string);
            result_string := 'Reversed_string ' || reversed_string;
        end work_with_string;

        <<work_with_num>>
        declare
            square integer;
        begin
            square := input_number * input_number;
            result_number := square;
        end work_with_num;

        final_result := result_string || ' ;Squared number ' || result_number;
    end main;

    return final_result;
end;
$$
language plpgsql;
