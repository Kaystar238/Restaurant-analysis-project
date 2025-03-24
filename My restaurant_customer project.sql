-- COMBINE THE MENU ITEMS AND THE ORDER ITEMS TABLES IN A SINGLE TABLE

select *
from menu_items_copy;

select *
from order_details_copy;

select *
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id;

-- WHAT ARE THE TOP 5 ORDERS THAT SPENT THE MOST MONEY

select order_id, sum(price) as Top_5
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id
group by order_id
order by Top_5 desc
limit 5;

-- WHAT WERE THE LEAST AND MOST ORDER ITEMS? AND WHAT CATEGORY WERE THEY IN?
-- LEAST ORDER

select item_name, category, count(order_id) as least_order
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id
group by item_name, category
order by least_order;

-- MOST ORDER

select item_name, category, count(order_id) as most_order
from order_details_copy ord
left join menu_items_copy menu
	on menu.menu_item_id=ord.item_id
group by item_name, category
order by most_order desc;

-- VIEW THE DETAILS OF THE HIGHEST SPEND ORDER. WHAT INSIGHTS CAN YOU GATHER FROM THE RESULTS?

select *
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id
where order_id = 440;

select category, count(item_id) as num_items
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id
where order_id = 440
group by category;

-- VIEW THE DETAILS OF THE TOP 5 HIGHEST SPEND ORDERS. WHAT INSIGHTS CAN YOU GATHER FROM THEIR RESULTS

select *
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id
WHERE order_id in (440,2075,1957,330,2675);

select category, count(item_id) as num_items
from order_details_copy ord
join menu_items_copy menu
	on ord.item_id=menu.menu_item_id
WHERE order_id in (440,2075,1957,330,2675)
group by category
order by num_items desc;
