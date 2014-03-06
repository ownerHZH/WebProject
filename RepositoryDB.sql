/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2014/3/6 20:53:19                            */
/*==============================================================*/


if exists (select 1
            from  sysindexes
           where  id    = object_id('MenuLevelOne')
            and   name  = 'Relationship_32_FK'
            and   indid > 0
            and   indid < 255)
   drop index MenuLevelOne.Relationship_32_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MenuLevelOne')
            and   type = 'U')
   drop table MenuLevelOne
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MenuLevelThree')
            and   name  = 'Re_MenuLevelTwo_MenuLevelThree_FK'
            and   indid > 0
            and   indid < 255)
   drop index MenuLevelThree.Re_MenuLevelTwo_MenuLevelThree_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MenuLevelThree')
            and   type = 'U')
   drop table MenuLevelThree
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MenuLevelTwo')
            and   name  = 'Re_MenuLevelOne_MenuLevelTwo_FK'
            and   indid > 0
            and   indid < 255)
   drop index MenuLevelTwo.Re_MenuLevelOne_MenuLevelTwo_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MenuLevelTwo')
            and   type = 'U')
   drop table MenuLevelTwo
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Teaching')
            and   name  = 'Teaching2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Teaching.Teaching2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Teaching')
            and   name  = 'Teaching_FK'
            and   indid > 0
            and   indid < 255)
   drop index Teaching.Teaching_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Teaching')
            and   type = 'U')
   drop table Teaching
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('alternativepracticalproject')
            and   name  = 'Student_-AlternativePracticalProject_FK'
            and   indid > 0
            and   indid < 255)
   drop index alternativepracticalproject."Student_-AlternativePracticalProject_FK"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('alternativepracticalproject')
            and   type = 'U')
   drop table alternativepracticalproject
go

if exists (select 1
            from  sysobjects
           where  id = object_id('assignment')
            and   type = 'U')
   drop table assignment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('courseware')
            and   type = 'U')
   drop table courseware
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('curriculum')
            and   name  = 'CurriculumCharacter_Curriculum_FK'
            and   indid > 0
            and   indid < 255)
   drop index curriculum.CurriculumCharacter_Curriculum_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('curriculum')
            and   type = 'U')
   drop table curriculum
go

if exists (select 1
            from  sysobjects
           where  id = object_id('curriculum_outline')
            and   type = 'U')
   drop table curriculum_outline
go

if exists (select 1
            from  sysobjects
           where  id = object_id('curriculumcharacter')
            and   type = 'U')
   drop table curriculumcharacter
go

if exists (select 1
            from  sysobjects
           where  id = object_id('major')
            and   type = 'U')
   drop table major
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('practicalprojec')
            and   name  = 'TopicPeople_FK'
            and   indid > 0
            and   indid < 255)
   drop index practicalprojec.TopicPeople_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('practicalprojec')
            and   name  = 'ProjecProvider_FK'
            and   indid > 0
            and   indid < 255)
   drop index practicalprojec.ProjecProvider_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('practicalprojec')
            and   name  = 'Code_PracticalProjec_FK'
            and   indid > 0
            and   indid < 255)
   drop index practicalprojec.Code_PracticalProjec_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('practicalprojec')
            and   type = 'U')
   drop table practicalprojec
go

if exists (select 1
            from  sysobjects
           where  id = object_id('practicalprojecdocument')
            and   type = 'U')
   drop table practicalprojecdocument
go

if exists (select 1
            from  sysobjects
           where  id = object_id('practicalprojectcode')
            and   type = 'U')
   drop table practicalprojectcode
go

if exists (select 1
            from  sysobjects
           where  id = object_id('questiontypes')
            and   type = 'U')
   drop table questiontypes
go

