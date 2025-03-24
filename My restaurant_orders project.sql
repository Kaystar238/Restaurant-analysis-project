-- SECOND OBJECTIVE: VIEW THE ORDERS TABLE. WHAT IS THE DATE RANGE OF TABLE?

select *
from order_details_copy;

-- WHAT IS THE DATE RANGE OF THE TABLE	

select min(order_date), max(order_date)
from order_details_copy;

-- HOW MANY ORDERS WERE MADE WITHIN THIS DATE RANGE?

select count(distinct order_id)
from order_details_copy;

-- HOW MANY ITEMS WERE ORDERED WITHIN THIS DATE RANGE?

select count(*)
from order_details_copy;

-- WHICH ORDERS HAS THE MOST NUMBER OF ITEMS?

select order_id, count(item_id) as num_items
from order_details_copy
group by order_id
order by num_items desc;

-- HOW MANY ORDERS HAS MORE THAN 12 ITEMS

select order_id, count(item_id) as num_items
from order_details_copy
group by order_id
having num_items>12;

with total_num as
(select order_id, count(item_id) as num_items
from order_details_copy
group by order_id
having num_items>12
)
select count(num_items)
from total_num;
