# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
drop table if exists peopleroles;
drop table if exists peopleskills;
drop table if exists roles;

# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    skills_id int NOT NULL,
    skills_name varchar(255),
    skills_description varchar(4096) NOT NULL,
    skills_tag varchar(255) NOT NULL,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY(skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) VALUES
(1, 'Kick boxing', 'visualize this!', 'Skill 1'),
(2, 'Python coding', 'writing python programs', 'Skill 2'),
(3, 'Swimming', 'Learn how to swim', 'Skill 3'),
(4, 'Track and field', 'Run!', 'Skill 4'),
(5, 'Basketball', 'shooting hoops', 'Skill 5'),
(6, 'Baseball', 'Throw and catch!', 'Skill 6'),
(7, 'Drawing', 'draw away', 'Skill 7'),
(8, 'Cooking', 'Learning recipes', 'Skill 8');





# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.
drop table if exists people;
CREATE TABLE people (
    people_id int,
    people_first_name varchar(256) NOT NULL,
    people_last_name varchar(256) NOT NULL,
   people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle varchar(256),
    people_brief_bio varchar(1000),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined) VALUES 
(1, 'Sejal', 'Pandeya', 'pandeya@gmail.com', 'https://www.linkedin.com/in/pandeya', 'https://example.com/headshots/pandeya.jpg', 'pandeya#234', 'Hi, it''s nice to meet you', '2023-01-04'),
(2, 'Alex', 'Johnson', 'johnson.alex@email.com', 'https://www.linkedin.com/in/alexjohnson', 'https://example.com/headshots/johnson.jpg', 'johnson_alex#456', 'Hello I am new here!', '2023-01-10'),
(3, 'Rita', 'Kumar', 'rita.kumar@email.com', 'https://www.linkedin.com/in/ritakumar', 'https://example.com/headshots/kumar.jpg', 'rita_kumar#789', 'Hello I am looking for a job!', '2023-02-05'),
(4, 'Carlos', 'Garcia', 'carlos.garcia@email.com', 'https://www.linkedin.com/in/carlosgarcia', 'https://example.com/headshots/garcia.jpg', 'carlos_garcia#101', 'Hi I just moved to this city.', '2023-02-20'),
(5, 'Li', 'Zhang', 'li.zhang@email.com', 'https://www.linkedin.com/in/lizhang', 'https://example.com/headshots/zhang.jpg', 'li_zhang#123', 'Hi I am majoring in cyber security!', '2023-03-01'),
(6, 'Emma', 'Smith', 'emma.smith@email.com', 'https://www.linkedin.com/in/emmasmith', 'https://example.com/headshots/smith.jpg', 'emma_smith#321', 'Hello I am trying to find an internship.', '2023-03-15'),
(7, 'Michael', 'Brown', 'michael.brown@email.com', 'https://www.linkedin.com/in/michaelbrown', 'https://example.com/headshots/brown.jpg', 'michael_brown#987', 'I am looking to find a job in web development.', '2023-04-01'),
(8, 'Sara', 'Wilson', 'sara.wilson@email.com', 'https://www.linkedin.com/in/sarawilson', 'https://example.com/headshots/wilson.jpg', 'sara_wilson#654', 'I am tutoring computer science students.', '2023-04-15'),
(9, 'James', 'Davis', 'james.davis@email.com', 'https://www.linkedin.com/in/jamesdavis', 'https://example.com/headshots/davis.jpg', 'james_davis#321', 'I currently graduted college.', '2023-05-01'),
(10, 'Maria', 'Martinez', 'maria.martinez@email.com', 'https://www.linkedin.com/in/mariamartinez', 'https://example.com/headshots/martinez.jpg', 'maria_martinez#123', 'I am looking to study abroad.', '2023-05-15');




# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

DROP TABLE IF EXISTS peopleskills;
CREATE TABLE peopleskills (
    id int auto_increment,
    skills_id int,
    people_id int,
    date_acquired date,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills (skills_id),
    FOREIGN KEY (people_id) REFERENCES people (people_id)
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
insert into peopleskills (people_id, skills_id) VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 5),
(5, 3),
(5, 6),
(6, 2),
(6, 3),
(6, 4),
(7, 3),
(7, 5),
(7, 6),
(8, 1),
(8, 3),
(8, 5),
(8, 6),
(9, 2),
(9, 5),
(9, 6),
(10, 1),
(10, 4),
(10, 5);



# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
DROP TABLE if exists roles;
create table roles(
    id int NOT NULL,
    name varchar(255) NOT NULL,
    sort_priority int,
    primary key(id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)


INSERT INTO roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);




# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment


DROP TABLE IF EXISTS peopleroles;
CREATE TABLE peopleroles (
    id int AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);




# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, '2023-01-01'), -- Developer
(2, 5, '2023-01-02'), -- Boss
(2, 6, '2023-01-03'), -- Mentor
(3, 2, '2023-01-04'), -- Developer
(3, 4, '2023-01-05'), -- Team Lead
(4, 3, '2023-01-06'), -- Recruit
(5, 3, '2023-01-07'), -- Recruit
(6, 2, '2023-01-08'), -- Developer
(6, 1, '2023-01-09'), -- Designer
(7, 1, '2023-01-10'), -- Designer
(8, 1, '2023-01-11'), -- Designer
(8, 4, '2023-01-12'), -- Team Lead
(9, 2, '2023-01-13'), -- Developer
(10, 2, '2023-01-14'), -- Developer
(10, 1, '2023-01-15'); -- Designer



