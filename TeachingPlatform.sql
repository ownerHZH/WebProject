/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014-02-10 11:22:21                          */
/*==============================================================*/


drop table if exists Role;

drop table if exists Course;

drop table if exists CourseCategory;

drop table if exists Courseware;

drop table if exists ExamDatebase;

drop table if exists Homework;

drop table if exists Major;

drop table if exists Questions;

drop table if exists Re_Course_Major;

drop table if exists Re_Student_Course;

drop table if exists Re_Teacher_Course;

drop table if exists Student;

drop table if exists Supplementary;

drop table if exists Syllabuses;

drop table if exists Teacher;

drop table if exists TestPaper;

drop table if exists User;

drop table if exists Videotapes;

/*==============================================================*/
/* Table: Role                                             */
/*==============================================================*/
create table Role
(
   role_code       int not null,
   role_name       varchar(16),
   role_comment    varchar(10),
   primary key (role_code)
);

/*==============================================================*/
/* Table: Course                                                */
/*==============================================================*/
create table Course
(
   course_code          varchar(10) not null,
   course_category_code varchar(2),
   course_name          varchar(30),
   course_english_name  varchar(50),
   primary key (course_code)
);

/*==============================================================*/
/* Table: CourseCategory                                        */
/*==============================================================*/
create table CourseCategory
(
   course_category_code varchar(2) not null,
   course_category_name varchar(10),
   primary key (course_category_code)
);

/*==============================================================*/
/* Table: Courseware                                            */
/*==============================================================*/
create table Courseware
(
   course_code          varchar(10),
   courseware_name      varchar(20),
   courseware_path      varchar(100)
);

/*==============================================================*/
/* Table: ExamDatebase                                          */
/*==============================================================*/
create table ExamDatebase
(
   exam_datebase_code   int not null,
   course_code          varchar(10),
   questions_code       varchar(2),
   exam_datebase_stem   text,
   exam_datebase_subordinate int,
   exam_datebase_objective_answer varchar(4),
   exam_datebase_reference_answer text,
   primary key (exam_datebase_code)
);

/*==============================================================*/
/* Table: Homework                                              */
/*==============================================================*/
create table Homework
(
   course_code          varchar(10),
   homework_name        varchar(20),
   homework_path        varchar(100)
);

/*==============================================================*/
/* Table: Major                                                 */
/*==============================================================*/
create table Major
(
   major_code           int not null,
   major_name           varchar(20),
   primary key (major_code)
);

/*==============================================================*/
/* Table: Questions                                             */
/*==============================================================*/
create table Questions
(
   questions_code       varchar(2) not null,
   course_code          varchar(10),
   questions_name       varchar(20),
   questions_describe   varchar(20),
   questions_yes_or_no_objective bool,
   primary key (questions_code)
);

/*==============================================================*/
/* Table: Re_Course_Major                                       */
/*==============================================================*/
create table Re_Course_Major
(
   course_code          varchar(10) not null,
   major_code           int not null,
   primary key (course_code, major_code)
);

/*==============================================================*/
/* Table: Re_Student_Course                                     */
/*==============================================================*/
create table Re_Student_Course
(
   user_name            varchar(12) not null,
   student_code         varchar(12) not null,
   course_code          varchar(10) not null,
   primary key (user_name, student_code, course_code)
);

/*==============================================================*/
/* Table: Re_Teacher_Course                                     */
/*==============================================================*/
create table Re_Teacher_Course
(
   user_name            varchar(12) not null,
   teacher_code         varchar(7) not null,
   course_code          varchar(10) not null,
   primary key (user_name, teacher_code, course_code)
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   user_name            varchar(12) not null,
   student_code         varchar(12) not null,
   major_code           int,
   role_code       int,
   user_password        varchar(20),
   student_name         varchar(10),
   student_sex          varchar(4),
   student_birthday     datetime,
   student_grade        varchar(4),
   student_graduation_date datetime,
   primary key (user_name, student_code)
);

