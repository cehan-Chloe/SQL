SELECT HACKERS.HACKER_ID, NAME
FROM HACKERS 
JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID 
JOIN CHALLENGES ON CHALLENGES.CHALLENGE_ID = SUBMISSIONS.CHALLENGE_ID 
JOIN DIFFICULTY ON DIFFICULTY.DIFFICULTY_LEVEL = CHALLENGES.DIFFICULTY_LEVEL AND SUBMISSIONS.SCORE = DIFFICULTY.SCORE 
GROUP BY HACKERS.HACKER_ID, NAME
HAVING COUNT(SUBMISSIONS.HACKER_ID) > 1
ORDER BY COUNT(SUBMISSIONS.HACKER_ID) DESC, SUBMISSIONS.HACKER_ID ASC
