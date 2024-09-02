/* Loyal User Reward 
The marketing team wants to reward the most loyal users, i.e., those who have 
been using the platform for the longest time. Identify the five oldest users on 
Instagram from the provided database.
*/
select * from users
order by created_at
limit 5;

/* Inactive User engagement 
The team wants to encourage inactive users to start posting by sending them promotional emails.
 Identify users who have never posted a single photo on Instagram. */
Select users.id, username, created_at from photos
right join users
on photos.user_id = users.id
where image_url is null;

/*contest Winner Declaration 
The team has organized a contest where the user with the most likes on a single 
 photo wins. Determine the winner of the contest and provide their details to the 
 team. */
select username, photo_id, count(likes.user_id) as Total_likes
		from likes
        inner join photos on photos.id = likes.photo_id
        inner join users on users.id = photos.users_id
        group by photo_id order by count(user_id) desc
        limit 1;
        
/*Hashtag Research
- A partner brand wants to know the most popular hashtags to use in their posts to 
 reach the most people. Identify and suggest the top five most commonly used 
 hashtags on the platform. */

Select tag_name, count(tag_id) as times_used from tags
inner join photo_tags
			on tag_id =	photo_tags.tag_id
group by tag_name
order by count(tag_id) desc
limit 5;

/* Ad Campaign Launch 
The team wants to know the best day of the week to launch ads. Determine the day 
 of the week when most users register on Instagram. Provide insights on when to 
 schedule an ad campaign. */
Select dayname(created_at) as day_of_the_week,
count(dayname(created_at) as user_registered from users
group by dayname(created_at)
order by count(dayname(created_at)) Desc;

/* INVESTOR METRICS
 User Engagement 
Investors want to know if users are still active and posting on Instagram or if they 
 are making fewer posts. Calculate the average number of posts per user on 
 Instagram. Also, provide the total number of photos on Instagram divided by the 
 total number of users. */
Select (count(image_url)/count(distinct(user_id))) as avg_post_per_user,
(count(image_url)/count(user_id)) as Total_post_by_total_user from photos
inner join users on users.id = photos.user_id;

/* Bots & Fake Accounts
Investors want to know if the platform is crowded with fake and dummy accounts. 
 Identify users (potential bots) who have liked every single photo on the site, as this is 
 not typically possible for a normal user. */
Selct user_id, username, count(user_id) as Total_post_liked from likes
join users on users.id = likes.user_id
group by user_id
having count(user_id) = 257;


