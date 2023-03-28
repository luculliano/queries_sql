/*                     table creation queries                     */
create table department (
  department_id integer primary key autoincrement,  /* 'int' not allowed */
  department_name varchar(50)
);

create table employees (
  employees_id integer primary key autoincrement,
  first_name varchar(50),
  last_name varchar(50),
  department_id int not null,
  foreign key (department_id) references department (department_id)
);


/*                     inserts queries                     */
insert into department (department_name)
  values ('prod'), ('commerce'), ('govern');

insert into employees (first_name, last_name, department_id)
  values ('Nick', 'Love', 1), ('Sam', 'Rock', 2),
  ('Llama', 'Howard', 1), ('Nine', 'Aone', 1), ('Rok', 'Joma', 4);


/*                     joins                     */

/* inner join берет поля из в обеих таблиц, значения которых совпадают. */
/* Если пары не нашлось для записей, он их не выведет. */
SELECT first_name, last_name, department_name FROM employees
  JOIN department USING (department_id)
  ORDER BY first_name ASC;  /* asc as default order */

/* left join отличается тем что если для второй таблицы пары не нашлось - добавит null */
/* right join соответственно наоборот */
SELECT first_name, last_name, department_name FROM employees
  LEFT JOIN department USING (department_id)
  ORDER BY first_name ASC;  /* asc as default order */


/*                     alter                     */

/* drop column */
ALTER TABLE department
DROP COLUMN department_name;

/* drop data in table/table */
DELETE FROM department  /* VACUUM; to clean size */
WHERE department_id=10;  /* without whis drops all */
