/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : teachingplatform

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-02-12 15:09:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_code` varchar(10) NOT NULL,
  `course_category_code` varchar(2) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_english_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_code`),
  KEY `FK_Re_Course_CoueseCategory` (`course_category_code`),
  CONSTRAINT `FK_Re_Course_CoueseCategory` FOREIGN KEY (`course_category_code`) REFERENCES `coursecategory` (`course_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `coursecategory`
-- ----------------------------
DROP TABLE IF EXISTS `coursecategory`;
CREATE TABLE `coursecategory` (
  `course_category_code` varchar(2) NOT NULL,
  `course_category_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`course_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursecategory
-- ----------------------------

-- ----------------------------
-- Table structure for `courseware`
-- ----------------------------
DROP TABLE IF EXISTS `courseware`;
CREATE TABLE `courseware` (
  `course_code` varchar(10) DEFAULT NULL,
  `courseware_name` varchar(20) DEFAULT NULL,
  `courseware_path` varchar(100) DEFAULT NULL,
  KEY `FK_Re_Course_Courseware` (`course_code`),
  CONSTRAINT `FK_Re_Course_Courseware` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseware
-- ----------------------------

-- ----------------------------
-- Table structure for `examdatebase`
-- ----------------------------
DROP TABLE IF EXISTS `examdatebase`;
CREATE TABLE `examdatebase` (
  `exam_datebase_code` int(11) NOT NULL,
  `course_code` varchar(10) DEFAULT NULL,
  `questions_code` varchar(2) DEFAULT NULL,
  `exam_datebase_stem` text,
  `exam_datebase_subordinate` int(11) DEFAULT NULL,
  `exam_datebase_objective_answer` varchar(4) DEFAULT NULL,
  `exam_datebase_reference_answer` text,
  PRIMARY KEY (`exam_datebase_code`),
  KEY `FK_Re_Course_ExamDatebase` (`course_code`),
  KEY `FK_Re_Questions_ExamDatebase` (`questions_code`),
  CONSTRAINT `FK_Re_Questions_ExamDatebase` FOREIGN KEY (`questions_code`) REFERENCES `questions` (`questions_code`),
  CONSTRAINT `FK_Re_Course_ExamDatebase` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examdatebase
-- ----------------------------

-- ----------------------------
-- Table structure for `homework`
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `course_code` varchar(10) DEFAULT NULL,
  `homework_name` varchar(20) DEFAULT NULL,
  `homework_path` varchar(100) DEFAULT NULL,
  KEY `FK_Re_Course_Homework` (`course_code`),
  CONSTRAINT `FK_Re_Course_Homework` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `major_code` int(11) NOT NULL,
  `major_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`major_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------

-- ----------------------------
-- Table structure for `menulevelone`
-- ----------------------------
DROP TABLE IF EXISTS `menulevelone`;
CREATE TABLE `menulevelone` (
  `menu_level_one_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` int(11) DEFAULT NULL,
  `menu_level_one_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_level_one_id`),
  KEY `FK_Re_Role_MenuLevelOne` (`role_code`),
  CONSTRAINT `FK_Re_Role_MenuLevelOne` FOREIGN KEY (`role_code`) REFERENCES `role` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menulevelone
-- ----------------------------
INSERT INTO `menulevelone` VALUES ('1', '6', '系统维护');
INSERT INTO `menulevelone` VALUES ('2', '6', '专业介绍');
INSERT INTO `menulevelone` VALUES ('3', '6', '课程体系');
INSERT INTO `menulevelone` VALUES ('4', '6', '师资情况');
INSERT INTO `menulevelone` VALUES ('5', '6', '大纲');
INSERT INTO `menulevelone` VALUES ('6', '6', '课件');
INSERT INTO `menulevelone` VALUES ('7', '6', '教辅资料');
INSERT INTO `menulevelone` VALUES ('8', '6', '教学录相');
INSERT INTO `menulevelone` VALUES ('9', '6', '作业');
INSERT INTO `menulevelone` VALUES ('10', '6', '在线测试');
INSERT INTO `menulevelone` VALUES ('11', '6', '实战演练');
INSERT INTO `menulevelone` VALUES ('12', '6', '互动平台');

-- ----------------------------
-- Table structure for `menulevelthree`
-- ----------------------------
DROP TABLE IF EXISTS `menulevelthree`;
CREATE TABLE `menulevelthree` (
  `menu_level_three_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_level_two_id` int(11) DEFAULT NULL,
  `menu_level_three_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_level_three_id`),
  KEY `FK_Re_MenuLevelTwo_MenuLevelThree` (`menu_level_two_id`),
  CONSTRAINT `FK_Re_MenuLevelTwo_MenuLevelThree` FOREIGN KEY (`menu_level_two_id`) REFERENCES `menuleveltwo` (`menu_level_two_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menulevelthree
-- ----------------------------
INSERT INTO `menulevelthree` VALUES ('1', '1', '添加角色');
INSERT INTO `menulevelthree` VALUES ('2', '1', '角色权限设置');
INSERT INTO `menulevelthree` VALUES ('3', '1', '教师用户导入');
INSERT INTO `menulevelthree` VALUES ('4', '1', '学生用户导入');
INSERT INTO `menulevelthree` VALUES ('5', '1', '添加/修改用户');
INSERT INTO `menulevelthree` VALUES ('6', '1', '修改密码');
INSERT INTO `menulevelthree` VALUES ('7', '2', '添加方向');
INSERT INTO `menulevelthree` VALUES ('8', '2', '浏览/修改方向');
INSERT INTO `menulevelthree` VALUES ('9', '3', '添加性质');
INSERT INTO `menulevelthree` VALUES ('10', '3', '浏览/修改性质');
INSERT INTO `menulevelthree` VALUES ('11', '4', '添加题型');
INSERT INTO `menulevelthree` VALUES ('12', '4', '浏览/修改题型');

-- ----------------------------
-- Table structure for `menuleveltwo`
-- ----------------------------
DROP TABLE IF EXISTS `menuleveltwo`;
CREATE TABLE `menuleveltwo` (
  `menu_level_two_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_level_one_id` int(11) DEFAULT NULL,
  `menu_level_two_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_level_two_id`),
  KEY `FK_Re_MenuLevelOne_MenuLevelTwo` (`menu_level_one_id`),
  CONSTRAINT `FK_Re_MenuLevelOne_MenuLevelTwo` FOREIGN KEY (`menu_level_one_id`) REFERENCES `menulevelone` (`menu_level_one_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuleveltwo
-- ----------------------------
INSERT INTO `menuleveltwo` VALUES ('1', '1', '用户管理');
INSERT INTO `menuleveltwo` VALUES ('2', '1', '专业方向');
INSERT INTO `menuleveltwo` VALUES ('3', '1', '课程性质');
INSERT INTO `menuleveltwo` VALUES ('4', '1', '题型管理');

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `questions_code` varchar(2) NOT NULL,
  `course_code` varchar(10) DEFAULT NULL,
  `questions_name` varchar(20) DEFAULT NULL,
  `questions_describe` varchar(20) DEFAULT NULL,
  `questions_yes_or_no_objective` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`questions_code`),
  KEY `FK_Re_Course_Questions` (`course_code`),
  CONSTRAINT `FK_Re_Course_Questions` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------

-- ----------------------------
-- Table structure for `re_course_major`
-- ----------------------------
DROP TABLE IF EXISTS `re_course_major`;
CREATE TABLE `re_course_major` (
  `course_code` varchar(10) NOT NULL,
  `major_code` int(11) NOT NULL,
  PRIMARY KEY (`course_code`,`major_code`),
  KEY `FK_Re_Course_Major2` (`major_code`),
  CONSTRAINT `FK_Re_Course_Major2` FOREIGN KEY (`major_code`) REFERENCES `major` (`major_code`),
  CONSTRAINT `FK_Re_Course_Major` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of re_course_major
-- ----------------------------

-- ----------------------------
-- Table structure for `re_student_course`
-- ----------------------------
DROP TABLE IF EXISTS `re_student_course`;
CREATE TABLE `re_student_course` (
  `user_name` varchar(12) NOT NULL,
  `student_code` varchar(12) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_name`,`student_code`,`course_code`),
  KEY `FK_Re_Student_Course2` (`course_code`),
  CONSTRAINT `FK_Re_Student_Course2` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`),
  CONSTRAINT `FK_Re_Student_Course` FOREIGN KEY (`user_name`, `student_code`) REFERENCES `student` (`user_name`, `student_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of re_student_course
-- ----------------------------

-- ----------------------------
-- Table structure for `re_teacher_course`
-- ----------------------------
DROP TABLE IF EXISTS `re_teacher_course`;
CREATE TABLE `re_teacher_course` (
  `user_name` varchar(12) NOT NULL,
  `teacher_code` varchar(7) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_name`,`teacher_code`,`course_code`),
  KEY `FK_Re_Teacher_Course2` (`course_code`),
  CONSTRAINT `FK_Re_Teacher_Course2` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`),
  CONSTRAINT `FK_Re_Teacher_Course` FOREIGN KEY (`user_name`, `teacher_code`) REFERENCES `teacher` (`user_name`, `teacher_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of re_teacher_course
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_code` int(11) NOT NULL,
  `role_name` varchar(16) DEFAULT NULL,
  `role_comment` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '游客', '游客');
INSERT INTO `role` VALUES ('2', '学生', '学生');
INSERT INTO `role` VALUES ('3', '教师', '教师');
INSERT INTO `role` VALUES ('4', '教学管理员', '教学管理员');
INSERT INTO `role` VALUES ('5', '系主任', '系主任');
INSERT INTO `role` VALUES ('6', '系统管理员', '系统管理员');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `user_name` varchar(12) NOT NULL,
  `student_code` varchar(12) NOT NULL,
  `major_code` int(11) DEFAULT NULL,
  `role_code` int(11) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `student_name` varchar(10) DEFAULT NULL,
  `student_sex` varchar(4) DEFAULT NULL,
  `student_birthday` datetime DEFAULT NULL,
  `student_grade` varchar(4) DEFAULT NULL,
  `student_graduation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_name`,`student_code`),
  KEY `FK_Re_Sudent_Major` (`major_code`),
  CONSTRAINT `FK_Re_Sudent_Major` FOREIGN KEY (`major_code`) REFERENCES `major` (`major_code`),
  CONSTRAINT `FK_In_Student_User` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `supplementary`
