use batchSR
--union all
select Date,Sales_Rep,customer_code,Sales,profit,Region into combine_data1 from Additional
union all
select Date,Sales_Rep,customer_code,Sales,profit,Region from data
select * from combine_data1
--
select combine_data1.Date,
combine_data1.Sales_Rep,
combine_data1.customer_code,
combine_data1.Sales,
combine_data1.profit,
combine_data1.Region,
(select customers.Customer from customers where combine_data1.customer_code=customers.Customer_Code)as customers,
(select customers.Association_Date from customers where combine_data1.customer_code=customers.Customer_Code)as Association_Date
into project_1 
from combine_data1
select * from project_1
--finding higest sales in a region
select  Sales,Region from project_1
select max(Sales) as max_sales from project_1 where Region in('South')
--find sales,profit of sales_Rep in a Region 
select Sales,Sales_Rep,Region,profit from project_1
where profit>=1500 and Sales>=1400 and Sales_Rep in('Abhay') and Region in('West')
--find any two sales_Rep in a Region
select Sales_Rep,Region,profit,Sales,customer_code from project_1
where Sales_Rep in('Abhay','varsha') and Region in('South')
--finding min,max,sum,avg of sales
select min(Sales)as min_sales from project_1
select max(Sales)as max_sales from project_1
select sum(Sales)as sum_sales from project_1
select avg(Sales)as avg_sales from project_1
--finding min,max,sum,avg of profit
select min(profit)as min_profit from project_1
select max(profit)as max_profit from project_1
select sum(profit)as sum_profit from project_1
select avg(profit)as avg_profit from project_1
select * from project_1
--finding two sales_rep in region and profit and sales
select Sales_Rep,Region,customers,Sales,profit  into Sales_Rep_table1 from project_1 
where Region in ('west') and customers in('sharma & co','Boston Consultants') and profit>=1800 and Sales>=1600
--Sales
Select max(Sales)as max_sales from Sales_Rep_table1
select min(Sales)as min_sales from Sales_Rep_table1
select sum(Sales)as sum_sales from Sales_Rep_table1
select avg(sales)as avg_sales from Sales_Rep_table1
--profit
select min(profit)as min_profit from Sales_Rep_table1
select max(profit)as max_profit from Sales_Rep_table1
select sum(profit)as sum_profit from Sales_Rep_table1
select avg(profit)as avg_profit from Sales_Rep_table1
select * from Sales_Rep_table1
select * from project_1