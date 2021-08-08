--  Using Oracle Live SQL
--  livesql.oracle.com

--	Create tables with given schema:
CREATE TABLE Teach ( 
    Instructor CHAR(64) NOT NULL,
    Subject CHAR(64) NOT NULL,
    PRIMARY KEY (Instructor, Subject)
);

CREATE TABLE Subjects ( 
    Subject CHAR(64) NOT NULL,
    PRIMARY KEY (Subject)
);

--	Insert rows with given schema:
INSERT INTO Teach(Instructor, Subject) VALUES ('Aleph', 'Scratch');
INSERT INTO Teach(Instructor, Subject) VALUES ('Aleph', 'Java');
INSERT INTO Teach(Instructor, Subject) VALUES ('Aleph', 'Processing');

INSERT INTO Teach(Instructor, Subject) VALUES ('Bit', 'Python');
INSERT INTO Teach(Instructor, Subject) VALUES ('Bit', 'JavaScript');
INSERT INTO Teach(Instructor, Subject) VALUES ('Bit', 'Java');

INSERT INTO Teach(Instructor, Subject) VALUES ('CRC', 'Python');
INSERT INTO Teach(Instructor, Subject) VALUES ('CRC', 'JavaScript');

INSERT INTO Teach(Instructor, Subject) VALUES ('Dat', 'Scratch');
INSERT INTO Teach(Instructor, Subject) VALUES ('Dat', 'Python');
INSERT INTO Teach(Instructor, Subject) VALUES ('Dat', 'JavaScript');

INSERT INTO Teach(Instructor, Subject) VALUES ('Emscr', 'Scratch');
INSERT INTO Teach(Instructor, Subject) VALUES ('Emscr', 'Processing');
INSERT INTO Teach(Instructor, Subject) VALUES ('Emscr', 'JavaScript');
INSERT INTO Teach(Instructor, Subject) VALUES ('Emscr', 'Python');

INSERT INTO Subjects(Subject) VALUES ('JavaScript');
INSERT INTO Subjects(Subject) VALUES ('Scratch');
INSERT INTO Subjects(Subject) VALUES ('Python');

--	Answer query:
SELECT Instructor
FROM Teach
WHERE Subject = 'JavaScript'
INTERSECT
SELECT Instructor
FROM Teach
WHERE Subject = 'Scratch'
INTERSECT
SELECT Instructor
FROM Teach
WHERE Subject = 'Python';

--	Explnation:

--	Using INTERSECT to get the Instructors who teaches Subject 'JavaScript', 'Scratch' and 'Python'.

--	Drop the tables:
DROP TABLE Teach;
DROP TABLE Subjects;