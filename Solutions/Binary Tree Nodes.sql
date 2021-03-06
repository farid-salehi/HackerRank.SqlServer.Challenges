SELECT b.N,
CASE
    WHEN b.P IS NULL  THEN 'Root'
    WHEN EXISTS  (SELECT TOP 1 * FROM BST temp WHERE temp.P = b.N )  THEN 'Inner'ELSE 'Leaf'
END 
FROM BST b
ORDER BY N