SELECT H.HACKER_ID, H.NAME, COUNT(C.CHALLENGE_ID) AS CHALLENGES_CREATED
FROM HACKERS H
JOIN CHALLENGES C ON H.HACKER_ID = C.HACKER_ID
GROUP BY H.HACKER_ID, H.NAME
HAVING
      CHALLENGES_CREATED = (SELECT COUNT(CHALLENGE_ID) AS CCOUNT
                            FROM CHALLENGES
                            GROUP BY HACKER_ID
                            ORDER BY CCOUNT DESC
                            LIMIT 1)
      OR 
      CHALLENGES_CREATED IN (SELECT COUNTTABLE.CCOUNT
                             FROM (SELECT COUNT(CHALLENGE_ID) AS CCOUNT
                                   FROM CHALLENGES C
                                   GROUP BY HACKER_ID
                                  ) AS COUNTTABLE
                             GROUP BY COUNTTABLE.CCOUNT
                             HAVING COUNT(*) = 1
                            )
ORDER BY CHALLENGES_CREATED DESC, H.HACKER_ID
