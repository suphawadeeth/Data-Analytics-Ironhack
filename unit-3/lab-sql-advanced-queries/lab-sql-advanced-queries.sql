# Lab | SQL Advanced queries
# In this lab, you will be using the Sakila database of movie rentals.
USE sakila;

# Instructions

# Q2: For each film, list actor that has acted in more films.

# I follow these steps just to do some checks along the process
-- 1. For example, check film_id = 1, how many actor played in this film
SELECT film_id, COUNT(*) AS n_actor
FROM film_actor
WHERE film_id = 1
GROUP BY film_id;
# 10 actors played in this film

-- 2. Who are the actors in the film_id = 1
SELECT film_id, actor_id
FROM film_actor
WHERE film_id = 1;
# show the list of 10 actors in this film_id = 1 >> [1,10,20,30,40,53,108,162,188,198]

-- 3. Among these actors in film_id = 1, are they presented in other films and how many?
# Use this query to show the played_N_films that each actor played
SELECT actor_id, COUNT(*) AS played_N_films
FROM film_actor
GROUP BY actor_id
;
# this table shows how many films each actor has played



-- 4. Combine 2+3, meaning we need to GROUP BY (partition) film_id & actor_id --> Get the top 1 of the actor_id who has the most played_N_films
WITH cte_superstar AS (
SELECT 
	FA.film_id,
    FA.actor_id, 
    find_superstar.played_N_films AS n_films,
	RANK() OVER (PARTITION BY FA.film_id ORDER BY find_superstar.played_N_films DESC) AS ranking
FROM film_actor FA
JOIN ( # this subquery is as another table from step 3 above 
	SELECT actor_id, COUNT(*) AS played_N_films 
    FROM film_actor 
    GROUP BY actor_id) AS find_superstar
ON FA.actor_id = find_superstar.actor_id
GROUP BY film_id, actor_id
)
SELECT film_id, actor_id, n_films
FROM cte_superstar
WHERE ranking = 1
;


# From query above, modify it >> CREATE VIEW instead of subquery (from step 3)
-- This query from step 3, save it as VIEW name  "find_superstar" for further use
CREATE VIEW find_superstar AS
SELECT actor_id, COUNT(*) AS played_N_films
FROM film_actor
GROUP BY actor_id;

-- modify query from step 4 by combinding it with VIEW find_superstar
WITH cte_superstar AS (
	SELECT 
	FA.film_id,
    FA.actor_id, 
    FS.played_N_films AS n_films,
	RANK() OVER (PARTITION BY FA.film_id ORDER BY FS.played_N_films DESC
    ) AS ranking
FROM film_actor FA
JOIN find_superstar FS
ON FA.actor_id = FS.actor_id
GROUP BY film_id, actor_id
)
SELECT film_id, actor_id, n_films
FROM cte_superstar
WHERE ranking = 1;
# from this result, I got film_id=1 has actor_id=198 as the a superstar (play the more films than others)


# So I go back to check using this query
WITH cte_filmid1 AS (
	SELECT film_id, actor_id
	FROM film_actor
	WHERE film_id = 1)
SELECT F.actor_id, COUNT(*) AS played_N_films
FROM film_actor F
JOIN cte_filmid1 CF
ON F.actor_id = CF.actor_id
GROUP BY F.actor_id
ORDER BY played_N_films DESC;
# got the same result >> actor_id 198 is the star who played more films than others in film_id 1


-- Another way if not using CTE, list all the actor_id from film_id 1
SELECT actor_id, COUNT(*) AS played_N_films
FROM film_actor
WHERE actor_id IN (1,10,20,30,40,53,108,162,188,198)
GROUP BY actor_id
ORDER BY played_N_films DESC;