/*==============================================================*/
/* Table: Supplementary                                         */
/*==============================================================*/
create table Supplementary
(
   course_code          varchar(10),
   supplementary_name   varchar(20),
   supplementary_path   varchar(100)
);

/*==============================================================*/
/* Table: Syllabuses                                            */
/*==============================================================*/
create table Syllabuses
(
   course_code          varchar(10),
   syllabuses_name      varchar(10),
   syllabuses_file_name varchar(30),
   syllabuses_file_path varchar(100)
);

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher
(
   user_name            varchar(12) not null,
   teacher_code         varchar(7) not null,
   role_code       int,
   user_password        varchar(20),
   teacher_name         varchar(10),
   teacher_sex          varchar(4),
   teacher_birthday     datetime,
   teacher_academic     varchar(10),
   teacher_degree       varchar(10),
   teacher_title        varchar(20),
   teacher_character    int,
   primary key (user_name, teacher_code)
);

/*==============================================================*/
/* Table: TestPaper                                             */
/*==============================================================*/
create table TestPaper
(
   test_paper_code      int not null,
   course_code          varchar(10),
   user_name            varchar(12),
   teacher_code         varchar(7),
   test_paper_title     varchar(40),
   test_paper_create_date datetime,
   test_paper_change_date datetime,
   test_paper_begin_chapter int,
   test_paper_end_chapter int,
   primary key (test_paper_code)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   user_name            varchar(12) not null,
   role_code       int,
   user_password        varchar(20),
   primary key (user_name)
);

/*==============================================================*/
/* Table: Videotapes                                            */
/*==============================================================*/
create table Videotapes
(
   course_code          varchar(10),
   videotapes_name      varchar(20),
   videotapes_path      varchar(100)
);

alter table Course add constraint FK_Re_Course_CoueseCategory foreign key (course_category_code)
      references CourseCategory (course_category_code) on delete restrict on update restrict;

alter table Courseware add constraint FK_Re_Course_Courseware foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table ExamDatebase add constraint FK_Re_Course_ExamDatebase foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table ExamDatebase add constraint FK_Re_Questions_ExamDatebase foreign key (questions_code)
      references Questions (questions_code) on delete restrict on update restrict;

alter table Homework add constraint FK_Re_Course_Homework foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Questions add constraint FK_Re_Course_Questions foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Re_Course_Major add constraint FK_Re_Course_Major foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Re_Course_Major add constraint FK_Re_Course_Major2 foreign key (major_code)
      references Major (major_code) on delete restrict on update restrict;

alter table Re_Student_Course add constraint FK_Re_Student_Course foreign key (user_name, student_code)
      references Student (user_name, student_code) on delete restrict on update restrict;

alter table Re_Student_Course add constraint FK_Re_Student_Course2 foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Re_Teacher_Course add constraint FK_Re_Teacher_Course foreign key (user_name, teacher_code)
      references Teacher (user_name, teacher_code) on delete restrict on update restrict;

alter table Re_Teacher_Course add constraint FK_Re_Teacher_Course2 foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Student add constraint FK_In_Student_User foreign key (user_name)
      references User (user_name) on delete restrict on update restrict;

alter table Student add constraint FK_Re_Sudent_Major foreign key (major_code)
      references Major (major_code) on delete restrict on update restrict;

alter table Supplementary add constraint FK_Re_Course_Supplementary foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Syllabuses add constraint FK_Re_Course_Syllabuses foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table Teacher add constraint FK_In_Teacher_User foreign key (user_name)
      references User (user_name) on delete restrict on update restrict;

alter table TestPaper add constraint FK_Re_Course_TestPaper foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

alter table TestPaper add constraint FK_Re_Teacher_TestPaper foreign key (user_name, teacher_code)
      references Teacher (user_name, teacher_code) on delete restrict on update restrict;

alter table User add constraint FK_Re_Role_User foreign key (role_code)
      references Role (role_code) on delete restrict on update restrict;

alter table Videotapes add constraint FK_Re_Course_Videotapes foreign key (course_code)
      references Course (course_code) on delete restrict on update restrict;

