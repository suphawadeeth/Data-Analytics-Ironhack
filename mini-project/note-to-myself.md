# FIFA - MoneyBall: Mini-Project
Group members:
- André Condre
- Hamideh Aghaei
- Suphawadee Mangold

#### Presentation
Rules:
- 10 minutes
- Leave 3-4 minutes for Q&A

Best practice for presentation:
- Define audience - who is the client (kid, adult)?

## About The Mini-Project
#### Main Objection of The Project
    - End-to-end Data Analysis
    - We focus on linear regression model for this project)

## Objective (for our group):
- Decide the best replacement for a transferred player

========= BRAINSTORM ========= 

### Question during the work process:
#### Who is our audience? Who is our client?
- Investor? 
- Team Manager?
- Kids playing the game

#### Why? 
- They want to buy the best player, to build the best team

#### What are they looking for? (In best of each position)
    
? Position:
- Front
- Middle
- Back
- Goal keeper
    
Characteristics for each position    
- Skill 
- Age range < 30
- Ability (overall) > 80 
- Price (also depens on contract >> release cost)
- Salary??
- BP == CAM
- POT > 75
- Value

Target >> OVA, POT (potential) 

#### Useful links:

- [Most Interesting Facts About FIFA Players from a Data Scientist Perspective](https://medium.com/data-storytelling/most-interesting-facts-about-fifa-players-from-a-data-scientist-perspective-1e16f2cb33c4)
- [Meaning of GA, GF, GD, and Other Common Football Abbreviations](https://howtheyplay.com/team-sports/abbrev-GA-GF-GS-GD-MP-Caps-meaning-soccer)
- [FIFA 21: EDA and Visualization](https://www.kaggle.com/code/paramarthasengupta/fifa-21-eda-and-visualization/notebook)
- [FIFA 21 Data Analysis & Visualization](https://www.kaggle.com/code/ekrembayar/fifa-21-data-analysis-visualization/notebook)
- [Learning data analysis and visualization with FIFA](https://www.kaggle.com/code/loulouashley/learning-data-analysis-and-visualization-with-fifa/notebook)

========= CHAIN OF THOUGHS ========= 
### 1. Understand project problem (DONE)
- Setup the project question >> DONE (Find the best replacement for a transferred player)

### 2. Understand data / EDA (BEFORE THURSDAY - communicate via Discord)
#### Clean data 

1. Split categorical/numerical columns (DONE)
2. Double check if there are numerical value in the categorical dataset >> move them to numerical dataset (DONE)
    Height, Weight, Value, Wage, Release_Clause, Hits (keep for a bit) >> DONE

#### Check Multi-Colinearity
Remove multicolinearity >> DONE

### 3. Processing Data
- Encoding (cat)
- Concat (num & cat)
- Train-test split
- Training the model (with train set)
- Apply the model >> predict the outcome
- Improve the model

### 4. Finally, answer the question
- I decided to use SQL query, then later on will plot the result using python pandas.

#### Our Objective: Decide the best replacement for a transferred player

What is the criteria of "best replacement"?
- After created model and predict the outcome (BOV/OVA), we found these factors are good predictors:

        POT         
        Attacking   
        Skill       
        Movement    
        Power       
        Mentality   
        ase_Stats  
        PAC         
        SHO        
        PAS         
        DRI         
        PHY  

Note: Mentality has low impact on the predictor, can also drop it.


Next, we want to visualize the result of best players for replacement

My approach (1-2 graphs, max is 3):
1. Find top 5 players (or maybe 10), rank by BOV (or OVA), show graph x=players, y=BOV score
2. Show the ability of those 5 players (bar graph),group by player, bargraph of those quality (that we want to show)
3. Take money into account, show graph of money related topic for these 5 player


