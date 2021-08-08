--  Using Oracle Live SQL
--  livesql.oracle.com

--	Create table with a newly designed schema:
CREATE TABLE Enrollment ( 
    SID INTEGER NOT NULL, 
    ClassName CHAR(30) NOT NULL, 
    Instructor CHAR(30) NOT NULL,
    PRIMARY KEY (SID, ClassName)
);

--	Insert rows with given schema:
--	Test cases:
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (123, 'Processing', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (123, 'Python', 'Bit');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (123, 'Scratch', 'Bit');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (662, 'Java', 'Bit');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (662, 'Python', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (662, 'JavaScript', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (662, 'Scratch', 'Bit');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (345, 'Scratch', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (345, 'JavaScript', 'Bit');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (345, 'Python', 'Aleph');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (555, 'Python', 'Bit');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (555, 'JavaScript', 'CRC');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (600, 'JavaScript', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (600, 'Processing', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (600, 'Python', 'CRC');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (600, 'Scratch', 'CRC');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (700, 'Java', 'CRC');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (700, 'Python', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (700, 'JavaScript', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (700, 'Scratch', 'CRC');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (800, 'Scratch', 'Aleph');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (800, 'JavaScript', 'CRC');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (800, 'Python', 'Aleph');

INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (900, 'Python', 'CRC');
INSERT INTO Enrollment(SID, ClassName, Instructor) VALUES (900, 'JavaScript', 'CRC');

--	Answer query:
SELECT MAX(Bouns) AS MaxBouns
FROM(
    SELECT DISTINCT 20 * count(*) * 0.1 AS Bouns
    FROM Enrollment
    GROUP BY Instructor
);

--	Explnation:

--	Assume the 'hourly_rate' is 20.
--	By grouping Enrollment by Instructors, the number of each group is 'sum_of_class_counts',
--	then using aggregate function COUNT() to calculate the Bouns for each Instructor
--	Finally, consider the above query as a sub query, get the MaxBouns using aggregate function MAX().	

--	Drop the table:
DROP TABLE Enrollment;