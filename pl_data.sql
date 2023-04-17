CREATE TABLE BUILDING 
(
   ID INT  PRIMARY KEY ,
   NAME VARCHAR (12)  NOT NULL,
   SUPERVISOR_NAME VARCHAR(30) DEFAULT 'Butler' 
);

INSERT INTO BUILDING (ID,NAME,SUPERVISOR_NAME) VALUES (1,'Block A','Aaaron');
INSERT INTO BUILDING (ID,NAME,SUPERVISOR_NAME) VALUES (2,'Block B','Abel');
INSERT INTO BUILDING (ID,NAME,SUPERVISOR_NAME) VALUES (3,'Block C','Anne');
INSERT INTO BUILDING (ID,NAME,SUPERVISOR_NAME) VALUES (4,'Block D','Mary');

CREATE TABLE DEPARTMENT
(
     ID INT,
    DEPARTMENT_NAME VARCHAR (60)  NOT NULL,
    BUILDING_ID INT,
    PRIMARY KEY ( ID),
    CONSTRAINT FK_building_01 FOREIGN KEY (BUILDING_ID) 
    REFERENCES BUILDING(ID)
);

INSERT INTO DEPARTMENT ( ID,DEPARTMENT_NAME,BUILDING_ID) VALUES (1,'Computer Science',1);
INSERT INTO DEPARTMENT ( ID,DEPARTMENT_NAME,BUILDING_ID) VALUES (2,'Information Technology',2);
INSERT INTO DEPARTMENT ( ID,DEPARTMENT_NAME,BUILDING_ID) VALUES (3,'Arts',4);
INSERT INTO DEPARTMENT ( ID,DEPARTMENT_NAME,BUILDING_ID) VALUES (4,'Litterature',1);

CREATE TABLE SPECIALIZATION
(
   ID INT  PRIMARY KEY,
   NAME VARCHAR (60) NOT NULL 
);

INSERT INTO SPECIALIZATION (ID,NAME) VALUES (1,'Computer Science');
INSERT INTO SPECIALIZATION (ID,NAME) VALUES (2,'Information Management');
INSERT INTO SPECIALIZATION (ID,NAME) VALUES (3,'Networking');
INSERT INTO SPECIALIZATION (ID,NAME) VALUES (4,'Cloud Computing');
INSERT INTO SPECIALIZATION (ID,NAME) VALUES (5,'Cyber Security');


CREATE TABLE STUDENTS(
  STU_CODE  varchar (10),
  STU_FNAME VARCHAR (35) NOT NULL,
  STU_LNAME VARCHAR (35) NOT NULL,
  STU_AGE INT NOT NULL,
  STU_ADDRESS VARCHAR (35),
  SPECIALIZATION_ID int,
  DEPARTMENT_ID int NOT NULL,
  REGISTRATION_DATE date,
  PRIMARY KEY (STU_CODE),
  CONSTRAINT CHK_Age CHECK (STU_AGE >=18),
  CONSTRAINT FK_specialization_01 FOREIGN KEY (SPECIALIZATION_ID) REFERENCES SPECIALIZATION (ID),
  CONSTRAINT FK_department_01 FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (ID)
);


INSERT INTO students VALUES ('REGNO_01','Hugo','Javes',20,'Kigali',2,1,TO_DATE('2022-03-20','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_02','Rick','Tan',21,'Lusaka',1,1,TO_DATE('2022-06-30','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_03','Mowry','Mendez',30,'Kinshasa',3,2,TO_DATE('2022-05-12','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_04','Anne','Frank',22,'Bujumbura',4,3,TO_DATE('2022-06-30','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_05','Louise','Johns',23,'Goma',5,2,TO_DATE('2022-04-17','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_06','Kenny','Rogers',50,'Dodoma',4,4,TO_DATE('2022-05-28','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_07','Don','Juan',33,'Bangui',3,2,TO_DATE('2022-01-30','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_08','Kelly','Faith',32,'Cairo',1,3,TO_DATE('2022-03-28','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_09','Lisa','Joy',20,'Alger',2,4,TO_DATE('2022-02-17','YYYY-MM-DD'));
INSERT INTO students VALUES ('REGNO_10','Joanna','Hope',19,'Maputo',1,1,TO_DATE('2022-06-30','YYYY-MM-DD'));
 

CREATE TABLE COURSE
(
    ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR (45)  NOT NULL,
    DEPARTMENT_ID INT  NOT NULL,
    CONSTRAINT FK_department_02 FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT ( ID)
);

CREATE SEQUENCE course_seq START WITH 100;  


INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (100,'DBMS',2);
INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (101,'Java',1);
INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (102,'PLSQL',2);
INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (102,'C',1);
INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (104,'Intro to Networking',2);
INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (105,'English',4);
INSERT INTO course (ID,COURSE_NAME, DEPARTMENT_ID) VALUES (106,'Drawing',3);


CREATE TABLE INSTRUCTOR
(
    ID varchar(40) PRIMARY KEY,
    INSTRUCTOR_NAME VARCHAR(100) NOT NULL,
    DEPARTMENT_ID INT,
    CONSTRAINT FK_department_03 FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT ( ID)
);

INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_01','Jen Lennon',1);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_02','Dave Johnson',2);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_03','Anne Marie',3);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_04','Ange Denise',4);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_05','Carine Lee',1);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_06','Cyntia Ty',2);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_07','Ben Hill',3);
INSERT INTO instructor (ID,INSTRUCTOR_NAME, DEPARTMENT_ID) VALUES ('INS_08','Jared Lo',4);