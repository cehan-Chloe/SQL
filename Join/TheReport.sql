SELECT (CASE WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME ELSE NULL END), GRADES.GRADE, STUDENTS.MARKS
FROM STUDENTS JOIN GRADES
ON STUDENTS.MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADES.GRADE DESC, STUDENTS.NAME, STUDENTS.MARKS