if exists (select 1
            from  sysobjects
           where  id = object_id('role')
            and   type = 'U')
   drop table role
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('self_testanswer')
            and   name  = 'Student_questionsAnswer_FK'
            and   indid > 0
            and   indid < 255)
   drop index self_testanswer.Student_questionsAnswer_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('self_testanswer')
            and   name  = 'SelfTest_questionsAnswer_FK'
            and   indid > 0
            and   indid < 255)
   drop index self_testanswer.SelfTest_questionsAnswer_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('self_testanswer')
            and   type = 'U')
   drop table self_testanswer
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('selftest')
            and   name  = 'TestCustomize_SelfTest_FK'
            and   indid > 0
            and   indid < 255)
   drop index selftest.TestCustomize_SelfTest_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('selftest')
            and   type = 'U')
   drop table selftest
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('selftestscores')
            and   name  = 'Self-testTestScores3_FK'
            and   indid > 0
            and   indid < 255)
   drop index selftestscores."Self-testTestScores3_FK"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('selftestscores')
            and   name  = 'Self-testTestScores2_FK'
            and   indid > 0
            and   indid < 255)
   drop index selftestscores."Self-testTestScores2_FK"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('selftestscores')
            and   name  = 'Self-testTestScores_FK'
            and   indid > 0
            and   indid < 255)
   drop index selftestscores."Self-testTestScores_FK"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('selftestscores')
            and   type = 'U')
   drop table selftestscores
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('student')
            and   name  = 'Student_Major_FK'
            and   indid > 0
            and   indid < 255)
   drop index student.Student_Major_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('student')
            and   type = 'U')
   drop table student
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentpracticalrecord')
            and   name  = 'Student_tPracticalRecord_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentpracticalrecord.Student_tPracticalRecord_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentpracticalrecord')
            and   name  = 'Teacher_PracticalRecord_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentpracticalrecord.Teacher_PracticalRecord_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('studentpracticalrecord')
            and   type = 'U')
   drop table studentpracticalrecord
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teacher')
            and   type = 'U')
   drop table teacher
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teachercharacter')
            and   type = 'U')
   drop table teachercharacter
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacherinfor')
            and   name  = 'Teacher_Character_FK'
            and   indid > 0
            and   indid < 255)
   drop index teacherinfor.Teacher_Character_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacherinfor')
            and   name  = 'Teacher_Post_FK'
            and   indid > 0
            and   indid < 255)
   drop index teacherinfor.Teacher_Post_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teacherinfor')
            and   type = 'U')
   drop table teacherinfor
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teachingdata')
            and   type = 'U')
   drop table teachingdata
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teachingvideotape')
            and   type = 'U')
   drop table teachingvideotape
go

if exists (select 1
            from  sysobjects
           where  id = object_id('technicalpost')
            and   type = 'U')
   drop table technicalpost
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('tesquestion')
            and   name  = 'Curriculum_TestQuestion_FK'
            and   indid > 0
            and   indid < 255)
   drop index tesquestion.Curriculum_TestQuestion_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('tesquestion')
            and   name  = 'QuestionTypes_TestQuestion_FK'
            and   indid > 0
            and   indid < 255)
   drop index tesquestion.QuestionTypes_TestQuestion_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tesquestion')
            and   type = 'U')
   drop table tesquestion
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('testcode')
            and   name  = 'Curriculum_TestCode_FK'
            and   indid > 0
            and   indid < 255)
   drop index testcode.Curriculum_TestCode_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('testcode')
            and   type = 'U')
   drop table testcode
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('testcustomize')
            and   name  = 'TestQuestion_TestCustomize_FK'
            and   indid > 0
            and   indid < 255)
   drop index testcustomize.TestQuestion_TestCustomize_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('testcustomize')
            and   name  = 'TestCode_Customize_FK'
            and   indid > 0
            and   indid < 255)
   drop index testcustomize.TestCode_Customize_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('testcustomize')
            and   type = 'U')
   drop table testcustomize
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('testrecord')
            and   name  = 'TestRecord -Student_FK'
            and   indid > 0
            and   indid < 255)
   drop index testrecord."TestRecord -Student_FK"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('testrecord')
            and   name  = 'TestCode_TestRecord_FK'
            and   indid > 0
            and   indid < 255)
   drop index testrecord.TestCode_TestRecord_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('testrecord')
            and   type = 'U')
   drop table testrecord
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"user"')
            and   name  = 'Role_User_FK'
            and   indid > 0
            and   indid < 255)
   drop index "user".Role_User_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"user"')
            and   type = 'U')
   drop table "user"
