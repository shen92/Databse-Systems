--  Using Oracle Live SQL
--  livesql.oracle.com

--	Create table with given schema:
CREATE TABLE Enrollment ( 
    SID INTEGER NOT NULL, 
    ClassName CHAR(30) NOT NULL, 
    Grade CHAR(1),
    PRIMARY KEY (SID, ClassName)
);

--	Insert rows with given schema:
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (123, 'Processing', 'A');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (123, 'Python', 'B');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (123, 'Scratch', 'B');

INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (662, 'Java', 'B');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (662, 'Python', 'A');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (662, 'JavaScript', 'A');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (662, 'Scratch', 'B');

INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (345, 'Scratch', 'A');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (345, 'JavaScript', 'B');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (345, 'Python', 'A');

INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (555, 'Python', 'B');
INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (555, 'JavaScript', 'B');

INSERT INTO Enrollment(SID, ClassName, Grade) VALUES (213, 'JavaScript', 'A');

--	Answer query:
SELECT ClassName, COUNT(*) AS Total
FROM Enrollment
GROUP BY ClassName
ORDER BY Total DESC;

--	Explnation:

-- 	Group the Enrollment table according to the ClassName, 
--	then using aggreate function COUNT() to calculate the number of rows in each group,
--	finally sort the Total in a decreasing order.

--	Drop the table:
DROP TABLE Enrollment;