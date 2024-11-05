CREATE TABLE Students(
student_id INT PRIMARY KEY,
student_Name VARCHAR(50) NOT NULL,
student_Last_Name VARCHAR(50) NOT NULL, 
birth_date VARCHAR(10) NOT NULL,
enrollment_year SMALLINT NOT NULL,
subject_id INT,

FOREIGN KEY (subject_id)
REFERENCES Subjects(subject_id));

CREATE TABLE Professors(
professor_id INT PRIMARY KEY,
professor_first_name VARCHAR(50) NOT NULL,
professor_last_name VARCHAR(50)NOT NULL,
department VARCHAR(50)NOT NULL,
hire_date VARCHAR(10));

CREATE TABLE Subjects(
subject_id INT PRIMARY KEY, 
subject_name VARCHAR(50));

INSERT INTO Subjects(subject_id,subject_name)
VALUES
(1,'filozofija1'),
(2,'matematika1'),
(3,'matematika2'),
(4,'biologija'),
(5,'filozofija2');

INSERT INTO Students (student_id,student_Name, student_Last_Name, birth_date, enrollment_year,subject_id)
VALUES
(1,'Andrea','Zurevska','25.01.1989',2008,2),
(2,'Marko', 'Manojlovski','16.09.1993',2012,4),
(3,'Mila','Nikolovska','04.12.1992',2011,1),
(4,'Mladen','Mihajlov','19.09.1989',2008,2),
(5,'Dragan','Veljanoski','13.04.1989',2008,2),
(6,'Sanja','Siljanovska','02.04.1990',2009,4), 
(7,'Leon','Janevski','01.07.1990',2009,3), 
(8,'Aleksandar','Trajkov','16.08.1992',2011,3),
(9,'Gjorgji','Lazov','10.10.1989',2008,4),
(10,'Dragana','Mihajlovska','16.11.1992',2011,3);

INSERT INTO Professors(professor_id, professor_first_name, professor_last_name, department, hire_date)
VALUES
(1,'Mihaela','Gjurcinovska','filozofija','01.09.2005'),
(2,'Trajko','Milanovski','matematika','01.09.2004'),
(3,'Milosh','Dejanovic','matematika','01.05.2003'),
(4,'Simona','Mihaljovska','biologija','01.09.2003'),
(5,'Vaska','Ignatovska','fizika','01.09.2000'),
(6,'Vlatko','Sazdovski','fizika','01.09.1999'),
(7,'Zhivka','Dimovska','filozofija','01.03.2004'),
(8,'Nevena','Jakimovska','matematika','01.09.2003');

CREATE TABLE Professors_Subjects(
Professors_subjects_id INT PRIMARY KEY,
Professor_id INT, 
Subject_id INT,
FOREIGN KEY (Professor_id) REFERENCES Professors(professor_id),
FOREIGN KEY (Subject_id) REFERENCES Subjects(subject_id));

INSERT INTO Professors_Subjects (professors_subjects_id, Professor_id, subject_id)
VALUES 
(1,3,2),
(2,1,1),
(3,2,2),
(4,4,4),
(5,5,3),
(6,6,2),
(7,7,5),
(8,8,3),
(9,1,5);

SELECT student_Name,student_Last_Name FROM Students WHERE enrollment_year>2008;

SELECT*FROM Professors_Subjects ps
INNER JOIN Professors p
on ps.Professor_id=p.professor_id
INNER JOIN Subjects s
on ps.Subject_id=s.subject_id
WHERE p.professor_id=1;

SELECT S.student_Name, S.student_Last_Name,s.enrollment_year, P.professor_first_name, P.professor_last_name, P.department FROM Students S
inner join Professors_Subjects ps
ON ps.Subject_id=s.subject_id
inner join Professors p
ON ps.Professor_id=p.professor_id
order by p.department desc;