go

/*==============================================================*/
/* Table: MenuLevelOne                                          */
/*==============================================================*/
create table MenuLevelOne (
   menu_level_one_id    int                  not null,
   role_code            int                  null,
   menu_level_one_name  varchar(20)          null,
   mapping_page         text                 null,
   constraint PK_MENULEVELONE primary key nonclustered (menu_level_one_id)
)
go

/*==============================================================*/
/* Index: Relationship_32_FK                                    */
/*==============================================================*/
create index Relationship_32_FK on MenuLevelOne (
role_code ASC
)
go

/*==============================================================*/
/* Table: MenuLevelThree                                        */
/*==============================================================*/
create table MenuLevelThree (
   menu_level_three_id  int                  not null,
   menu_level_two_id    int                  null,
   menu_level_three_name varchar(20)          null,
   mapping_page         text                 null,
   constraint PK_MENULEVELTHREE primary key nonclustered (menu_level_three_id)
)
go

/*==============================================================*/
/* Index: Re_MenuLevelTwo_MenuLevelThree_FK                     */
/*==============================================================*/
create index Re_MenuLevelTwo_MenuLevelThree_FK on MenuLevelThree (
menu_level_two_id ASC
)
go

/*==============================================================*/
/* Table: MenuLevelTwo                                          */
/*==============================================================*/
create table MenuLevelTwo (
   menu_level_two_id    int                  not null,
   menu_level_one_id    int                  null,
   menu_level_two_name  varchar(20)          null,
   constraint PK_MENULEVELTWO primary key nonclustered (menu_level_two_id)
)
go

/*==============================================================*/
/* Index: Re_MenuLevelOne_MenuLevelTwo_FK                       */
/*==============================================================*/
create index Re_MenuLevelOne_MenuLevelTwo_FK on MenuLevelTwo (
menu_level_one_id ASC
)
go

/*==============================================================*/
/* Table: Teaching                                              */
/*==============================================================*/
create table Teaching (
   user_id              char(12)             not null,
   curriculum_code      bigint               not null,
   constraint PK_TEACHING primary key (user_id, curriculum_code)
)
go

/*==============================================================*/
/* Index: Teaching_FK                                           */
/*==============================================================*/
create index Teaching_FK on Teaching (
user_id ASC
)
go

/*==============================================================*/
/* Index: Teaching2_FK                                          */
/*==============================================================*/
create index Teaching2_FK on Teaching (
curriculum_code ASC
)
go

/*==============================================================*/
/* Table: alternativepracticalproject                           */
/*==============================================================*/
create table alternativepracticalproject (
   pp_name              varchar(20)          null,
   requirement          text                 null,
   semester_code        int                  null,
   ppd_name             varchar(30)          null,
   ppd_link             varchar(100)         null,
   equence_number       int                  not null,
   user_id              char(12)             not null,
   constraint PK_ALTERNATIVEPRACTICALPROJECT primary key nonclustered (equence_number)
)
go

/*==============================================================*/
/* Index: "Student_-AlternativePracticalProject_FK"             */
/*==============================================================*/
create index "Student_-AlternativePracticalProject_FK" on alternativepracticalproject (
user_id ASC
)
go

/*==============================================================*/
/* Table: assignment                                            */
/*==============================================================*/
create table assignment (
   curriculum_code      bigint               not null,
   filename             varchar(20)          null,
   location             varchar(100)         null,
   constraint PK_ASSIGNMENT primary key (curriculum_code)
)
go

