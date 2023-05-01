-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT camp.backers_count,
camp.cf_id
INTO live_backers
FROM campaign AS camp
WHERE (camp.outcome = 'live')
ORDER BY (camp.backers_count) DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (b.cf_id), b.cf_id
INTO confirmed_live_backers
FROM backers AS b
GROUP BY b.cf_id
ORDER BY COUNT (b.cf_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT cnt.first_name, cnt.last_name, cnt.email, camp.goal - camp.pledged AS remaining_goal_amount
INTO live_projects_contact_goal
FROM contacts AS cnt
JOIN campaign AS camp
ON cnt.contact_id = camp.contact_id
WHERE camp.outcome = 'live'
ORDER BY remaining_goal_amount DESC;



-- Check the table
SELECT * FROM live_projects_contact_goal;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, camp.cf_id,
camp.company_name, camp.description, camp.end_date, camp.goal - camp.pledged AS Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM campaign AS camp
JOIN backers AS b
ON camp.cf_id = b.cf_id
WHERE camp.outcome = 'live'
ORDER BY b.email;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;





