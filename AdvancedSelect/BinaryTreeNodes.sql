SELECT N, CASE WHEN P IS NULL THEN 'Root'
                WHEN (SELECT COUNT(*) FROM BST WHERE P = B.N) > 0 THEN 'Inner'
                ELSE 'Leaf'
                END
FROM BST AS B
ORDER BY N
/*USE EXISTS*/
SELECT N, CASE WHEN P IS NULL THEN 'Root'
                WHEN EXISTS (SELECT * FROM BST WHERE P = B.N) THEN 'Inner'
                ELSE 'Leaf'
                END
FROM BST AS B
ORDER BY N
