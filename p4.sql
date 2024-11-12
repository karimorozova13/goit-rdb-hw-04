use mydb;

-- join all tables 
select p.id as product_id, p.name as product_name, p.unit as product_unit, p.price as product_price, p.supplier_id, p.category_id,
s.name as supplier_name, s.contact as supplier_contact, s.address as supplier_address, s.city as supplier_city,
s.postal_code as supplier_postal_code, s.country as supplier_country, s.phone as supplier_phone, c.name as category_name, c.description as category_description,
od.id as od_id, od.order_id, od.quantity as product_quantity, o.customer_id, o.employee_id, o.date as order_date, o.shipper_id,
cus.name as customer_name, cus.contact as customer_contact, cus.address as customer_address, cus.city as customer_city, cus.postal_code as customer_postal_code,
cus.country as customer_country, e.last_name as employee_last_name, e.first_name as employee_first_name, e.birthdate  as employee_birthdate, e.photo as employee_photo,
e.notes as employee_notes, ship.name as shipper_name, ship.phone as shipper_phone
from products p 
inner join suppliers s on p.supplier_id = s.id
inner join categories c on p.category_id = c.id
inner join order_details od on p.id = od.product_id
inner join orders o on od.order_id = o.id
inner join customers cus on o.customer_id = cus.id
inner join employees e on o.employee_id = e.employee_id
inner join shippers ship on o.shipper_id = ship.id;

-- total rows inner join
select count(*) as total_rows
from products p 
inner join suppliers s on p.supplier_id = s.id
inner join categories c on p.category_id = c.id
inner join order_details od on p.id = od.product_id
inner join orders o on od.order_id = o.id
inner join customers cus on o.customer_id = cus.id
inner join employees e on o.employee_id = e.employee_id
inner join shippers ship on o.shipper_id = ship.id;

-- total rows left join 
select count(*) as total_rows
from products p 
left join suppliers s on p.supplier_id = s.id
left join categories c on p.category_id = c.id
left join order_details od on p.id = od.product_id
left join orders o on od.order_id = o.id
left join customers cus on o.customer_id = cus.id
left join employees e on o.employee_id = e.employee_id
left join shippers ship on o.shipper_id = ship.id;

-- total rows right join 
select count(*) as total_rows
from products p 
right join suppliers s on p.supplier_id = s.id
right join categories c on p.category_id = c.id
right join order_details od on p.id = od.product_id
right join orders o on od.order_id = o.id
right join customers cus on o.customer_id = cus.id
right join employees e on o.employee_id = e.employee_id
right join shippers ship on o.shipper_id = ship.id;

-- rows where employee_id > 3 and ≤ 10 
select p.id as product_id, p.name as product_name, p.unit as product_unit, p.price as product_price, p.supplier_id, p.category_id,
s.name as supplier_name, s.contact as supplier_contact, s.address as supplier_address, s.city as supplier_city,
s.postal_code as supplier_postal_code, s.country as supplier_country, s.phone as supplier_phone, c.name as category_name, c.description as category_description,
od.id as od_id, od.order_id, od.quantity as product_quantity, o.customer_id, o.employee_id, o.date as order_date, o.shipper_id,
cus.name as customer_name, cus.contact as customer_contact, cus.address as customer_address, cus.city as customer_city, cus.postal_code as customer_postal_code,
cus.country as customer_country, e.last_name as employee_last_name, e.first_name as employee_first_name, e.birthdate  as employee_birthdate, e.photo as employee_photo,
e.notes as employee_notes, ship.name as shipper_name, ship.phone as shipper_phone
from products p 
inner join suppliers s on p.supplier_id = s.id
inner join categories c on p.category_id = c.id
inner join order_details od on p.id = od.product_id
inner join orders o on od.order_id = o.id
inner join customers cus on o.customer_id = cus.id
inner join employees e on o.employee_id = e.employee_id
inner join shippers ship on o.shipper_id = ship.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
;

-- rows count where employee_id > 3 and ≤ 10 
select count(*)
from products p 
inner join suppliers s on p.supplier_id = s.id
inner join categories c on p.category_id = c.id
inner join order_details od on p.id = od.product_id
inner join orders o on od.order_id = o.id
inner join customers cus on o.customer_id = cus.id
inner join employees e on o.employee_id = e.employee_id
inner join shippers ship on o.shipper_id = ship.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
;

-- rows grouped by category
SELECT c.name AS category_name, COUNT(*) AS total_rows_in_group, AVG(od.quantity) AS average_quantity
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN order_details od ON p.id = od.product_id
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers cus ON o.customer_id = cus.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers ship ON o.shipper_id = ship.id
GROUP BY c.name;

-- rows where average_quantity > 21
SELECT c.name AS category_name, COUNT(*) AS total_rows_in_group, AVG(od.quantity) AS average_quantity
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN order_details od ON p.id = od.product_id
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers cus ON o.customer_id = cus.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers ship ON o.shipper_id = ship.id
GROUP BY c.name
HAVING average_quantity > 21;

-- rows sorted by total_rows desc
SELECT c.name AS category_name, COUNT(*) AS total_rows, AVG(od.quantity) AS average_quantity
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN order_details od ON p.id = od.product_id
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers cus ON o.customer_id = cus.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers ship ON o.shipper_id = ship.id
GROUP BY c.name
ORDER BY total_rows DESC;

-- 4 rows from the second row
SELECT c.name AS category_name, COUNT(*) AS total_rows, AVG(od.quantity) AS average_quantity
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN order_details od ON p.id = od.product_id
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers cus ON o.customer_id = cus.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers ship ON o.shipper_id = ship.id
GROUP BY c.name
LIMIT 4 OFFSET 1;