/*==============================================================*/
/* Table: courseware                                            */
/*==============================================================*/
create table courseware (
   curriculum_code      bigint               not null,
   filename             varchar(20)          null,
   location             varchar(100)         null,
   constraint PK_COURSEWARE primary key (curriculum_code)
)
go

/*==============================================================*/
/* Table: curriculum                                            */
/*==============================================================*/
create table curriculum (
   curriculum_code      bigint               not null,
   cc_code              int                  not null,
   curriculum_name      varchar(20)          not null,
   curriculum_englishname varchar(50)          null,
   learn_way            int                  not null,
   credit               float                not null,
   all_time             int                  not null,
   theory_time          int                  not null,
   practice_time        int                  not null,
   computer_time        int                  not null,
   semester_code        int                  not null,
   exam_way             varchar(4)           not null,
   explain              text                 null,
   constraint PK_CURRICULUM primary key nonclustered (curriculum_code)
)
go

/*==============================================================*/
/* Index: CurriculumCharacter_Curriculum_FK                     */
/*==============================================================*/
create index CurriculumCharacter_Curriculum_FK on curriculum (
cc_code ASC
)
go

/*==============================================================*/
/* Table: curriculum_outline                                    */
/*==============================================================*/
create table curriculum_outline (
   curriculum_code      bigint               not null,
   co_name              varchar(20)          not null,
   filename             varchar(20)          not null,
   location             varchar(100)         not null,
   constraint PK_CURRICULUM_OUTLINE primary key (curriculum_code)
)
go

/*==============================================================*/
/* Table: curriculumcharacter                                   */
/*==============================================================*/
create table curriculumcharacter (
   cc_code              int                  not null,
   cc_name              varchar(20)          not null,
   constraint PK_CURRICULUMCHARACTER primary key nonclustered (cc_code)
)
go

/*==============================================================*/
/* Table: major                                                 */
/*==============================================================*/
create table major (
   major_code           int                  not null,
   major_name           varchar(20)          not null,
   core_curriculum      text                 null,
   occupational_direction text                 null,
   goal                 text                 null,
   history              text                 null,
   constraint PK_MAJOR primary key nonclustered (major_code)
)
go

/*==============================================================*/
/* Table: practicalprojec                                       */
/*==============================================================*/
create table practicalprojec (
   ppcode               int                  not null,
   ppnumber             char(3)              not null,
   semester_code        int                  not null,
   user_id              char(12)             not null,
   tea_user_id          char(12)             not null,
   requirement          text                 null,
   source               bit                  null,
   pp_name              varchar(20)          null,
   constraint PK_PRACTICALPROJEC primary key nonclustered (ppcode, ppnumber)
)
go

/*==============================================================*/
/* Index: Code_PracticalProjec_FK                               */
/*==============================================================*/
create index Code_PracticalProjec_FK on practicalprojec (
ppcode ASC
)
go

/*==============================================================*/
/* Index: ProjecProvider_FK                                     */
/*==============================================================*/
create index ProjecProvider_FK on practicalprojec (
user_id ASC
)
go

/*==============================================================*/
/* Index: TopicPeople_FK                                        */
/*==============================================================*/
create index TopicPeople_FK on practicalprojec (
tea_user_id ASC
)
go

/*==============================================================*/
/* Table: practicalprojecdocument                               */
/*==============================================================*/
create table practicalprojecdocument (
   ppcode               int                  not null,
   ppnumber             char(3)              not null,
   ppd_name             varchar(30)          null,
   ppd_link             varchar(100)         null,
   constraint PK_PRACTICALPROJECDOCUMENT primary key (ppcode, ppnumber)
)
go

