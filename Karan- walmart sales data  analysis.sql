CREATE DATABASE walmart;

USE walmart;

CREATE TABLE sales
(
    invoice_id VARCHAR(40) NOT NULL PRIMARY KEY,
    branch VARCHAR(15) NOT NULL,
    city VARCHAR(40) NOT NULL,
    customer_type VARCHAR(40) NOT NULL,
    gender VARCHAR(15) NOT NULL,
    product_line VARCHAR(150) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL, 
    vat DECIMAL(6,4) NOT NULL,  
    total DECIMAL(12,4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(25) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct DECIMAL(15,9), 
    gross_income DECIMAL(15,4),
    rating DECIMAL(5,3)  
);

SELECT * FROM sales;

----------------Exploratory Data Analysis (EDA)----------------------
-----Generic Questions
-- 1.How many distinct cities are present in the dataset?
SELECT DISTINCT city FROM sales;

-- 2.In which city is each branch situated?
SELECT DISTINCT branch, city FROM sales;

--- Product Analysis
-- 1.How many distinct product lines are there in the dataset?
SELECT COUNT(DISTINCT product_line) FROM sales;

-- 2.What is the most common payment method?
SELECT payment, COUNT(payment) AS common_payment_method 
FROM sales GROUP BY payment ORDER BY common_payment_method DESC LIMIT 1;

-- 3.What is the most selling product line?
SELECT product_line, count(product_Line) AS most_selling_product
FROM sales GROUP BY product_line ORDER BY most_selling_product DESC LIMIT 1;

-- 4.Which product line generated the highest revenue?
SELECT product_line, SUM(total) AS total_revenue
FROM sales GROUP BY product_line ORDER BY total_revenue DESC LIMIT 1;

-- 5.Which city has the highest revenue?
SELECT city, SUM(total) AS total_revenue
FROM sales GROUP BY city ORDER BY total_revenue DESC LIMIT 1;

-- 6.Which product line incurred the highest VAT?
SELECT product_line, SUM(vat) as VAT 
FROM sales GROUP BY product_line ORDER BY VAT DESC LIMIT 1;

-- 7.Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) AS quantity
FROM sales GROUP BY branch HAVING SUM(quantity) > AVG(quantity) ORDER BY quantity DESC LIMIT 1;

-- 8.What is the most common product line by gender?
SELECT gender, product_line, COUNT(gender) total_count
FROM sales GROUP BY gender, product_line ORDER BY total_count DESC;

-- 9.What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating),2) average_rating
FROM sales GROUP BY product_line ORDER BY average_rating DESC;

-- 10.What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating),2) average_rating
FROM sales GROUP BY product_line ORDER BY average_rating DESC;

--Sales Analysis

-- 1.Identify the customer type that generates the highest revenue.
SELECT customer_type, SUM(total) AS total_sales
FROM sales GROUP BY customer_type ORDER BY total_sales DESC LIMIT 1;

-- 2.Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, SUM(VAT) AS total_VAT
FROM sales GROUP BY city ORDER BY total_VAT DESC LIMIT 1;

-- 3.Which customer type pays the most in VAT?
SELECT customer_type, SUM(VAT) AS total_VAT
FROM sales GROUP BY customer_type ORDER BY total_VAT DESC LIMIT 1;

---Customer Analysis

-- 1.How many unique customer types does the data have?
SELECT COUNT(DISTINCT customer_type) FROM sales;

-- 2.How many unique payment methods does the data have?
SELECT COUNT(DISTINCT payment) FROM sales;

-- 3.Which is the most common customer type?
SELECT customer_type, COUNT(customer_type) AS common_customer
FROM sales GROUP BY customer_type ORDER BY common_customer DESC LIMIT 1;

-- 4.Which customer type buys the most?
SELECT customer_type, SUM(total) as total_sales
FROM sales GROUP BY customer_type ORDER BY total_sales LIMIT 1;

SELECT customer_type, COUNT(*) AS most_buyer
FROM sales GROUP BY customer_type ORDER BY most_buyer DESC LIMIT 1;

-- 5.What is the gender of most of the customers?
SELECT gender, COUNT(*) AS all_genders 
FROM sales GROUP BY gender ORDER BY all_genders DESC LIMIT 1;

-- 6.What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS gender_distribution
FROM sales GROUP BY branch, gender ORDER BY branch;









