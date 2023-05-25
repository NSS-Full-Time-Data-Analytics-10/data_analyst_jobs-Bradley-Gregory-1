--Data Analyst Project

--1
SELECT COUNT(*)
FROM data_analyst_jobs;

--2
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--3A
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';

--3B
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location ='KY';

--4
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4
	
--5 
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000

--6 -- Use != to get rid of thing in the data. See below:
SELECT location, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL 
	AND location != ' USA' 
	AND location !='REMOTE' 
	AND location !='DC'
GROUP BY location
ORDER BY avg_rating DESC NULLS LAST;

--7
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--8
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--9
SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company 
	HAVING SUM(review_count) > 5000 

--10
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL
		AND review_count >5000
GROUP BY company
ORDER BY avg_rating DESC;

--11
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'

--12
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'

--BONUS QUESTION:
SELECT domain, COUNT(title) AS hard_to_fill_jobs
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' 
	AND days_since_posting > 21 
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill_jobs DESC;

