Create database Sql2Inclass2;
use Sql2Inclass2;
-- --------------------------------------------------------------
# Dataset Used: wine.csv
select * from wine;
-- --------------------------------------------------------------
# Q1. Give a dense rank to the wine varities on the basis of the price.
 select *,dense_rank()over(order by price desc)
 from wine;
 
# Q2. Use aggregate window functions to find the average of points for each row within
# its partition (country) and also arrange the final result in the descending order by country.
# print country,province,winery,variety
select country,province,winery,variety,
 avg(points)over(partition by country) avg_points from wine
 order by country desc;
 
# Dataset Used: students.csv
select * from students;
-- --------------------------------------------------------------
# Q3. Provide the new roll numbers to the students on the basis of their names alphabetically.
select *,row_number()over(order by name)  as roll_no from students;
-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
select * from web;
select * from website_stats;
-----------------------------------------------------------------

# Q4. Display the difference in ad_clicks between the current day and the next day for 
# the website 'Olympus'

select day,ad_clicks-
lead(ad_clicks)over(order by day)diff_clicks
from website_stats where website_id =
(select website_id from web where name='olympus');

# Q5. Write a query that displays the statistics for website_id = 3 such that for each row,
# show the day, the number of users and the smallest number of users ever.
select day,no_users,min(no_users)over() min_user 
from website_stats where website_id=3;
# Dataset Used: play_store.csv and sale.csv
select * from play_store;
select * from sale;
-- ---------------------------------------------------------------

# Q6. Write a query thats orders games in the play store into three buckets as 
#per editor ratings received  from higher to lowest
select *, ntile(3)over(order by editor_rating desc) rating from play_store;
# Q7. Write a query that displays the name of the game, the price, the sale date and 
#the 4th column should display # the sales consecutive number i.e. ranking of game as 
#per the sale took place, so that the latest game sold gets number 1. 
#Order the result by editor's rating of the game
select name,price,str_to_date(date,'%Y-%m-%d'),
dense_rank()over(order by date desc) consecutive_no
 from play_store ps join sale s on ps.id =s.game_id;
-----------------------------------------------------------------
# Dataset Used: movies.csv, ratings.csv, rent.csv
select * from movies;
select * from rent;
select * from ratings;
-----------------------------------------------------------------
# Q8. Write a query that displays basic movie informations as well as the previous rating 
#provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.
select title,rating first_review,
lead(rating)over(partition by movie_id,customer_id)next_review
from movies m join ratings r on m.id=r.movie_id;
# Q9. For each movie, show the following information: title, genre, average user rating for 
#that movie  and its rank in the respective genre based on that average rating in descending 
#order (so that the best movies will be shown first).
select *, dense_rank()over(order by avg_rating desc) from
(select title,genre , avg(rating) avg_rating from movies m 
join ratings r 
on m.id=r.movie_id
group by title,genre,movie_id)t;

# Q10. For each payment date, show the payment_date, the sum of payment amounts 
#(column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between 
#these two values.
select *,lag(total)over(order by payment_date) previous_amt,
total-lag(total)over(order by payment_date) diff_total from
(select payment_date,sum(payment_amount)total
from rent
group by payment_date)temp;