-- ----------------------------
DROP TABLE IF EXISTS `supplementary`;
CREATE TABLE `supplementary` (
  `course_code` varchar(10) DEFAULT NULL,
  `supplementary_name` varchar(20) DEFAULT NULL,
  `supplementary_path` varchar(100) DEFAULT NULL,
  KEY `FK_Re_Course_Supplementary` (`course_code`),
  CONSTRAINT `FK_Re_Course_Supplementary` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplementary
-- ----------------------------

-- ----------------------------
-- Table structure for `syllabuses`
-- ----------------------------
DROP TABLE IF EXISTS `syllabuses`;
CREATE TABLE `syllabuses` (
  `course_code` varchar(10) DEFAULT NULL,
  `syllabuses_name` varchar(10) DEFAULT NULL,
  `syllabuses_file_name` varchar(30) DEFAULT NULL,
  `syllabuses_file_path` varchar(100) DEFAULT NULL,
  KEY `FK_Re_Course_Syllabuses` (`course_code`),
  CONSTRAINT `FK_Re_Course_Syllabuses` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syllabuses
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `user_name` varchar(12) NOT NULL,
  `teacher_code` varchar(7) NOT NULL,
  `role_code` int(11) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `teacher_name` varchar(10) DEFAULT NULL,
  `teacher_sex` varchar(4) DEFAULT NULL,
  `teacher_birthday` datetime DEFAULT NULL,
  `teacher_academic` varchar(10) DEFAULT NULL,
  `teacher_degree` varchar(10) DEFAULT NULL,
  `teacher_title` varchar(20) DEFAULT NULL,
  `teacher_character` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_name`,`teacher_code`),
  CONSTRAINT `FK_In_Teacher_User` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `testpaper`
-- ----------------------------
DROP TABLE IF EXISTS `testpaper`;
CREATE TABLE `testpaper` (
  `test_paper_code` int(11) NOT NULL,
  `course_code` varchar(10) DEFAULT NULL,
  `user_name` varchar(12) DEFAULT NULL,
  `teacher_code` varchar(7) DEFAULT NULL,
  `test_paper_title` varchar(40) DEFAULT NULL,
  `test_paper_create_date` datetime DEFAULT NULL,
  `test_paper_change_date` datetime DEFAULT NULL,
  `test_paper_begin_chapter` int(11) DEFAULT NULL,
  `test_paper_end_chapter` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_paper_code`),
  KEY `FK_Re_Course_TestPaper` (`course_code`),
  KEY `FK_Re_Teacher_TestPaper` (`user_name`,`teacher_code`),
  CONSTRAINT `FK_Re_Teacher_TestPaper` FOREIGN KEY (`user_name`, `teacher_code`) REFERENCES `teacher` (`user_name`, `teacher_code`),
  CONSTRAINT `FK_Re_Course_TestPaper` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testpaper
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_name` varchar(12) NOT NULL,
  `role_code` int(11) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  KEY `FK_Re_Role_User` (`role_code`),
  CONSTRAINT `FK_Re_Role_User` FOREIGN KEY (`role_code`) REFERENCES `role` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `videotapes`
-- ----------------------------
DROP TABLE IF EXISTS `videotapes`;
CREATE TABLE `videotapes` (
  `course_code` varchar(10) DEFAULT NULL,
  `videotapes_name` varchar(20) DEFAULT NULL,
  `videotapes_path` varchar(100) DEFAULT NULL,
  KEY `FK_Re_Course_Videotapes` (`course_code`),
  CONSTRAINT `FK_Re_Course_Videotapes` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videotapes
-- ----------------------------
