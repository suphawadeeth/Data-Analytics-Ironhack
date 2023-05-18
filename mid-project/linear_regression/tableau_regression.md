# Tableau - Regression

Tableau Questions:

1. Convert the necessary measures to dimensions (the variables that are categorical in nature)
2. Plot the distribution of `price` vs. _number of bedrooms_, `price` vs. _number of bathrooms_, `price` vs. _condition_, `price` vs. _floors_, `price` vs. _grade_, `price` vs. _view_, and `price` vs. _waterfront_.
   State your observation for each one of those graphs. Do you see any trends in prices vs the rest of those variables individually? This can also be used for EDA to identify some data cleaning operations that you might need to perform further.
3. Draw scatter plots for `price` vs. `sqft_above`, `price` vs. `sqft_basement`, `price` vs. `living15`, `price` vs. `sqft_lot15`.
4. Identify using tableau which state data is presented to you. Use latitude (generated), longitude (generated), and zip code for this. Color code the zip codes based on the prices to see which areas are more expensive than the others.
5. Create a plot to check which are the more selling properties based on the number of bedrooms in the house. Create a plot of bedrooms vs. count of data points.
6. We want to see the trend in price of houses based on the year built. From our previous plot, we know that most of our customers are interested in three and four bedroom houses. Create a filter on bedroom feature to select those properties and compare the trends in prices using line charts.
7. Create calculated field `year_built_bins` for the column `year_built` by creating buckets as follows, for houses built between 1900 and 2000 - category A, for houses built between 2000 and 2010 - category B, and for houses built after 2010 - category C. Use `IF-ELSE` statement to create the bins/buckets. Compare the prices of houses for the three categories.
8. Now we want to deep dive into the categories we created in the last question. Let’s see how many properties are in each of the categories. Indicate the numbers as labels on each of the three categories.
9. Deep dive in category A, category B and category C using filters. Identify different characteristics/trends for each of the three categories.
10. Create a visually appealing dashboard to represent the information.

**Some points to keep in mind while working on the tableau questions:**

    a) The plots should be well labelled briefly describing the purpose of the plot
    b) Select the chart type that produces an effective outcome for a given scenario
    c) Focus audience attention on the most important data
    d) Use space, color and fonts appropriately
    e) Use correct title for the plots.
    f) Utilize formatted tooltips and descriptive titles
    g) Format the axes wherever necessary
    h) Use caption to add details wherever necessary
    i) Use appropriate level of details with labels and color coding etc.
    j) For the dashboard make sure that the information represented is clear and easy to understand. The user of the dashboard should be able to understand the purpose of the dashboard and should be able to make decisions looking at the plots presented.
    k) You can also use filters wherever appropriate to give the user the flexibility to view different information easily
