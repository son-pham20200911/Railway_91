/*Ta có database để quản lý các bài thi đầu vào với các table được design như sau:*/
create database test;
use test; 
/*table 1:Department
 DepartmentID: định danh của phòng ban (auto increment)
 DepartmentName: tên đầy đủ của phòng ban (VD: sale, marketing, ...)
*/
create table Department (
DepartmentID int unsigned auto_increment primary key,
DeparmentName varchar(10)
);

/*Table 2: Position
 PositionID: định danh của chức vụ (auto increment)
 PositionName: tên chức vụ (Dev, Test, Scrum Master, PM)*/
create table Position (
PositionID int unsigned auto_increment primary key,
PositionName enum ("Dev","Test","Scrum Master","PM")
);

/*Table 3: Account
 AccountID: định danh của User (auto increment)
 Email:
 Username:
 FullName:
 DepartmentID: phòng ban của user trong hệ thống
 PositionID: chức vụ của User
 CreateDate: ngày tạo tài khoản*/
table `Account`(
AccountID int unsigned auto_increment primary key,
Email varchar(100),
Username varchar(50),
Fullname varchar(50),
DeparmentID  int unsigned,
PositionID int unsigned,
CreateDate date, 
foreign key (DeparmentID) references department (DepartmentID) on delete cascade,
foreign key (PositionID)references Position (PositionID)on delete cascade  
);

/*Table 4: Group
 GroupID: định danh của nhóm (auto increment)
 GroupName: tên nhóm
 CreatorID: id của người tạo group
 CreateDate: ngày tạo group*/
create table `Group` (
GroupID int unsigned auto_increment primary key,
GroupName varchar(50),
CreatorID int unsigned,
CreateDate date  
);

/*Table 5: GroupAccount
 GroupID: định danh của nhóm
 AccountID: định danh của User
 JoinDate: Ngày user tham gia vào nhóm*/

create table GroupAccount (
GroupID  int unsigned ,
AccountID int unsigned,
JoinDate date,
foreign key (GroupID) references `group` (GroupID),
foreign key (AccountID) references `account`(AccountID)
);

-- Table 6: TypeQuestion
-- TypeID: định danh của loại câu hỏi (auto increment)
 -- TypeName: tên của loại câu hỏi (Essay, Multiple-Choice)
create table TypeQuestion (
TypeID int unsigned auto_increment primary key,
TypeName enum("Essay","Multiple-Choice")
);

/*Table 7: CategoryQuestion
 CategoryID: định danh của chủ đề câu hỏi (auto increment)
 CategoryName: tên của chủ đề câu hỏi (Java, .NET, SQL, Postman, Ruby,
...)*/
create table CategoryQuestion (
CategoryID int unsigned auto_increment primary key,
CategoryName varchar(50)
);

/*Table 8: Question
 QuestionID: định danh của câu hỏi (auto increment)
 Content: nội dung của câu hỏi
 CategoryID: định danh của chủ đề câu hỏi
 TypeID: định danh của loại câu hỏi
 CreatorID: id của người tạo câu hỏi
 CreateDate: ngày tạo câu hỏi*/
create table Question(
QuestionID int unsigned auto_increment primary key,
Content varchar(255) not null,
CategoryID int unsigned,
TypeID int unsigned,
CreatorID  int unsigned,
CreateDate date ,
foreign key (CategoryID) references categoryquestion (CategoryID) on delete cascade,
foreign key (TypeID)  references typequestion (TypeID) on delete cascade
);

/*Table 9: Answer
 AnswerID: định danh của câu trả lời (auto increment)
 Content: nội dung của câu trả lời
 QuestionID: định danh của câu hỏi
 isCorrect: câu trả lời này đúng hay sai*/
create table Answer (
AnswerID int unsigned auto_increment primary key,
Content varchar(1000),
QuestionID int unsigned,
IsCorrect enum ("Đúng","Sai"),
foreign key (QuestionID) references question (QuestionID)  
);

alter table 

/*Table 10: Exam
 ExamID: định danh của đề thi (auto increment)
 Code: mã đề thi
 Title: tiêu đề của đề thi
 CategoryID: định danh của chủ đề thi
 Duration: thời gian thi
 CreatorID: id của người tạo đề thi
 CreateDate: ngày tạo đề thi*/
create table Exam (
ExamID int unsigned auto_increment primary key,
`Code` int unsigned,
Title varchar(50),
CategoryID int unsigned,
Duration datetime,
CreatorID int unsigned,
CreateDate date, 
foreign key  (categoryID) references categoryquestion (categoryID)
);

alter table Exam 
modify `Code` char(10);

alter table Exam
modify Duration int ;

-- Table 11: ExamQuestion
--  ExamID: định danh của đề thi
--  QuestionID: định danh của câu hỏi
create table ExamQuestion (
ExamID int unsigned auto_increment primary key,
QuestionID int unsigned ,
foreign key (ExamID) references exam (ExamID),
foreign key (QuestionID) references question(QuestionID)
);


/*Question 1:
Tạo table với các ràng buộc và kiểu dữ liệu
Question 2:
Nộp bài qua Git (xem hướng dẫn trong folder precourse)*/

