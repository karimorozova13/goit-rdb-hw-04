use mydb;
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




