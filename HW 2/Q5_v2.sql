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
FROM Teach JOIN Subjects
ON Teach.Subject = Subjects.Subject
GROUP BY Instructor
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subjects);

--	Explnation:

--	First join Teach and Subjects by choosing all teachers' teaching Subject in Subjects.
--	Next group by the Instuctor, if the the number of Subject an Instructor teaches equals the number of given subjects,
--	the Instructor is desired.

--	Drop the tables:
DROP TABLE Teach;
DROP TABLE Subjects;