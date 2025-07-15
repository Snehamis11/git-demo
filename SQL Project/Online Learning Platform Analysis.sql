-- ------ CREATE AND ACCESS DATABASE ----------
CREATE DATABASE OnlineLearningPlatform;
USE OnlineLearningPlatform;

-- ------------------------------------------
-- Online Learning Platform
-- ------------------------------------------

-- 1. Users Table
CREATE TABLE Users (
    UserID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    UserType VARCHAR(20), 
    Gender CHAR(1),
    Age INT,
    Location VARCHAR(100),
    RegistrationDate DATE
);

-- 2. InstructorDetails Table
CREATE TABLE InstructorDetails (
    InstructorID VARCHAR(10) PRIMARY KEY,
    Profession VARCHAR(100),
    Industry VARCHAR(100),
    InstructorType VARCHAR(20), 
    TeachingExperience VARCHAR(20),
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

-- 3. Courses Table
CREATE TABLE Courses (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(150),
    Category VARCHAR(50),
    InstructorID VARCHAR(10),
    DurationHrs DECIMAL(5,2),
    Level VARCHAR(20), 
    Price DECIMAL(8,2),
    Rating DECIMAL(3,1),
    NumOfLessons INT,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

-- 4. Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID VARCHAR(10) PRIMARY KEY,
    UserID VARCHAR(10),
    CourseID VARCHAR(10),
    EnrollmentDate DATE,
    Status VARCHAR(20), 
    CompletionDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 5. Payments Table
CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    UserID VARCHAR(10),
    CourseID VARCHAR(10),
    AmountPaid DECIMAL(8,2),
    PaymentDate DATE,
    PaymentMode VARCHAR(50), 
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 6. Module_Progress Table
CREATE TABLE Module_Progress (
    ProgressID VARCHAR(10) PRIMARY KEY,
    UserID VARCHAR(10),
    CourseID VARCHAR(10),
    ModuleNumber INT,
    ModuleTitle VARCHAR(150),
    ModuleProgressStage VARCHAR(20), 
    ProgressPercent DECIMAL(5,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 7. Feedback Table
CREATE TABLE Feedback (
    FeedbackID VARCHAR(10) PRIMARY KEY,
    UserID VARCHAR(10),
    CourseID VARCHAR(10),
    Rating DECIMAL(2,1), -- 1.0 to 5.0
    Review TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ------------------------------------------
-- INSERT STATEMENTS START HERE
-- ------------------------------------------

INSERT INTO Users VALUES
 ('U001', 'Ankit Sharma', 'ankit@gmail.com', 'Student', 'M', 25, 'Delhi', '2024-01-10'),
 ('U002', 'Priya Mehta', 'priya@yahoo.com', 'Student', 'F', 29, 'Mumbai', '2023-12-20'),
 ('U003', 'John Doe', 'john@doe.com', 'Instructor', 'M', 35, 'Bangalore', '2022-06-15'),
 ('U004', 'Akshay Kumar', 'akshay@edu.com', 'Instructor', 'M', 40, 'London', '2021-03-22'),
 ('U005', 'Sara Ali', 'sara@gmail.com', 'Student', 'F', 31, 'Hyderabad', '2024-02-11'),
 ('U006', 'Rajesh Khanna', 'rajesh@live.com', 'Student', 'M', 28, 'Pune', '2023-11-05'),
 ('U007', 'Rekha Sharma', 'rekha@domain.com', 'Student', 'F', 26, 'Chennai', '2024-03-01'),
 ('U008', 'Neha Singh', 'neha@gmail.com', 'Student', 'F', 30, 'Ahmedabad', '2023-10-19'),
 ('U009', 'Ravi Verma', 'ravi@live.com', 'Student', 'M', 27, 'Jaipur', '2023-08-05'),
 ('U010', 'Amit Chauhan', 'amit@edu.com', 'Student', 'M', 32, 'Indore', '2024-01-25'),
 ('U011', 'Nisha Patel', 'nisha@xyz.com', 'Student', 'F', 29, 'Kolkata', '2023-12-08'),
 ('U012', 'Manoj Bajpayee', 'manoj@abc.com', 'Student', 'M', 35, 'Lucknow', '2023-11-15'),
 ('U013', 'Emily Wilson', 'emily@foreign.com', 'Instructor', 'F', 33, 'New York', '2022-02-18'),
 ('U014', 'Vikram Desai', 'vikram@domain.com', 'Instructor', 'M', 38, 'Singapore', '2021-07-07'),
 ('U015', 'Harpreet Kaur', 'harpreet@edu.com', 'Student', 'F', 28, 'Amritsar', '2024-02-20'),
 ('U016', 'Pooja Nair', 'pooja@gmail.com', 'Student', 'F', 27, 'Mumbai', '2024-03-10'),
 ('U017', 'Kunal Kapoor', 'kunal@edu.com', 'Student', 'M', 31, 'Mumbai', '2024-03-12'),
 ('U031', 'Ritika Mehra', 'ritikamehra@example.com', 'Instructor', 'F', 35, 'Mumbai', '2023-08-10'),
 ('U032', 'Amit Bansal', 'amitbansal@example.com', 'Instructor', 'M', 38, 'Delhi', '2023-07-05'),
 ('U033', 'Sneha Rathi', 'sneharathi@example.com', 'Instructor', 'F', 32, 'Pune', '2023-09-15'),
 ('U034', 'Rajeev Nair', 'rajeevnair@example.com', 'Instructor', 'M', 40, 'Chennai', '2023-06-20'),
 ('U035', 'Divya Joshi', 'divyajoshi@example.com', 'Instructor', 'F', 34, 'Hyderabad', '2023-10-01'),
 ('U036', 'Tanvi Mehta', 'tanvi.mehta@example.com', 'Instructor', 'F', 33, 'Delhi', '2023-11-01'),
 ('U037', 'Yash Rajput', 'yash.rajput@example.com', 'Instructor', 'M', 36, 'Pune', '2023-10-15'),
 ('U038', 'Shweta Nair', 'shweta.nair@example.com', 'Student', 'F', 27, 'Bangalore', '2024-01-15'),
 ('U039', 'Rohan Desai', 'rohan.desai@example.com', 'Student', 'M', 29, 'Ahmedabad', '2024-01-20'),
 ('U040', 'Kavita Joshi', 'kavita.joshi@example.com', 'Student', 'F', 31, 'Mumbai', '2024-01-25'),
 ('U041', 'Pranav Iyer', 'pranav.iyer@example.com', 'Instructor', 'M', 40, 'Chennai', '2023-07-01'),
 ('U042', 'Meena Gupta', 'meena.gupta@example.com', 'Instructor', 'F', 35, 'Delhi', '2023-07-05'),
 ('U043', 'Ananya Rathi', 'ananya.r@example.com', 'Student', 'F', 26, 'Mumbai', '2024-01-10'),
 ('U044', 'Siddharth Sen', 'siddharth.s@example.com', 'Student', 'M', 28, 'Pune', '2024-01-12'),
 ('U045', 'Ravi Menon', 'ravi.menon@example.com', 'Instructor', 'M', 38, 'Delhi', '2023-09-10'),
 ('U046', 'Isha Kapoor', 'isha.kapoor@example.com', 'Instructor', 'F', 36, 'Bangalore', '2023-08-22'),
 ('U047', 'Ritu Sharma', 'ritu.sharma@example.com', 'Student', 'F', 28, 'Hyderabad', '2024-01-18'),
 ('U048', 'Karan Patel', 'karan.patel@example.com', 'Student', 'M', 30, 'Pune', '2024-01-19'),
 ('U049', 'Sameer Khan', 'sameer.khan@example.com', 'Instructor', 'M', 39, 'Lucknow', '2023-10-01'),
 ('U050', 'Divya Rawat', 'divya.rawat@example.com', 'Student', 'F', 27, 'Bhopal', '2024-01-20'),
 ('U051', 'Nitin Joshi', 'nitin.joshi@example.com', 'Student', 'M', 29, 'Kanpur', '2024-01-21'),
 ('U052', 'Arjun Malik', 'arjun.malik@example.com', 'Student', 'M', 31, 'Nagpur', '2024-01-22');

INSERT INTO InstructorDetails VALUES  
 ('U003', 'Software Engineer', 'IT', 'Premium', '6 Years'),  
 ('U004', 'Data Scientist', 'AI/ML', 'Top-rated', '10 Years'),  
 ('U013', 'Business Analyst', 'Consulting', 'Standard', '7 Years'),  
 ('U014', 'Cloud Architect', 'IT', 'Top-rated', '11 Years'),  
 ('U031', 'Full Stack Engineer', 'IT', 'Top-rated', '10 Years'),  
 ('U032', 'Product Manager', 'Management', 'Premium', '8 Years'),  
 ('U033', 'AI Researcher', 'AI/ML', 'Top-rated', '6 Years'),  
 ('U034', 'Digital Marketer', 'Marketing', 'Standard', '7 Years'),  
 ('U035', 'DevOps Specialist', 'Cloud', 'Premium', '9 Years'),  
 ('U036', 'AI Consultant', 'AI/ML', 'Top-rated', '7 Years'),  
 ('U037', 'Cloud Architect', 'Cloud', 'Premium', '10 Years'),  
 ('U041', 'Software Engineer', 'Technology', 'Top-rated', '10 Years'),  
 ('U042', 'Marketing Specialist', 'Marketing', 'Standard', '6 Years'),
 ('U045', 'Web Developer', 'IT', 'Premium', '8 Years'),
 ('U046', 'Marketing Strategist', 'Marketing', 'Standard', '7 Years'),
 ('U049', 'Data Analyst', 'Analytics', 'Standard', '6 Years');

INSERT INTO Courses VALUES
 ('C001', 'Python for Beginners', 'Programming', 'U003', 20.5, 'Basic', 999.00, 4.5, 12),
 ('C002', 'Advanced Data Science', 'Data Science', 'U004', 35.0, 'Advanced', 1999.00, 4.8, 20),
 ('C003', 'Business Analysis 101', 'Business', 'U013', 18.0, 'Intermediate', 1499.00, 4.2, 15),
 ('C004', 'Cloud Computing Essentials', 'Cloud', 'U014', 25.0, 'Basic', 1299.00, 4.6, 18),
 ('C005', 'Machine Learning Bootcamp', 'AI/ML', 'U004', 40.0, 'Advanced', 2499.00, 4.9, 25),
 ('C006', 'Full Stack Web Development Bootcamp', 'Programming', 'U031', 42.0, 'Advanced', 2599.00, 4.8, 45),
 ('C007', 'Product Management Masterclass', 'Management', 'U032', 35.0, 'Intermediate', 1899.00, 4.6, 28),
 ('C008', 'Generative AI with ChatGPT & LLMs', 'AI/ML', 'U033', 25.0, 'Advanced', 2799.00, 4.7, 22),
 ('C009', 'Digital Marketing & SEO Strategy', 'Marketing', 'U034', 30.0, 'Basic', 1499.00, 4.4, 26),
 ('C010', 'DevOps & Cloud Deployment Essentials', 'Cloud', 'U035', 38.0, 'Intermediate', 2199.00, 4.5, 32),
 ('C011', 'Prompt Engineering with GPT', 'AI/ML', 'U036', 20.0, 'Advanced', 1899.00, 4.6, 15),
 ('C012', 'AWS DevOps Masterclass', 'Cloud', 'U037', 25.0, 'Intermediate', 2199.00, 4.5, 20),
 ('C013', 'Frontend Development with React', 'Programming', 'U041', 30.0, 'Intermediate', 1899.00, 4.6, 25),
 ('C014', 'Digital Ads and Branding', 'Marketing', 'U042', 22.0, 'Basic', 1499.00, 4.3, 18),
 ('C015', 'Advanced HTML & CSS', 'Programming', 'U045', 20.0, 'Intermediate', 1599.00, 4.4, 18),
 ('C016', 'Growth Marketing 101', 'Marketing', 'U046', 15.0, 'Basic', 1299.00, 4.3, 12),
 ('C017', 'Excel for Data Analysis', 'Data', 'U049', 12.0, 'Basic', 999.00, 4.1, 10);

INSERT INTO Enrollments VALUES
 ('E001', 'U001', 'C001', '2024-02-01', 'Completed', '2024-03-10'),
 ('E002', 'U002', 'C002', '2024-01-15', 'Active', NULL),
 ('E003', 'U005', 'C003', '2024-03-01', 'Dropped', '2024-03-15'),
 ('E004', 'U006', 'C004', '2024-03-12', 'Active', NULL),
 ('E005', 'U007', 'C001', '2024-03-20', 'Completed', '2024-04-18'),
 ('E006', 'U008', 'C005', '2024-04-01', 'Completed', '2024-05-09'),
 ('E007', 'U002', 'C003', '2024-03-20', 'Completed', '2024-04-25'),
 ('E008', 'U010', 'C002', '2024-04-01', 'Dropped', NULL),
 ('E009', 'U011', 'C003', '2024-04-05', 'Completed', '2024-05-30'),
 ('E010', 'U012', 'C004', '2024-04-10', 'Active', NULL),
 ('E011', 'U015', 'C005', '2024-04-15', 'Completed', '2024-06-01'),
 ('E012', 'U002', 'C001', '2025-01-05', 'Active', NULL),
 ('E013', 'U005', 'C005', '2025-01-10', 'Dropped', NULL),
 ('E014', 'U006', 'C003', '2025-01-20', 'Completed', '2025-03-15'),
 ('E015', 'U007', 'C004', '2025-02-01', 'Completed', '2025-03-25'),
 ('E016', 'U043', 'C013', '2024-03-01', 'Active', NULL),
 ('E017', 'U044', 'C014', '2024-03-02', 'Active', NULL),
 ('E018', 'U047', 'C015', '2024-03-10', 'Active', NULL),
 ('E019', 'U048', 'C016', '2024-03-12', 'Active', NULL),
 ('E020', 'U050', 'C017', '2024-03-15', 'Dropped', NULL),
 ('E021', 'U051', 'C017', '2024-03-15', 'Dropped', NULL),
 ('E022', 'U052', 'C017', '2024-03-15', 'Completed', '2024-04-15');
 
INSERT INTO Payments VALUES
 ('P001', 'U001', 'C001', 999.00, '2024-02-01', 'Card'),
 ('P002', 'U002', 'C002', 1999.00, '2024-01-15', 'UPI'),
 ('P003', 'U005', 'C003', 1499.00, '2024-03-01', 'Wallet'),
 ('P004', 'U006', 'C004', 1299.00, '2024-03-12', 'Card'),
 ('P005', 'U007', 'C001', 999.00, '2024-03-20', 'UPI'),
 ('P006', 'U008', 'C005', 2499.00, '2024-04-01', 'NetBanking'),
 ('P007 ', 'U009', 'C001', 999.00, '2024-04-05', 'Card'),
 ('P008', 'U010', 'C002', 1999.00, '2024-04-10', 'UPI'),
 ('P009', 'U011', 'C003', 1499.00, '2024-04-15', 'Wallet'),
 ('P010', 'U012', 'C004', 1299.00, '2024-04-20', 'Card'),
 ('P011', 'U015', 'C005', 2499.00, '2024-04-25', 'UPI');

INSERT INTO Module_Progress VALUES
 ('MP001', 'U001', 'C001', 1, 'Introduction to Python', 'Completed', 100.00),
 ('MP002', 'U002', 'C002', 2, 'Exploratory Data Analysis', 'In Progress', 60.00),
 ('MP003', 'U005', 'C003', 1, 'Introduction to BA', 'Dropped', 20.00),
 ('MP004', 'U006', 'C004', 1, 'Cloud Basics', 'In Progress', 45.00),
 ('MP005', 'U007', 'C001', 2, 'Variables and Data Types', 'Completed', 100.00),
 ('MP006', 'U008', 'C005', 1, 'ML Introduction', 'Completed', 100.00),
 ('MP007', 'U005', 'C003', 2, 'Case Study', 'Not Started', 0.00),
 ('MP008', 'U006', 'C004', 1, 'Cloud Intro', 'In Progress', 70.00),
 ('MP009', 'U006', 'C004', 2, 'AWS Basics', 'Completed', 100.00),
 ('MP010', 'U007', 'C001', 1, 'Intro to Python', 'In Progress', 50.00),
 ('MP011', 'U008', 'C005', 1, 'ML Basics', 'Completed', 100.00),
 ('MP012', 'U008', 'C005', 2, 'Model Evaluation', 'In Progress', 60.00),
 ('MP013', 'U038', 'C006', 1, 'HTML & CSS', 'Completed', 100.00),
 ('MP014', 'U039', 'C007', 1, 'Market Research', 'Completed', 100.00),
 ('MP015', 'U040', 'C008', 1, 'Intro to GPT', 'In Progress', 60.00),
 ('MP016', 'U040', 'C009', 1, 'SEO Basics', 'Not Started', 0.00),
 ('MP017', 'U040', 'C010', 1, 'CI/CD Setup', 'Not Started', 0.00),
 ('MP018', 'U040', 'C011', 1, 'Prompt Engineering Intro', 'Not Started', 0.00),
 ('MP019', 'U040', 'C012', 1, 'Cloud Formation', 'Not Started', 0.00),
 ('MP020', 'U043', 'C013', 1, 'React Basics', 'Completed', 100.00),
 ('MP021', 'U043', 'C013', 2, 'React Hooks', 'In Progress', 70.00),
 ('MP022', 'U044', 'C014', 1, 'Marketing Funnel', 'Completed', 90.00),
 ('MP023', 'U044', 'C014', 2, 'Ad Campaigns', 'In Progress', 50.00),
 ('MP024', 'U047', 'C015', 1, 'Flexbox & Grid', 'In Progress', 80.00),
 ('MP025', 'U048', 'C016', 1, 'Intro to Growth Loops', 'Completed', 100.00);

INSERT INTO Feedback VALUES
 ('F001', 'U001', 'C001', 4.5, 'Great start for beginners!', '2024-03-11'),
 ('F002', 'U005', 'C003', 3.5, 'Good content but a bit fast paced.', '2024-03-15'),
 ('F003', 'U007', 'C001', 4.8, 'Very engaging and clear.', '2024-04-19'),
 ('F004', 'U008', 'C005', 5.0, 'Excellent deep-dive into ML.', '2024-05-10'),
('F005', 'U002', 'C003', 3.0, 'Course was informative but too long.', '2024-04-26'),
('F006', 'U008', 'C005', 5.0, 'Loved the ML content.', '2024-04-02'),
 ('F007', 'U009', 'C001', 3.8, 'Decent explanation.', '2024-04-06'),
 ('F008', 'U010', 'C002', 4.6, 'Clear and concise.', '2024-04-12'),
 ('F009', 'U011', 'C003', 3.9, 'Could be more practical.', '2024-04-17'),
 ('F010', 'U012', 'C004', 4.4, 'Enjoyed the content.', '2024-04-22'),
 ('F011', 'U015', 'C005', 4.9, 'Top-notch delivery!', '2024-04-28');
 
SELECT * FROM Users;
SELECT * FROM InstructorDetails;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;
SELECT * FROM Module_Progress;
SELECT * FROM Feedback;

-- ------------------------------------------

-- 1. List all distinct course categories and their course count sorted alphabetically.

SELECT Distinct(Category),Count(*) As CourseCount  FROM Courses GROUP BY Category ORDER BY Category;

-- 2. Show all student names, emails, and locations sorted by registration date.
SELECT  Name, Email, Location FROM Users ORDER BY RegistrationDate;

-- 3. List all UserIDs in lowercase and rename them as ID.
SELECT  Lower(UserID) as ID FROM Users;
 
-- 4. Display instructor names, their instructor type, and profession, sorted by instructor type.
SELECT u.name, i.Profession, InstructorType 
FROM InstructorDetails i JOIN Users u ON i.InstructorID=u.UserID ORDER BY InstructorType;

-- 5. Find students located in Mumbai or Delhi.
SELECT * FROM Users WHERE UserType='Student' AND Location IN( 'Delhi','Mumbai');

-- 6. Show course names and prices where the level is 'Advanced'.
SELECT CourseName,Price FROM Courses WHERE Level='Advanced';

-- 7. Get student names who are not from India (simulate with non-Indian cities)
SELECT Name, Location FROM Users WHERE Location 
NOT IN ('Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Kolkata', 'Chennai', 'Pune', 'Ahmedabad');

-- 8. List users whose names start with 'A' or 'R'.
SELECT Name FROM Users WHERE Name LIKE 'A%' OR 'R%';

-- 9. Find students who completed all modules (Progress = 100%).
SELECT  u.name,m.ModuleProgressStage, m.ProgressPercent FROM Module_Progress m
JOIN Users u ON u.UserID=m.UserID
WHERE ProgressPercent=100;

-- 10. Show users who haven’t made any payment (missing in Payments table).
SELECT * FROM Users WHERE UserID NOT IN(SELECT UserID FROM Payments);

-- 12. List courses with an average feedback rating > 4.5.
SELECT c.CourseName,c.CourseID, Avg(f.Rating) as AvgFeedbackRating FROM Courses c 
JOIN Feedback f ON f.CourseID=c.CourseID GROUP BY c.CourseID HAVING Avg(f.Rating)>4.5;

-- 13. Show top 3 most expensive courses along with their instructor.

SELECT c.CourseName, u.Name AS InstructorName, c.Price
FROM Courses c
JOIN Users u ON c.InstructorID = u.UserID
ORDER BY c.Price DESC
LIMIT 0,3;


-- 14. Find instructors who teach more than one course.
SELECT c.InstructorID,u.Name,Count(*) FROM Courses c 
JOIN Users u
ON u.UserID=c.InstructorID GROUP BY u.Name,c.InstructorID Having Count(*)>1;

-- 15. Display students who completed courses but gave feedback < 4.0.
SELECT u.UserID, u.Name, c.CourseName, e.Status, f.Rating, f.Review
FROM Enrollments e
JOIN Users u ON e.UserID = u.UserID
JOIN Feedback f ON e.UserID = f.UserID AND e.CourseID = f.CourseID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE u.UserType = 'Student'
  AND e.Status = 'Completed'
  AND f.Rating < 4.0;

-- 16. List all cities with more than 2 registered users.
SELECT Location AS City, COUNT(*) AS TotalUsers
FROM Users
GROUP BY Location
HAVING COUNT(*) > 2;

-- 17. Count how many users dropped their courses.
SELECT Count(*) FROM Enrollments WHERE Status='Dropped';

-- 18. Show total revenue collected per payment mode.
SELECT PaymentMode,SUM(AmountPaid) FROM Payments GROUP BY PaymentMode;

-- 19. List instructors who are 'Top-rated' and teach 'AI/ML' or 'Cloud'.
SELECT i.InstructorID,c.Category,i.InstructorType 
FROM InstructorDetails i 
JOIN Courses c ON i.InstructorID=c.InstructorID
WHERE InstructorType='Top-rated'
AND Category IN ('AI/ML','Cloud');

-- 20. Get student names who have completed all enrolled courses.
SELECT * FROM Enrollments;
SELECT u.UserID, u.Name
FROM Users u
WHERE u.UserType = 'Student'
  AND u.UserID IN (
    SELECT e1.UserID FROM Enrollments e1 LEFT JOIN Enrollments e2 ON e1.UserID = e2.UserID AND e2.Status <> 'Completed'
    WHERE e2.EnrollmentID IS NULL);
 
-- 21. Find the most popular course category based on enrollments.
SELECT c.Category, COUNT(*) AS TotalEnrollments
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.Category
ORDER BY TotalEnrollments DESC
LIMIT 0,1;

-- 22. Get the number of students per course level (Basic, Intermediate, Advanced).
SELECT c.Level, COUNT(DISTINCT e.UserID) AS StudentCount
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Users u ON e.UserID = u.UserID
WHERE u.UserType = 'Student'
GROUP BY c.Level;

-- 23. Show average progress percent per course across all users.
SELECT c.CourseName, 
       ROUND(AVG(mp.ProgressPercent), 2) AS AvgProgressPercent
FROM Module_Progress mp
JOIN Courses c ON mp.CourseID = c.CourseID
GROUP BY c.CourseName
ORDER BY AvgProgressPercent DESC;

-- 24. List users who started but did not complete any course.
SELECT DISTINCT u.UserID, u.Name
FROM Enrollments e
JOIN Users u ON u.UserID = e.UserID
WHERE u.UserType = 'Student'
  AND e.Status IN ('Active', 'Dropped')
  AND NOT EXISTS (
    SELECT 1 FROM Enrollments e2
    WHERE e2.UserID = u.UserID
      AND e2.Status = 'Completed'
  );
-- 25. Create a view for detailed course info joining Course, Instructor, and Category
CREATE VIEW CourseDetails AS
SELECT 
    c.CourseID,c.CourseName,c.Category,c.Level,c.Price,c.Rating,c.DurationHrs,
    u.Name AS InstructorName,id.InstructorType,id.TeachingExperience
FROM Courses c
JOIN Users u ON c.InstructorID = u.UserID
JOIN InstructorDetails id ON u.UserID = id.InstructorID;
SELECT * FROM CourseDetails;

-- 	26.List course categories with no enrollments in last 30 days (date logic).
SELECT DISTINCT c.Category
FROM Courses c
WHERE c.Category NOT IN (
    SELECT DISTINCT c2.Category
    FROM Courses c2
    JOIN Enrollments e ON c2.CourseID = e.CourseID
    WHERE e.EnrollmentDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
);

-- 27.List students who completed courses with duration > 30 hrs.
SELECT u.UserID, u.Name, c.CourseName, c.DurationHrs
FROM Enrollments e
JOIN Users u ON e.UserID = u.UserID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE u.UserType = 'Student'
  AND e.Status = 'Completed'
  AND c.DurationHrs > 30;
  
-- 28. Display instructor names, types, and profession, sorted by instructor type.
SELECT 
    u.Name AS InstructorName,
    i.InstructorType,
    i.Profession
FROM InstructorDetails i
JOIN Users u ON u.UserID = i.InstructorID
ORDER BY i.InstructorType;

-- 29. List most frequently enrolled courses.
SELECT 
    c.CourseName,
    COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName
ORDER BY TotalEnrollments DESC;

-- 30. Which course(s) have the highest number of enrollments, grouped by year?
SELECT 
    YEAR(e.EnrollmentDate) AS EnrollmentYear,
    c.CourseName,
    COUNT(*) AS TotalEnrollments
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY YEAR(e.EnrollmentDate), c.CourseName
ORDER BY EnrollmentYear, TotalEnrollments DESC;

-- 31. Use window functions to rank users by number of course completions.
SELECT UserID, Name, CompletedCount,
       RANK() OVER (ORDER BY CompletedCount DESC) AS CompletionRank
FROM (
    SELECT u.UserID, u.Name, COUNT(*) AS CompletedCount
    FROM Enrollments e
    JOIN Users u ON u.UserID = e.UserID
    WHERE e.Status = 'Completed'
    GROUP BY u.UserID, u.Name
) AS CompletionStats;

-- 32. Identify top 3 instructors using DENSE_RANK() based on total course enrollments.
SELECT InstructorID, COUNT(DISTINCT e.UserID) AS TotalStudents,
       DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT e.UserID) DESC) AS Top3
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY InstructorID;

-- 33. Rank instructors by total revenue earned using RANK() OVER (ORDER BY SUM(AmountPaid) DESC)
SELECT c.InstructorID, SUM(p. AmountPaid) AS TotalRevenue,
       RANK() OVER (ORDER BY SUM(p.AmountPaid) DESC) AS RevenueRank
FROM Courses c
JOIN Payments p ON c.CourseID = p.CourseID
GROUP BY c.InstructorID;

-- 34. Track average module progress by instructor profession.
SELECT i.Profession, ROUND(AVG(m.ProgressPercent), 2) AS AvgProgress
FROM Module_Progress m
JOIN Enrollments e ON m.UserID = e.UserID AND m.CourseID = e.CourseID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN InstructorDetails i ON c.InstructorID = i.InstructorID
GROUP BY i.Profession;

-- 35. Identify courses where more than 50% of enrolled users dropped out.(Use COUNT with Status='Dropped' and compare with total enrollments per course)
SELECT c.CourseID, c.CourseName,
       COUNT(CASE WHEN e.Status = 'Dropped' THEN 1 END) AS Dropped,
       COUNT(*) AS Total,
       ROUND((COUNT(CASE WHEN e.Status = 'Dropped' THEN 1 END) * 100.0 / COUNT(*)), 2) AS DropRate
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING DropRate > 50;

-- 36. Rank users by learning consistency (based on frequent enrollments and progress)
SELECT UserID, AVG(ProgressPercent) AS AvgProgress,
       RANK() OVER (ORDER BY AVG(ProgressPercent) DESC) AS ConsistencyRank
FROM Module_Progress
GROUP BY UserID;

-- 37. Top 5 instructors by monthly revenue.
SELECT 
    InstructorID,
    MONTH(p.PaymentDate) AS Month,
    SUM(p.AmountPaid) AS MonthlyRevenue
FROM
    Payments p
        JOIN
    Courses c ON c.CourseID = p.CourseID
GROUP BY InstructorID , MONTH(p.PaymentDate)
ORDER BY MonthlyRevenue DESC
LIMIT 5;

-- 38. Build a Course Loyalty Tier View:(CASE WHEN CompletedCourses > 5 THEN 'Gold' WHEN >3 THEN 'Silver' ELSE 'Bronze'.)
SELECT u.UserID, u.Name,
       COUNT(e.EnrollmentID) AS TotalCourses,
       CASE 
           WHEN COUNT(e.EnrollmentID) >= 5 THEN 'Gold'
           WHEN COUNT(e.EnrollmentID) >= 3 THEN 'Silver'
           ELSE 'Bronze'
       END AS LoyaltyTier
FROM Users u
JOIN Enrollments e ON u.UserID = e.UserID
GROUP BY u.UserID, u.Name;

-- 39. Identify users with many enrollments but zero payments.
SELECT u.UserID, u.Name, COUNT(e.EnrollmentID) AS Enrollments
FROM Users u
JOIN Enrollments e ON u.UserID = e.UserID
WHERE u.UserID NOT IN (SELECT DISTINCT UserID FROM Payments)
GROUP BY u.UserID, u.Name
HAVING COUNT(e.EnrollmentID) >= 2;

-- Total Revenue by Course (Highest First)
SELECT c.CourseID,c.CourseName,c.Price,SUM(p.AmountPaid) AS TotalRevenue FROM Courses c
JOIN Payments p ON c.CourseID = p.CourseID
GROUP BY c.CourseID, c.CourseName, c.Price
ORDER BY TotalRevenue DESC;
