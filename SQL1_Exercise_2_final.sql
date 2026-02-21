use in_class_2;
select * from cricket_1;
select * from cricket_2;

### Use Databse Inclass (Created on Day1)
### Import all the files given in the dataset

-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------

# Q1. Find all the players who were present in either the test match 1 or in the test match 2.
select * from cricket_1 
 inner join cricket_2
 on cricket_1.Player_Name = cricket_2.Player_Name;
 
 
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
select Player_Id, runs, Player_Name from cricket_1 
where runs>50;

# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
select Player_Name from cricket_1 where Player_Name like 'y%v';
select * from cricket_1 where player_name like 'y%v';
# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
 select * from cricket_1 where player_name  not like '%t';

-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------
select * from cric_combined;
# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)
alter table cric_combined add pc_ratio float;
update cric_combined set pc_ratio=popularity/charisma;

# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio (pc_ratio).
select * from cric_combined order by pc_ratio desc limit 5;

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.
 select player_id,player_name from cric_combined where player_name like '%%d%%';
 
# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
  select player_id,pc_ratio from cric_combined where pc_ratio between 0.12 and 0.25;

-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
select * from new_cricket;
-- --------------------------------------------------------

# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
 select player_id,player_name from new_cricket where charisma is null;
 
 # Q10. write a MYSQL query to display all the null values in the column charisma imputed with 0
 select charisma from new_cricket where ifnull(charisma,0);
 select * from new_cricket where ifnull(charisma,0);
 # Q11. separate all player_id into single numeric ids
-- ( example PL1 converted as 1, PL2 as 2 ,......)

SELECT player_id,
       CAST(SUBSTRING(player_id, 3) as unsigned) AS numeric_id
FROM new_cricket;
 select * from new_cricket;
# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
select player_id,player_name,charisma from new_cricket where charisma>25;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
select * from churn_details;
-- --------------------------------------------------------
# Q13. Write a query to display the rounding of lowest integer
-- value of monthlycallservices and rounding of highest value of totalamount
-- for those paymentmwthod is electronic check mode.
select floor(monthlyservicecharges),ceil(totalamount) from churn_details
where paymentmethod like 'electronic%check';

# Q14. Rename the table churn1 to 'churn_details'.
 rename table churn1 to churn_details;
 
 # Q15 Write a query to  create a display a column new_amount that contains the sum of the totalamount and monthlyservicecharges.
 alter table churn_details add new_amount int;
 update churn_details set new_amount = totalamount + monthlyservicecharges;
 
 # Q16 ranme column new_amount to amount.
 alter table churn_details rename column new_amount to amount;
 alter table churn_details rename column new_amount to amount;
 
 # Q17 drop the column 'amount' from the churn_details.
 alter table churn_details drop amount;
 
# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerID, InternetConnection,gender from churn_details where internetconnection like '_i%';

# Q19. Find the records where the tenure is 6x, where x is any number.
 select * from churn_details where tenure like '6_';
 ------------------ ------------------------------------------------------------
 # Used detaset : new_cricket.csv
 
 select * from new_cricket;
 -------------------- ----------------------------------------------------------
 # Q20 Write a query to display the player name in capital letter and arrange in alphabetic order 
 -- along with the charisma display 0 for whom the charisma value is null.
 select upper(player_name),ifnull(charisma,0) from new_cricket
 order by player_name,charisma;
use hr;
with cte as 
(select max(salary) from employees where salary <
(select max(salary) from employees)
)
select * from cte;


wITH CTE AS (
  SELECT employee_id, manager_id
  FROM employees
  WHERE manager_id IS NULl
)
SELECT * FROM CTE;