/*==============================================================*/
/* Table: practicalprojectcode                                  */
/*==============================================================*/
create table practicalprojectcode (
   ppcode               int                  not null,
   pptype_name          varchar(20)          not null,
   constraint PK_PRACTICALPROJECTCODE primary key nonclustered (ppcode)
)
go

/*==============================================================*/
/* Table: questiontypes                                         */
/*==============================================================*/
create table questiontypes (
   qt_code              int                  not null,
   qt_name              varchar(20)          not null,
   describe             varchar(50)          not null,
   is_objective         bit                  not null,
   constraint PK_QUESTIONTYPES primary key nonclustered (qt_code)
)
go

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role (
   role_code            int                  not null,
   role_name            varchar(16)          not null,
   remarks              text                 null,
   constraint PK_ROLE primary key nonclustered (role_code)
)
go

/*==============================================================*/
/* Table: self_testanswer                                       */
/*==============================================================*/
create table self_testanswer (
   curriculum_code      bigint               not null,
   number               bigint               not null,
   qt_code              int                  not null,
   testpaper_code       int                  not null,
   user_id              char(12)             not null,
   answer_name          varchar(40)               null,
   answer_link          nvarchar(100)        null,
   is_upload            bit                  null,
   is_self_assessment   bit                  null,
   is_read              bit                  null,
   constraint PK_SELF_TESTANSWER primary key (curriculum_code, number, qt_code, testpaper_code, user_id)
)
go

/*==============================================================*/
/* Index: SelfTest_questionsAnswer_FK                           */
/*==============================================================*/
create index SelfTest_questionsAnswer_FK on self_testanswer (
curriculum_code ASC,
number ASC,
qt_code ASC,
testpaper_code ASC
)
go

/*==============================================================*/
/* Index: Student_questionsAnswer_FK                            */
/*==============================================================*/
create index Student_questionsAnswer_FK on self_testanswer (
user_id ASC
)
go

/*==============================================================*/
/* Table: selftest                                              */
/*==============================================================*/
create table selftest (
   curriculum_code      bigint               not null,
   number               bigint               not null,
   qt_code              int                  not null,
   testpaper_code       int                  not null,
   serial_number        int                  not null,
   constraint PK_SELFTEST primary key nonclustered (curriculum_code, number, qt_code, testpaper_code)
)
go

/*==============================================================*/
/* Index: TestCustomize_SelfTest_FK                             */
/*==============================================================*/
create index TestCustomize_SelfTest_FK on selftest (
curriculum_code ASC,
number ASC,
qt_code ASC
)
go

/*==============================================================*/
/* Table: selftestscores                                        */
/*==============================================================*/
create table selftestscores (
   tea_user_id          char(12)             not null,
   curriculum_code      bigint               not null,
   number               bigint               not null,
   qt_code              int                  not null,
   testpaper_code       int                  not null,
   user_id              char(12)             not null,
   stscore              float                null,
   teacher_score        float                null,
   constraint PK_SELFTESTSCORES primary key (tea_user_id, curriculum_code, number, qt_code, testpaper_code, user_id)
)
go

/*==============================================================*/
/* Index: "Self-testTestScores_FK"                              */
/*==============================================================*/
create index "Self-testTestScores_FK" on selftestscores (
curriculum_code ASC,
number ASC,
qt_code ASC,
testpaper_code ASC
)
go

/*==============================================================*/
/* Index: "Self-testTestScores2_FK"                             */
/*==============================================================*/
create index "Self-testTestScores2_FK" on selftestscores (
user_id ASC
)
go

/*==============================================================*/
/* Index: "Self-testTestScores3_FK"                             */
/*==============================================================*/
create index "Self-testTestScores3_FK" on selftestscores (
tea_user_id ASC
)
go

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student (
   user_id              char(12)             not null,
   major_code           int                  not null,
   role_code            int                  null,
   password             varchar(20)          not null,
   is_teachingAdministrator bit                  not null default 0,
   is_departmentHead    bit                  not null default 0,
   is_systemAdministrator bit                  not null default 0,
   student_name         varchar(20)          not null,
   student_sex          bit                  not null,
   grade                int                  not null,
   gradute_date         datetime             not null,
   constraint PK_STUDENT primary key (user_id)
)
go

