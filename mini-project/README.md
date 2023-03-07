# FIFA - MoneyBall: Mini-Project
### Group members:
- André Condre
- Hamideh Aghaei
- Suphawadee Mangold

### Presentation
Rules:
- 10 minutes
- Leave 3-4 minutes for Q&A

Best practice for presentation:
- Define audience - who is the client (kid, adult)?

## About The Mini-Project
#### Main Objection of The Project
    - End-to-end Data Analysis
    - We focus on linear regression model for this project

## Objective (for our group):
    - Decide the best replacement for a transferred player

## ========= BRAINSTORM ========= 

### Questions during the work process:
#### Who is our audience? Who is our client?
- Investor? 
- Team Manager?
- Kids playing the game

#### Why? 
- They want to buy the best player, to build the best team
- With cheapest one, but nest quality

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

## ========= END-TO-END STEPS ========= 
### 1. Understand project problem (DONE)
- Setup the project question >> DONE (Find the best replacement for a transferred player)
### 2. Understand data / EDA (BEFORE THURSDAY - communicate via Discord)
- Clean data 
>> In this step, we work independently, then share our progress on Discord. 

>> This EDA should be done before Thursday so we will start to discuss the result from this process during the class.


>> Note: POSITION WE WANT TO REPLACE 'CAM'

- Drop irrelevant cols

    - image 

    - loan date end

    - gender

    etc. 

- Rename the remaining cols (lowercase, remove the space and replace with _)

- Decide what are the most important features


       
#### Visualization
- Separate numerial & categorical
- Check distribution
- X-y split
- Normalize/Standardize data if needed 
- Check multicolinearity 

### 3. Processing Data
- Encoding (cat)
- Concat (num & cat)
- Train-test split
- Training the model (with train set)
- Apply the model >> predict the outcome
- Improve the model

### Useful links:

- [Most Interesting Facts About FIFA Players from a Data Scientist Perspective](https://medium.com/data-storytelling/most-interesting-facts-about-fifa-players-from-a-data-scientist-perspective-1e16f2cb33c4)
- [Meaning of GA, GF, GD, and Other Common Football Abbreviations](https://howtheyplay.com/team-sports/abbrev-GA-GF-GS-GD-MP-Caps-meaning-soccer)
- [FIFA 21: EDA and Visualization](https://www.kaggle.com/code/paramarthasengupta/fifa-21-eda-and-visualization/notebook)
- [FIFA 21 Data Analysis & Visualization](https://www.kaggle.com/code/ekrembayar/fifa-21-data-analysis-visualization/notebook)
- [Learning data analysis and visualization with FIFA](https://www.kaggle.com/code/loulouashley/learning-data-analysis-and-visualization-with-fifa/notebook)

