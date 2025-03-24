-- FIRSTLY, I WILL CREATE A COPY OF THE DATA BECAUSE IT'S OKAY TO WORK ON A COPY DATA 
-- BUT I WILL LIKE TO VIEW THE DATA FIRST

select *
from menu_items;

select *
from order_details;

-- NOW CREATE A COPY FOR THOSE TABLES (MENU_ITEMS TABLE AND ORER_DETAILS TABLE)
-- FOR MENU_ITEMS TABLE

create table menu_items_copy
like menu_items;

insert menu_items_copy
select *
from menu_items;

select *
from menu_items_copy;

-- FOR ORDER_DETAILS TABLE

create table order_details_copy
like order_details;

insert order_details_copy
select *
from order_details;

select *
from order_details_copy;

-- NOW WE SOLVE THE FIRST OBJECTIVE BY FINDING THE TOTAL NUMBER OF ITEMS ON THE MENU

select count(*)
from menu_items_copy;

-- WHAT ARE THE LEAST AND MOST EXPENSIVE ITEMS ON THE MENU

-- NOW WHAT IS THE LEAST EXPENSIVE ITEMS ON THE MENU

select *
from menu_items_copy
order by price asc;

-- NOW WHAT IS THE MOST EXPENSIVE ITEMS ON THE MENU

select *
from menu_items_copy
order by price desc;

-- HOW MANY ITALIAN DISHES ARE ON THE MENU

select count(*)
from menu_items_copy
where category = 'italian';

-- WHAT ARE THE LEAST AND MOST EXPENSIVE ITALIAN DISHES ON THE MENU

-- LEAST EXPENSIVE ITALIAN DISHES ON THE MENU

select *
from menu_items_copy
where category = 'italian'
order by price asc;

-- MOST EXPENSIVE ITALIAN DISHES ON THE MENU

select *
from menu_items_copy
where category = 'italian'
order by price desc;

-- HOW MANY DISHES ARE IN EACH CATEGORY

select distinct category, count(category) as num_dishes
from menu_items_copy
group by category;

-- WHAT IS THE AVERAGE DISH PRICE WITHIN EACH CATEGORY

select category, avg(price) as avg_dish_price
from menu_items_copy
group by category;