/*==============================================================*/
/* Index: Student_Major_FK                                      */
/*==============================================================*/
create index Student_Major_FK on student (
major_code ASC
)
go

/*==============================================================*/
/* Table: studentpracticalrecord                                */
/*==============================================================*/
create table studentpracticalrecord (
   ppcode               int                  not null,
   ppnumber             char(3)              not null,
   user_id              char(12)             not null,
   tea_user_id          char(12)             not null,
   download_date        datetime             not null,
   upload_date          datetime             null,
   self_score           char(1)              null,
   teacher_score        float                null,
   comment              text                 null,
   is_audit             bit                  null,
   answer_name          varchar(40)               null,
   link                 varchar(100)         null,
   constraint PK_STUDENTPRACTICALRECORD primary key (ppcode, ppnumber)
)
go

/*==============================================================*/
/* Index: Teacher_PracticalRecord_FK                            */
/*==============================================================*/
create index Teacher_PracticalRecord_FK on studentpracticalrecord (
tea_user_id ASC
)
go

/*==============================================================*/
/* Index: Student_tPracticalRecord_FK                           */
/*==============================================================*/
create index Student_tPracticalRecord_FK on studentpracticalrecord (
user_id ASC
)
go

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher (
   user_id              char(12)             not null,
   role_code            int                  null,
   password             varchar(20)          not null,
   is_teachingAdministrator bit                  not null default 0,
   is_departmentHead    bit                  not null default 0,
   is_systemAdministrator bit                  not null default 0,
   teacher_name         varchar(20)          not null,
   constraint PK_TEACHER primary key (user_id)
)
go

/*==============================================================*/
/* Table: teachercharacter                                      */
/*==============================================================*/
create table teachercharacter (
   tc_code              int                  not null,
   tc_name              varchar(20)          not null,
   constraint PK_TEACHERCHARACTER primary key nonclustered (tc_code)
)
go

/*==============================================================*/
/* Table: teacherinfor                                          */
/*==============================================================*/
create table teacherinfor (
   user_id              char(12)             not null,
   technical_code       int                  not null,
   tc_code              int                  not null,
   role_code            int                  null,
   password             varchar(20)          not null,
   is_teachingAdministrator bit                  not null default 0,
   is_departmentHead    bit                  not null default 0,
   is_systemAdministrator bit                  not null default 0,
   teacher_name         varchar(20)          not null,
   teacher_sex          bit                  not null,
   teacher_date         datetime             null,
   constraint PK_TEACHERINFOR primary key (user_id)
)
go

/*==============================================================*/
/* Index: Teacher_Post_FK                                       */
/*==============================================================*/
create index Teacher_Post_FK on teacherinfor (
technical_code ASC
)
go

/*==============================================================*/
/* Index: Teacher_Character_FK                                  */
/*==============================================================*/
create index Teacher_Character_FK on teacherinfor (
tc_code ASC
)
go

/*==============================================================*/
/* Table: teachingdata                                          */
/*==============================================================*/
create table teachingdata (
   curriculum_code      bigint               not null,
   filename             varchar(20)          null,
   location             varchar(100)         null,
   constraint PK_TEACHINGDATA primary key (curriculum_code)
)
go

/*==============================================================*/
/* Table: teachingvideotape                                     */
/*==============================================================*/
create table teachingvideotape (
   curriculum_code      bigint               not null,
   filename             varchar(20)          null,
   location             varchar(100)         null,
   constraint PK_TEACHINGVIDEOTAPE primary key (curriculum_code)
)
go

