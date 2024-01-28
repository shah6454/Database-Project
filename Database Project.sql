-- Creating the Course/Proggram table
CREATE TABLE Program (
    ProgramID INT PRIMARY KEY,
    Level VARCHAR(255),
    Sessions INT,
    Instructor VARCHAR(255),
    StartDate DATE,
    LessonTime VARCHAR(50)
);
DESCRIBE Program;
INSERT INTO Program(ProgramID, Level, Sessions, Instructor, StartDate, LessonTime) VALUES
	(1, 'Beginner', 10, 'John Doe', '2024-02-01', 'Morning');
    
    SELECT * FROM Program;
    INSERT INTO Program(ProgramID, Level, Sessions, Instructor, StartDate, LessonTime) VALUES
    (2, 'Intermediate', 8, 'Jane Smith', '2024-02-05', 'Afternoon');
    
    SELECT * FROM Program;
    INSERT INTO Program(ProgramID, Level, Sessions, Instructor, StartDate, LessonTime) VALUES
    (3, 'Advanced', 12, 'Bob Johnson', '2024-02-10', 'Evening');
  
  SELECT * FROM Program;
    INSERT INTO Program(ProgramID, Level, Sessions, Instructor, StartDate, LessonTime) VALUES
    (4, 'Extra Advanced', 14, 'Alex Davis', '2024-02-17', 'Afternoon');
    
    SELECT * FROM Program;
    INSERT INTO Program(ProgramID, Level, Sessions, Instructor, StartDate, LessonTime) VALUES
    (5, 'Extra Advanced', 11, 'Rob Smith', '2024-02-21', 'Evening');
    
  -- Creating the Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Firstname VARCHAR(255),
    Surname VARCHAR(255),
    DOB DATE,
    Address VARCHAR(255),
    City VARCHAR(255)
);
DESCRIBE members;
INSERT INTO Members(MemberID, Firstname, Surname, DOB, Address, City) VALUES
(1, 'Alice', 'Johnson', '1990-05-15', '123 Main St', 'CityA');

SELECT * FROM Members;
INSERT INTO Members(MemberID, Firstname, Surname, DOB, Address, City) VALUES
(2, 'Bob', 'Smith', '1985-08-20', '456 Oak St', 'CityB');

SELECT * FROM Members;
INSERT INTO Members(MemberID, Firstname, Surname, DOB, Address, City) VALUES
(3, 'Charlie', 'Davis', '1995-03-10', '789 Pine St', 'CityC');

SELECT * FROM Members;
INSERT INTO Members(MemberID, Firstname, Surname, DOB, Address, City) VALUES
(4, 'Max', 'Ring', '1996-01-18', '389 Line St', 'CityD');

SELECT * FROM Members;
INSERT INTO Members(MemberID, Firstname, Surname, DOB, Address, City) VALUES
(5, 'Rikkey', 'Nack', '1983-11-7', '982 Coin St', 'CityE');

SELECT * FROM Members;
INSERT INTO Members(MemberID, Firstname, Surname, DOB, Address, City) VALUES
(6, 'Sam', 'singh', '1975-7-9', '287 Rowe St', 'CityF');

-- Creating the Lessons table
CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY,
    ProgramID INT,
    MemberID INT,
    FOREIGN KEY (ProgramID) REFERENCES Program(ProgramID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
DESCRIBE Lessons;
INSERT INTO Lessons(LessonID, ProgramID, MemberID) VALUES
(101, 1, 1);

SELECT * FROM Lessons;
INSERT INTO Lessons(LessonID, ProgramID, MemberID) VALUES
(102, 1, 2);

SELECT * FROM Lessons;
INSERT INTO Lessons(LessonID, ProgramID, MemberID) VALUES
(103, 2, 3);

SELECT * FROM Lessons;
INSERT INTO Lessons(LessonID, ProgramID, MemberID) VALUES
 (104, 3, 1);
 
SELECT * FROM Lessons;
INSERT INTO Lessons(LessonID, ProgramID, MemberID) VALUES
(105, 3, 2);

SELECT * FROM Lessons;
INSERT INTO Lessons(LessonID, ProgramID, MemberID) VALUES
(106, 2, 3);



-- Use the SQL AND, OR, and NOT Operators in your query:
-- a. Where ProgramID is equal to a number below 5 and the instructor is not null:
SELECT * FROM Program
WHERE ProgramID < 5 AND Instructor IS NOT NULL;

-- b. Where ProgramID is equal to a number above 5 and the lesson time is in the morning or afternoon:
SELECT * FROM Program
WHERE ProgramID > 5 AND (LessonTime = 'Morning' OR LessonTime = 'Afternoon');

-- c. Order by the above results by:
-- StartDate in the "Program" table:
SELECT * FROM Program
WHERE ProgramID < 5 AND Instructor IS NOT NULL
ORDER BY StartDate;

-- MemberID in the "Members" table:
SELECT * FROM Program
WHERE ProgramID > 5 AND (LessonTime = 'Morning' OR LessonTime = 'Afternoon')
ORDER BY (SELECT MemberID FROM Lessons WHERE ProgramID = Program.ProgramID LIMIT 1);

-- UPDATE the following:
-- a. Members table, change the addresses of any three members:
UPDATE Members
SET Address = 'New Address'
WHERE MemberID IN (1, 2, 3)
LIMIT 3;

-- b. Program table, change the StartDate and LessonTime for three of the sessions:
UPDATE Program
SET StartDate = '2024-02-01', LessonTime = 'Evening'
WHERE ProgramID IN (1, 2, 3)
LIMIT 3;

-- Use the SQL MIN() and MAX() Functions:
-- a. Smallest and largest value of the LessonID column in the "Lessons" table:
SELECT MIN(LessonID), MAX(LessonID)
FROM Lessons;

-- b. Smallest and largest value of the MemberID column in the "Members" table:
SELECT MIN(MemberID), MAX(MemberID)
FROM Members;

-- Use the SQL COUNT(), AVG(), and SUM() Functions:
-- a. Total number of members in the "Members" table:
SELECT COUNT(*)
FROM Members;

-- b. Total number of sessions in the "Members" table:
SELECT COUNT(*)
FROM Lessons;

-- c. Average session time for all "Sessions" in the Program table:
SELECT AVG(Sessions)
FROM Program;

-- WILDCARD queries (LIKE operator):
-- a. Find all people from the "Members" table whose last name starts with A:
SELECT * FROM Members
WHERE Surname LIKE 'A%';

-- b. Find all people from the "Members" table whose last name ends with A:
SELECT * FROM Members
WHERE Surname LIKE '%A';

-- c. Find all people from the "Members" table that have "ab" in any position in the last name:
SELECT * FROM Members
WHERE Surname LIKE '%ab%';

-- d. Find all people from the "Members" table that have "b" in the second position in their first name:
SELECT * FROM Members
WHERE Firstname LIKE '_b%';

-- e. Find all people from the "Members" table whose last name starts with "a" and is at least 3 characters in length:
SELECT * FROM Members
WHERE Surname LIKE 'a%' AND LENGTH(Surname) >= 3;

-- f. Find all people from the "Members" table whose last name starts with "a" and ends with "y":
SELECT * FROM Members
WHERE Surname LIKE 'a%y';

-- g. Find all people from the "Members" table whose last name does not start with "a" and ends with "y":
SELECT * FROM Members
WHERE Surname NOT LIKE 'a%y';



