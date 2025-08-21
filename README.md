# 🍕 Pizza-Sales-Analysis-using-SQL-and-Tableau

This project analyzes pizza sales data using SQL for data cleaning, KPI calculations, and exploratory queries, along with Tableau for data visualization and dashboard creation.

The goal is to uncover insights into sales trends, customer preferences, peak order times, and product performance to help stakeholders optimize operations and maximize revenue.

## Table of Contents

- [Project Overview](#-project-overview)
- [Problem Statement](#-problem-statement)
- [Dataset](#-dataset)
- [Key Metrics](#-key-metrics)
- [Visual Insights](#-visual-insights)
- [Tools and Technologies](#-Tools-and-Technologies)
- [Data Cleaning and Analysis](#-Data-Cleaning-and-Analysis)
- [Dashboard](#-dashboard)
- [Visual Highlights](#-Visual-Highlights)
- [Next Steps / Recommendations](#-Next-Steps-/-Recommendations)
- [Installation](#-installation)
- [Conclusion](#conclusion)
- [Contact](#contact)

## 📖 Project Overview

The project provides an end-to-end pipeline for Pizza Sales Data Analysis:

- Writing SQL queries to extract KPIs, seasonal trends, and product popularity.
- Performing analysis to understand sales distribution, revenue contribution, and customer ordering behavior.
- Building interactive Tableau dashboards for intuitive and visual storytelling.

This analysis helps restaurant managers, business owners, and stakeholders make data-driven decisions on menu design, promotions, and operations.

## 📂 Dataset

- Source: [Kaggle – Pizza Sales Dataset](https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset)
- Format : .csv
- Data Structure

  - Data type : .csv
  - Tables : 4
  - Fields : 12
  - Records : 48,620
  - Data Span : Jan 2015 - Dec 2015
  - Source : Maven Analytics
    
- Tables:
  
  - orders: Contains order date and time.
  - order_details: Contains order items and quantities.
  - pizzas: Contains pizza size, price, and ID.
  - pizza_types: Contains pizza names and categories.


## 🚩 Problem Statement

A well-known pizza chain aims to enhance its sales and marketing strategies to boost revenue and improve customer satisfaction. To accomplish this, the company needs to conduct a detailed analysis of its sales data in order to uncover customer preferences, sales patterns, and product performance. The objective is to generate valuable insights and provide actionable recommendations that support business growth.

The client outlined the problem in two main parts:

1. KPI Requirements

To measure overall business performance, the following key metrics need to be calculated:

- Total Revenue
- Total Orders
- Average Order Value (AOV)
- Total Pizzas Sold
- Average Pizzas per Order

2. Visualization Requirements

To better understand sales behavior and trends, the client requested the following charts and visualizations:

- Daily trend of total orders
- Monthly trend of total orders
- Sales distribution by pizza category (percentage contribution)
- Sales distribution by pizza size (percentage contribution)
- Total pizzas sold across different categories
- Top 5 best-selling pizzas and Bottom 5 least-selling pizzas

## 🔑 Key Metrics

- Total Revenue: $817.9K
- Total Pizzas Sold: 49.6K
- Total Orders: 21.4K
- Average Order Value: $38.31
- Average Pizzas per Order: 2.32

## 🔍 Visual Insights

- Peak Order Hours: 12:00–1:00 PM and 4:00–7:00 PM.
- Busiest Week: 2nd week of January.
- Top Category: Classic pizzas contributed the most sales and orders.
- Top Size: Large pizzas contributed ~46% of total revenue.
- Best Seller: The Thai Chicken Pizza (revenue) and Classic Deluxe Pizza (quantity & orders).
- Worst Seller: The Brie Carre Pizza (lowest revenue, orders, and sales).
  
## 🛠️ Tools and Technologies

- Programming: SQL
- Excel/CSV: For initial data cleaning and preparation.
- Tableau: For data visualization and exploratory data analysis (EDA).
- Environment: VS Code

## 🧹 Data Cleaning and Analysis

- Built SQL queries to extract KPIs: total revenue, pizzas sold, avg order value, etc.
- Analyzed seasonal trends by hours, days, months, and quarters.
- Identified product popularity by category, size, and revenue contribution.
- Segmented best vs worst sellers for actionable insights.

## 📈 Dashboard

I designed and developed two interactive Power BI dashboards tailored to meet distinct business requirements:

1. Performance Dashboard: Showcases core KPIs such as Total Revenue, Total Orders, Average Order Value, and Total Pizzas Sold. It also includes visualizations of peak ordering hours, busiest days, and sales performance trends across time periods. This dashboard equips stakeholders with clear, data-driven insights to enhance operational efficiency and guide strategic decisions.
   
<img width="3198" height="1798" alt="Overview" src="https://github.com/user-attachments/assets/268c33ea-8c78-4149-b895-ac3cd3cc346c" />

2. Product Insights Dashboard: Focuses on identifying the best- and worst-selling pizzas using intuitive charts and comparison tables. It provides a detailed breakdown of product performance, enabling businesses to refine their menu strategies, optimize inventory, and run targeted marketing campaigns to boost sales growth.

<img width="3198" height="1798" alt="Dashboard" src="https://github.com/user-attachments/assets/8c017be4-b210-4d96-b071-e386e9ec8a28" />

## 📊 Visual Highlights

- Top Sales Days: Fridays, Thursdays, and Saturdays account for nearly 47% of weekly sales, while Sundays and Tuesdays show the lowest sales activity.
- Peak Hours: Most orders are placed between 12:00–1:00 PM (lunchtime) and 5:00–6:00 PM (evening), reflecting customer dining preferences.
- Seasonal Trends: Sales peak in the second quarter of the year, with July recording the highest revenue.
- Popular Pizza Sizes: Large-sized pizzas dominate sales (46%), followed by Medium (30%) and Small (22%).
- Category Insights: All four pizza categories contribute almost equally to total sales, with Classic pizzas leading slightly, followed by Supreme.
- Best and Worst Sellers:

  - Top Revenue Contributor: Thai Chicken Pizza
  - Most Ordered Pizza: Classic Deluxe Pizza
  - Least Preferred Pizza: Brie Carre Pizza

## 🎯 Next Steps / Recommendations

Based on the analysis, the following insights and recommendations were derived:

- Promote Best Sellers: Highlight pizzas like Thai Chicken and Classic Deluxe in promotions.
- Improve Low Sellers: Investigate poor performers like Brie Carre Pizza; consider recipe changes or menu removal.
- Focus on Large Size Demand: Since Large pizzas contribute nearly half of sales, bundle deals can be designed.
- Peak Hour Strategies: Increase staff and promotions during lunch (12–1 PM) and evening (4–7 PM).
- Seasonal Campaigns: Leverage insights from January peaks to plan seasonal offers.

## ⚙️ Installation

To get started with the project, follow these steps:

1. Clone the repository:
   
   ```bash
   git clone https://github.com/Dhrishita/Pizza-Sales-Analysis-using-SQL-and-Tableau.git
   cd Pizza-Sales-Analysis-using-SQL-and-Tableau
   
2. Import the SQL file into MySQL:
   
   ```bash
   source Pizza_Sales_Analysis.sql;

3. Open the Tableau file and connect it to the SQL database / CSV extracts.

## Conclusion

This project shows how SQL and Tableau can be combined for business intelligence. The insights help optimize menu strategy, understand customer preferences, and improve overall restaurant performance.

## Contact
If you have any questions or suggestions, feel free to open an issue or contact:
Dhrishita Parve: dhrishitap18@gmail.com