/*==============================================================*/
/* Table: technicalpost                                         */
/*==============================================================*/
create table technicalpost (
   technical_code       int                  not null,
   technical_name       varchar(20)          not null,
   constraint PK_TECHNICALPOST primary key nonclustered (technical_code)
)
go

/*==============================================================*/
/* Table: tesquestion                                           */
/*==============================================================*/
create table tesquestion (
   qt_code              int                  not null,
   curriculum_code      bigint               not null,
   tq_id                bigint               not null,
   introduction         text                 null,
   chapter              int                  not null,
   objective_answer     varchar(2)           null,
   answer               text                 null,
   constraint PK_TESQUESTION primary key nonclustered (qt_code, curriculum_code, tq_id)
)
go

/*==============================================================*/
/* Index: QuestionTypes_TestQuestion_FK                         */
/*==============================================================*/
create index QuestionTypes_TestQuestion_FK on tesquestion (
qt_code ASC
)
go

/*==============================================================*/
/* Index: Curriculum_TestQuestion_FK                            */
/*==============================================================*/
create index Curriculum_TestQuestion_FK on tesquestion (
curriculum_code ASC
)
go

/*==============================================================*/
/* Table: testcode                                              */
/*==============================================================*/
create table testcode (
   curriculum_code      bigint               not null,
   number               bigint               not null,
   title                varchar(40)          null,
   create_date          datetime             not null,
   modify_date          datetime             not null,
   start                int                  null,
   "end"                int                  null,
   constraint PK_TESTCODE primary key nonclustered (curriculum_code, number)
)
go

/*==============================================================*/
/* Index: Curriculum_TestCode_FK                                */
/*==============================================================*/
create index Curriculum_TestCode_FK on testcode (
curriculum_code ASC
)
go

/*==============================================================*/
/* Table: testcustomize                                         */
/*==============================================================*/
create table testcustomize (
   curriculum_code      bigint               not null,
   number               bigint               not null,
   qt_code              int                  not null,
   qusetion_code        int                  not null,
   question_score       int                  not null,
   question_num         int                  not null,
   question_allscore    int                  not null,
   constraint PK_TESTCUSTOMIZE primary key (curriculum_code, number, qt_code)
)
go

/*==============================================================*/
/* Index: TestCode_Customize_FK                                 */
/*==============================================================*/
create index TestCode_Customize_FK on testcustomize (
curriculum_code ASC,
number ASC
)
go

/*==============================================================*/
/* Index: TestQuestion_TestCustomize_FK                         */
/*==============================================================*/
create index TestQuestion_TestCustomize_FK on testcustomize (
qt_code ASC
)
go

/*==============================================================*/
/* Table: testrecord                                            */
/*==============================================================*/
create table testrecord (
   curriculum_code      bigint               not null,
   number               bigint               not null,
   user_id              char(12)             not null,
   test_code            int                  not null,
   test_date            datetime             null,
   "start _ime"         datetime             null,
   end_time             datetime             null,
   constraint PK_TESTRECORD primary key nonclustered (curriculum_code, number, user_id, test_code)
)
go

/*==============================================================*/
/* Index: TestCode_TestRecord_FK                                */
/*==============================================================*/
create index TestCode_TestRecord_FK on testrecord (
curriculum_code ASC,
number ASC
)
go

/*==============================================================*/
/* Index: "TestRecord -Student_FK"                              */
/*==============================================================*/
create index "TestRecord -Student_FK" on testrecord (
user_id ASC
)
go

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table "user" (
   user_id              char(12)             not null,
   role_code            int                  not null,
   password             varchar(20)          not null,
   is_teachingAdministrator bit                  not null default 0,
   is_departmentHead    bit                  not null default 0,
   is_systemAdministrator bit                  not null default 0,
   constraint PK_USER primary key nonclustered (user_id)
)
go

/*==============================================================*/
/* Index: Role_User_FK                                          */
/*==============================================================*/
create index Role_User_FK on "user" (
role_code ASC
)
go

