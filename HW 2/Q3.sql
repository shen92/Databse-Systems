--  Using Oracle Live SQL
--  livesql.oracle.com

--	Create table with given schema:
CREATE TABLE Projects ( 
    PID CHAR(4) NOT NULL, 
    Step INTEGER NOT NULL, 
    Status CHAR(1),
    PRIMARY KEY (PID, Step)
);

--	Insert rows with given schema:
INSERT INTO Projects(PID, Step, Status) VALUES ('P100', 0, 'C');
INSERT INTO Projects(PID, Step, Status) VALUES ('P100', 1, 'W');
INSERT INTO Projects(PID, Step, Status) VALUES ('P100', 2, 'W');

INSERT INTO Projects(PID, Step, Status) VALUES ('P201', 0, 'C');
INSERT INTO Projects(PID, Step, Status) VALUES ('P201', 1, 'C');

INSERT INTO Projects(PID, Step, Status) VALUES ('P333', 0, 'W');
INSERT INTO Projects(PID, Step, Status) VALUES ('P333', 1, 'W');
INSERT INTO Projects(PID, Step, Status) VALUES ('P333', 2, 'W');
INSERT INTO Projects(PID, Step, Status) VALUES ('P333', 3, 'W');

--	Test cases:
INSERT INTO Projects(PID, Step, Status) VALUES ('P500', 0, 'C');

INSERT INTO Projects(PID, Step, Status) VALUES ('P600', 0, 'C');
INSERT INTO Projects(PID, Step, Status) VALUES ('P600', 1, 'C');
INSERT INTO Projects(PID, Step, Status) VALUES ('P600', 2, 'W');

--	Answer query:
SELECT DISTINCT p1.PID 
FROM Projects p1
WHERE (p1.Step = 0 AND p1.Status = 'C')
AND 'W' = ALL (
    SELECT p2.Status
    FROM Projects p2
    WHERE p1.PID = p2.PID AND p2.Step > 0
);

--	Explnation:

--	First we pick the PIDs with Step 0 is completed, i.e. Status is 'C', 
--	then we using the PID to do a sub query which checks if the given PID's Step that is greater than 0 's Status is ALL 'W'.

--	Drop the table:
DROP TABLE Projects;