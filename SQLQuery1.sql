--UC1
Create Database EmployeePayroll_Service
use EmployeePayroll_Service

--UC2
Create Table employee_payroll
(
	Id int IDENTITY(1,1) NOT NULL Primary Key,
	Name varchar(50) NOT NULL,
	Salary money NOT NULL,
	Start Date NOT NULL
)
Select * From employee_payroll
Exec sp_help employee_payroll

--UC3
INSERT Into employee_payroll (Name, Salary, Start) Values ('Bill', 1000000, '2018-01-03')
INSERT Into employee_payroll (Name, Salary, Start) Values ('Terisa', 2000000, '2019-11-13')
INSERT Into employee_payroll (Name, Salary, Start) Values ('Charlie', 3000000, '2020-05-21')

--UC4
Select * From employee_payroll

--UC5
Select Name,Salary From employee_payroll Where Name = 'Bill'
Select * From employee_payroll Where Start BETWEEN CAST('2018-01-03' AS DATE) AND GETDATE()

--UC6
ALTER Table employee_payroll ADD Gender char(1)
Update employee_payroll Set Gender = 'M' Where Name = 'Bill' or Name = 'Charlie'
Update employee_payroll Set Gender = 'F' Where Name = 'Terisa'
Update employee_payroll Set Salary = 3000000 Where Name = 'Terisa'
Select * From employee_payroll

--UC7
Select AVG(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select AVG(Salary) From employee_payroll Where Gender = 'F' Group By Gender
Select SUM(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select SUM(Salary) From employee_payroll Where Gender = 'F' Group By Gender
Select MIN(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select MIN(Salary) From employee_payroll Where Gender = 'F' Group By Gender
Select MAX(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select MAX(Salary) From employee_payroll Where Gender = 'F' Group By Gender

--UC8
ALTER Table employee_payroll ADD Department char(150)
ALTER Table employee_payroll ADD PhoneNumber int
ALTER Table employee_payroll ADD Address varchar(250)
Update employee_payroll Set Department = 'FINANCE' Where Name = 'Bill'
Update employee_payroll Set Department = 'MARKETING' Where Name = 'Terisa'
Update employee_payroll Set Department = 'PRODUCTION' Where Name = 'Charlie'
Select * From employee_payroll

--UC9
Exec sp_rename 'employee_payroll.Salary', 'Basic_Pay', 'COLUMN'
ALTER Table employee_payroll ADD Deductions money
ALTER Table employee_payroll ADD Taxable_Pay money
ALTER Table employee_payroll ADD Tax money
ALTER Table employee_payroll ADD Net_Pay money
Select * From employee_payroll

--UC10
Update employee_payroll Set Department = 'SALES' Where Name = 'Terisa'
INSERT Into employee_payroll (Name, Basic_Pay, Start, Gender, Department, Deductions, Taxable_Pay, Tax, Net_Pay) Values ('Terisa', 3000000, '2018-01-03', 'F', 'MARKETING', 1000000, 2000000, 500000, 1500000)
Select * From employee_payroll Where Name = 'Terisa'