use maple;

show tables;

select * from retails;

select count(distinct customer_id) from retails;

select distinct category from retails;

select * from retails where t_id is null or sale_date is null or sale_time is null or customer_id is null or 
gender is null or age is null or category is null or price_per_unit is null or cogs is null or total_sale is null or quantiy is null;

delete from retails where t_id is null or sale_date is null or sale_time is null or customer_id is null or 
gender is null or age is null or category is null or price_per_unit is null or cogs is null or total_sale is null or quantiy is null;

select count(*) as total_sales from retails;

select count(distinct customer_id) from retails;


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retails where sale_date in ('2022-11-05');

-- Q.2 Write a SQL query to retrieve all transactions where the category  is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select t_id from retails where category ='Clothing' and quantiy > 4 and sale_date between '2022-09-01' and '2022-09-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category,count(total_sale) as count_total_sales,sum(total_sale) as total_sales
from retails group by category; 

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) as average_age from retails where category = 'beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select t_id from retails where total_sale > 1000 order by t_id;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender, count(t_id) from retails group by  gender order by count(t_id);

-- Q.7 Write a SQL query to calculate the average sale for each month . Find out best selling month in each year
select * from(
select dense_rank() over(partition by total_sales order by total sales desc ) as t1 from retail ) as t2 where t2.t1 <5;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select * from retails;
select t_id , sum(total_Sale) as suum from retails group by t_id order by suum desc limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count(distinct t_id) from retails group by category ;




