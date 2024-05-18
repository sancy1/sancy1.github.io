-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`college` ;

CREATE TABLE IF NOT EXISTS `university`.`college` (
  `icollege_id` INT NOT NULL AUTO_INCREMENT,
  `college_name` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`icollege_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department` VARCHAR(255) NOT NULL,
  `department_code` VARCHAR(25) NOT NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_college_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college`
    FOREIGN KEY (`college_id`)
    REFERENCES `university`.`college` (`icollege_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_title` VARCHAR(225) NOT NULL,
  `course_num` INT NOT NULL,
  `credits` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`year`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`year` ;

CREATE TABLE IF NOT EXISTS `university`.`year` (
  `year_id` INT NOT NULL AUTO_INCREMENT,
  `year` INT NOT NULL,
  PRIMARY KEY (`year_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT NOT NULL AUTO_INCREMENT,
  `term_name` VARCHAR(25) NOT NULL,
  `year_id` INT NOT NULL,
  PRIMARY KEY (`term_id`),
  INDEX `fk_term_year1_idx` (`year_id` ASC) VISIBLE,
  CONSTRAINT `fk_term_year1`
    FOREIGN KEY (`year_id`)
    REFERENCES `university`.`year` (`year_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculty` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT,
  `faculty_fname` VARCHAR(225) NOT NULL,
  `faculty_lname` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`student` ;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `section_num` INT NOT NULL,
  `capacity` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `section_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `student_id`),
  INDEX `fk_section_has_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_section_has_student_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_student_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- -----------------------------------------------------
-- INSERT VALUES
-- -----------------------------------------------------
-- -----------------------------------------------------
-- COLLEGE 
-- -----------------------------------------------------
INSERT INTO college (college_name) VALUES 
('College of Physical Science and Engineering'),
('College of Business and Communication'),
('College of Language and Letters');

-- -----------------------------------------------------
-- DEPARTMENT 
-- -----------------------------------------------------
INSERT INTO department (department, department_code, college_id) VALUES 
('Computer Information Technology', 'CIT', 1),
('Economics', 'ECON', 2),
('Humanities and Philosophy', 'HUM', 3);

-- -----------------------------------------------------
-- COURSE 
-- -----------------------------------------------------
INSERT INTO course (course_title, course_num, credits, department_id) VALUES 
('Intro to Databases', 111, 3, 1),
('Econometrics', 388, 4, 2),
('Micro Economics', 150, 3, 2),
('Classical Heritage', 376, 2, 3);

-- -----------------------------------------------------
-- YEAR 
-- -----------------------------------------------------
INSERT INTO year (year) VALUES 
(2019),
(2018);

-- -----------------------------------------------------
-- TERM 
-- -----------------------------------------------------
INSERT INTO term (term_name, year_id) VALUES 
('Fall', 1), 
('Winter', 2);

-- -----------------------------------------------------
-- FACULTY 
-- -----------------------------------------------------
INSERT INTO faculty (faculty_fname, faculty_lname) VALUES 
('Marty', 'Morring'),
('Nate', 'Norris'),
('Ben', 'Barrus'),
('John', 'Jensen'),
('Bill', 'Barney');

-- -----------------------------------------------------
-- FACULTY 
-- -----------------------------------------------------
INSERT INTO student (first_name, last_name, gender, city, state, birthdate) VALUES 
('Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'),
('Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
('Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'),
('Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22'),
('Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
('Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'),
('Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'),
('Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
('Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22'),
('Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09');

-- -----------------------------------------------------
-- SECTION 
-- -----------------------------------------------------
INSERT INTO section (section_num, capacity, faculty_id, course_id, term_id) VALUES 
(1, 30, 1, 1, 1), -- CIT 111 Fall 2019 Marty Morring
(1, 50, 2, 3, 1), -- ECON 150 Fall 2019 Nate Norris
(2, 50, 2, 3, 1), -- ECON 150 Fall 2019 Nate Norris
(1, 35, 3, 2, 1), -- ECON 388 Fall 2019 Ben Barrus
(1, 30, 4, 4, 1), -- HUM 376 Fall 2019 John Jensen
(2, 30, 1, 1, 2), -- CIT 111 Winter 2018 Marty Morring
(3, 35, 5, 1, 2), -- CIT 111 Winter 2018 Bill Barney
(1, 50, 2, 3, 2), -- ECON 150 Winter 2018 Nate Norris
(2, 50, 2, 3, 2), -- ECON 150 Winter 2018 Nate Norris
(1, 30, 4, 4, 2); -- HUM 376 Winter 2018 John Jensen

-- -----------------------------------------------------
-- ENROLLMENT 
-- -----------------------------------------------------
INSERT INTO enrollment (section_id, student_id) VALUES
(1,1),
(3,1),
(4,2),
(4,3),
(5,4),
(4,5),
(5,5),
(7,6),	
(6,7),
(8,7),
(10,7),
(9,8),
(9,9),
(6,10);


-- -----------------------------------------------------
-- START QUERIES
-- -----------------------------------------------------

-- ----------------------------------------------------------------------------------------------------------

-- 1. 	Students, and their birthdays, of students born in September. Format the 
-- 		date to look like it is shown in the result set. Sort by the student's last name.

		SELECT first_name AS fname, last_name AS lname, DATE_FORMAT(birthdate, '%M %e, %Y') AS 'Sept Birthdays'
		FROM student
		WHERE MONTH(birthdate) = 9
		ORDER BY last_name;
        
-- ----------------------------------------------------------------------------------------------------------

-- 2. 	Student's age in years and days as of Jan. 5, 2017. Sorted from oldest to youngest. 
-- 		(You can assume a 365 day year and ignore leap day.) Hint: Use modulus for days left over 
-- 		after years. The 5th column is just the 3rd and 4th column combined with labels.

		SELECT last_name AS lname, first_name AS fname,
			TIMESTAMPDIFF(YEAR, birthdate, '2017-01-05') AS Years,
			MOD(DATEDIFF('2017-01-05', birthdate), 365) AS Days,
			CONCAT(TIMESTAMPDIFF(YEAR, birthdate, '2017-01-05'), '-Yrs, ', 
            MOD(DATEDIFF('2017-01-05', birthdate), 365), '-Days') AS `Years and Days`
		FROM student
		ORDER BY
			Years DESC,
			Days DESC;
            
-- ----------------------------------------------------------------------------------------------------------

-- 3.	Students taught by John Jensen. Sorted by student's last name

		SELECT student.first_name AS fname, student.last_name AS lname
		FROM student
		WHERE student.student_id IN (
				SELECT DISTINCT student.student_id
				FROM student
				JOIN enrollment ON student.student_id = enrollment.student_id
				JOIN section ON section.section_id = enrollment.section_id
				WHERE section.faculty_id = (
						SELECT faculty.faculty_id
						FROM faculty
						WHERE faculty.faculty_lname = 'Jensen' AND faculty.faculty_fname = 'John'))
		-- AND student.last_name != 'Miller'  
		ORDER BY student.last_name;

-- ----------------------------------------------------------------------------------------------------------

-- 4.	Instructors Bryce will have in Winter 2018. Sort by the faculty's last name.

		SELECT DISTINCT faculty.faculty_fname AS fname, faculty.faculty_lname AS lname
		FROM section
		JOIN faculty 
			ON section.faculty_id = faculty.faculty_id
		JOIN term 
			ON section.term_id = term.term_id
		WHERE term.term_name = 'Winter' 
			AND term.year_id = 2 
			AND faculty.faculty_lname != 'Barney'
		ORDER BY faculty.faculty_lname;

-- ----------------------------------------------------------------------------------------------------------

-- 5.	Students that take Econometrics in Fall 2019. Sort by student last name.

		SELECT DISTINCT student.first_name AS fname, student.last_name AS lname
		FROM student
		JOIN enrollment 
			ON student.student_id = enrollment.student_id
		JOIN section 
			ON enrollment.section_id = section.section_id
		JOIN course 
			ON section.course_id = course.course_id
		JOIN term 
			ON section.term_id = term.term_id
		WHERE course.course_title = 'Econometrics' 
			AND term.term_name = 'Fall' 
			AND term.year_id = 1
		ORDER BY student.last_name;

-- ----------------------------------------------------------------------------------------------------------

-- 6.	Report showing all of Bryce Carlson's courses for Winter 2018. Sort by the name of the course.

		SELECT
		department.department_code,
		course.course_num,
		course.course_title AS name
		FROM
			course
			JOIN department ON course.department_id = department.department_id
			JOIN section ON course.course_id = section.course_id
			JOIN enrollment ON section.section_id = enrollment.section_id
			JOIN student ON enrollment.student_id = student.student_id
			JOIN term ON section.term_id = term.term_id
		WHERE
			student.first_name = 'Bryce'
			AND student.last_name = 'Carlson'
			AND term.term_name = 'Winter'
			AND term.year_id = 2
		ORDER BY
			course.course_title;

-- ----------------------------------------------------------------------------------------------------------

-- 7.	The number of students enrolled for Fall 2019

		SELECT term.term_name AS term, year.year AS year, COUNT(enrollment.student_id) AS Enrollment
		FROM enrollment
		JOIN section 
			ON enrollment.section_id = section.section_id
		JOIN term 
			ON section.term_id = term.term_id
		JOIN year 
			ON term.year_id = year.year_id
		WHERE term.term_name = 'Fall' 
		AND year.year_id = 1;

-- ----------------------------------------------------------------------------------------------------------

-- 8.	The number of courses in each college. Sort by college name.

		SELECT college.college_name AS Colleges, COUNT(*) AS Courses
		FROM course
		JOIN department 
			ON course.department_id = department.department_id
		JOIN college 
			ON department.college_id = college.icollege_id
		GROUP BY college.college_name
		ORDER BY college.college_name;

-- ----------------------------------------------------------------------------------------------------------

-- 9.	The total number of students each professor can teach in Winter 2018. 
-- 		Sort by that total number of students (teaching capacity).

		SELECT faculty.faculty_fname AS fname, faculty.faculty_lname AS lname, SUM(section.capacity) AS TeachingCapacity
		FROM section
		JOIN faculty 
			ON section.faculty_id = faculty.faculty_id
		JOIN term 
			ON section.term_id = term.term_id
		JOIN year 
			ON term.year_id = year.year_id
		WHERE term.term_name = 'Winter' 
		AND year.year_id = 2
		GROUP BY faculty.faculty_id
		ORDER BY TeachingCapacity;
        
-- ----------------------------------------------------------------------------------------------------------

-- 10.	Each student's total credit load for Fall 2019, but only students with 
-- 		a credit load greater than three.  Sort by credit load in descending order. 

		SELECT student.last_name AS lname, student.first_name AS fname, SUM(course.credits) AS credits
		FROM student
		JOIN enrollment 
			ON student.student_id = enrollment.student_id
		JOIN section 
			ON enrollment.section_id = section.section_id
		JOIN course 
			ON section.course_id = course.course_id
		JOIN term 
			ON section.term_id = term.term_id
		JOIN year 
			ON term.year_id = year.year_id
		WHERE term.term_name = 'Fall' 
		AND year.year_id = 1
		GROUP BY student.student_id
		HAVING credits > 3
		ORDER BY credits DESC;