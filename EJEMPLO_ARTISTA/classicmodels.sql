USE classicmodels;
SELECT * FROM productlines;

SELECT pl.productLine, prod.* FROM productlines as pl, products as prod WHERE pl.productLine = prod.productLine AND prod.buyPrice > 100;

# productos con valor mayor a 100

SELECT productName,buyPrice FROM products WHERE buyPrice > 100;

SELECT customerName, creditLimit FROM customers WHERE creditLimit > 50000 ORDER BY creditLimit ASC ;

SELECT * FROM employees WHERE jobTitle LIKE 'Sales%';

SELECT emp.firstName FROM employees as emp, offices as off WHERE emp.officeCode = off.officeCode AND off.city = 'San Francisco';

SELECT CONCAT(emp.firstName,' ',emp.lastName) as fullName, off.city,off.country as nombreCompleto FROM employees as emp, offices as off WHERE emp.officeCode = off.officeCode;



#EMPLEADOS QUE HAN VENDIDO EN PROMEDIO MAYOR A 100
SELECT emp.firstName, emp.lastName, AVG(odd.priceEach) as promedio FROM employees as emp, customers as cli, orderdetails
    as odd, orders as ord , customers as cus where odd.orderNumber=ord.orderNumber and ord.customerNumber=cus.customerNumber
    and cus.salesRepEmployeeNumber=emp.employeeNumber GROUP BY emp.employeeNumber HAVING promedio > 90;