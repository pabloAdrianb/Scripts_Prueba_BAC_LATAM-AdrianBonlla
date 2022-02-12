
-- EJEMPLO 2

-- creacion de empleados
CREATE TABLE employees  
(  
    department_name varchar(150) NOT NULL,
    employee_id int PRIMARY KEY NOT NULL,
	employee_name varchar(150) NOT NULL
);
go

-- insertar en tabla empleados
INSERT INTO employees (department_name,employee_id,employee_name)
VALUES
    ('Sales', 123, 'John Doe'),
    ('Sales', 211, 'Jane Smith'),
    ('HR', 556, 'Billy Bob'),
	('Sales', 711, 'Robert Hayek'),
	('Marketing', 235, 'Edward Jorgson'),
	('Marketing', 236, 'Christine Packard')
go

-- creacion de salario
CREATE TABLE salarios
(  
    salary int NOT NULL,
    employee_id int NOT NULL,
	employee_name varchar(150) NOT NULL,
	CONSTRAINT fk_Employees FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
go

-- insertar en tabla empleados
INSERT INTO salarios (salary,employee_id,employee_name)
VALUES
    (500, 123, 'John Doe'),
    (600, 211, 'Jane Smith'),
    (1000, 556, 'Billy Bob'),
	(400, 711, 'Robert Hayek'),
	(1200, 235, 'Edward Jorgson'),
	(200, 236, 'Christine Packard')
go

-- consulta de departamento con salario menor a $500
CREATE PROCEDURE sp_sal_dep
as
	SELECT e.department_name AS Departament, e.employee_name AS Employee, s.salary AS Salary
	FROM employees e
	INNER JOIN salarios s
	ON e.employee_id = s.employee_id
	AND s.salary < 500  
	ORDER BY e.department_name;
go

exec sp_sal_dep
