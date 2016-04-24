CREATE DATABASE	PMS; 

USE PMS;

CREATE TABLE OFFICER
(
ID VARCHAR(10),
Lastname NVARCHAR(20),
Midname NVARCHAR(20),
Firstname NVARCHAR(20),
Gender NVARCHAR(6),
DOB DATETIME,
Addr NVARCHAR(50),
Phone VARCHAR(11),
Department NVARCHAR(30),
CONSTRAINT PKey_OFFICER
PRIMARY KEY (ID)
);


CREATE TABLE INMATE
(
ID VARCHAR(10),
Lastname NVARCHAR(20),
Midname NVARCHAR(20),
Firstname NVARCHAR(20),
Gender NVARCHAR(6),
DOB DATETIME,
Hair NVARCHAR(10),
Eyes NVARCHAR(10),
Eth NVARCHAR(10),
Addr NVARCHAR(50),
Reason NVARCHAR(50),
Custody NVARCHAR(50),
BookIn DATETIME,
BookOut DATETIME,
CONSTRAINT PKey_INMATE
PRIMARY KEY (ID)
);


CREATE TABLE RE_LATIVE
(
ID VARCHAR(10),
Lastname NVARCHAR(20),
Midname NVARCHAR(20),
Firstname NVARCHAR(20),
Gender NVARCHAR(6),
DOB DATETIME,
Addr NVARCHAR(50),
Phone VARCHAR(11),
InmateID VARCHAR(10),
CONSTRAINT PKey_RELATIVE
PRIMARY KEY (ID,InmateID)
);


CREATE TABLE VISITS
(
ID VARCHAR(10),
RellID VARCHAR(10),
InmateID VARCHAR(10),
VISITS_Date DATETIME,
Remarks NVARCHAR(100),
CONSTRAINT PKey_VS
PRIMARY KEY (ID,InmateID)
);

CREATE TABLE EN_TRY
(
ID VARCHAR(10),
InmateID VARCHAR(10),
ENTRY_Date DATETIME,
Remarks NVARCHAR(100),
CONSTRAINT PKey_ENTRY
PRIMARY KEY (ID,InmateID)
);

CREATE TABLE RE_LEASE
(
ID VARCHAR(10),
InmateID VARCHAR(10),
RELEASE_Date DATETIME,
Remarks NVARCHAR(100),
CONSTRAINT PKey_RELEASE
PRIMARY KEY (ID,InmateID)
);

CREATE TABLE MEDCHECKS
(
ID VARCHAR(10),
InmateID VARCHAR(10),
MEDCHECKS_Date DATETIME,
Urgency NVARCHAR(100),
Condi NVARCHAR(100),
Remarks NVARCHAR(100),
CONSTRAINT PKey_MC
PRIMARY KEY (ID,InmateID)
);


CREATE TABLE DUTY
(
OfficerID VARCHAR(10),
DUTY_WeekDay DATETIME,
DUTY_Time time,
Remarks NVARCHAR(100),
CONSTRAINT PKey_DUTY
PRIMARY KEY (OfficerID)
);


CREATE TABLE REHABILITATION
(
OfficerID VARCHAR(10),
InmateID VARCHAR(10),
R_level NVARCHAR(20),
Ludate DATE,
Talents NVARCHAR(30),
Recommendation NVARCHAR(30),
Reward NVARCHAR(30),
Remarks NVARCHAR(30),
CONSTRAINT PKey_RH
PRIMARY KEY (OfficerID,InmateID)
);


CREATE TABLE REPORT
(
ID VARCHAR(10),
OfficerID VARCHAR(10),
AccessLevel NVARCHAR(30),
RP_Date DATE,
Content NVARCHAR(30),
CONSTRAINT PKey_RP
PRIMARY KEY (OfficerID,ID)
);

ALTER TABLE  VISITS ADD
CONSTRAINT FK_INM_VS
FOREIGN KEY (InmateID)
REFERENCES INMATE(ID);

ALTER TABLE  RE_LATIVE ADD
CONSTRAINT FK_INM_RLT
FOREIGN KEY (InmateID)
REFERENCES INMATE(ID);
--
ALTER TABLE  EN_TRY ADD
CONSTRAINT FK_INM_ENT
FOREIGN KEY (InmateID)
REFERENCES INMATE(ID);

ALTER TABLE  RE_LEASE ADD
CONSTRAINT FK_INM_RLS
FOREIGN KEY (InmateID)
REFERENCES  INMATE(ID);

ALTER TABLE   MEDCHECKS ADD
CONSTRAINT FK_INM_MC
FOREIGN KEY (InmateID)
REFERENCES INMATE( ID);

ALTER TABLE  REHABILITATION ADD
CONSTRAINT FK_INM_RHB
FOREIGN KEY (InmateID)
REFERENCES  INMATE( ID);
--
ALTER TABLE  DUTY ADD
CONSTRAINT FK_OFF_DUTY
FOREIGN KEY (OfficerID)
REFERENCES  OFFICER(ID);

ALTER TABLE  REHABILITATION  ADD
CONSTRAINT FK_OFF_RHB
FOREIGN KEY (OfficerID)
REFERENCES OFFICER(ID);

ALTER TABLE REPORT  ADD
CONSTRAINT FK_OFF_RP
FOREIGN KEY (OfficerID)	
REFERENCES OFFICER(ID);

INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'DI001', N'hồ', N'dương', N'nhật duy', N'nam', CAST(N'1996-10-02 00:00:00.000' AS DateTime), N'Tây Ninh', N'099999999', N'cấp dưỡng');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'ER003', N'Phạm', N'Minh', N'Duy', N'nam', CAST(N'1996-10-02 00:00:00.000' AS DateTime), N'éo biết', N'099999997', N'Nhận và phóng tù nhân');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'HC002', N'Nguyễn', N'thanh', N'danh', N'nam', CAST(N'1996-10-02 00:00:00.000' AS DateTime), N'Vĩnh Long', N'099999998', N'y tế');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'MA005', N'Đặng', N'Nhật ', N'Duy', N'nam', CAST(N'1996-10-02 00:00:00.000' AS DateTime), N'Bình Định', N'099999995', N'Quản lý');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'RH004', N'Lê', N'', N'Dân', N'nam', CAST(N'1996-10-02 00:00:00.000' AS DateTime), N'éo biết', N'099999996', N'cải tạo/quản giáo');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'DI001', CAST(N'2016-10-02 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'ER003', CAST(N'2016-10-03 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'HC002', CAST(N'2016-10-02 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'MA005', CAST(N'2016-10-05 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'RH004', CAST(N'2016-10-04 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'BT');
INSERT `INMATE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `BookIn`, `BookOut`) VALUES (N'IM001', N'nguyễn', N'văn ', N'a', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `INMATE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `BookIn`, `BookOut`) VALUES (N'IM002', N'nguyễn', N'văn ', N'B', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `INMATE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `BookIn`, `BookOut`) VALUES (N'IM003', N'nguyễn', N'văn ', N'C', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `INMATE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `BookIn`, `BookOut`) VALUES (N'IM004', N'nguyễn', N'văn ', N'D', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `REHABILITATION` (`OfficerID`, `InmateID`, `R_level`, `Ludate`, `Talents`, `Recommendation`, `Reward`, `Remarks`) VALUES (N'MA005', N'IM002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `REHABILITATION` (`OfficerID`, `InmateID`, `R_level`, `Ludate`, `Talents`, `Recommendation`, `Reward`, `Remarks`) VALUES (N'RH004', N'IM001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP001', N'DI001', N'1', CAST(N'2016-10-02' AS Date), N'BÁO CÁO 1');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP003', N'ER003', N'3', CAST(N'2016-10-03' AS Date), N'BÁO CÁO 3');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP002', N'HC002', N'2', CAST(N'2016-10-03' AS Date), N'BÁO CÁO 2');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP005', N'MA005', N'5', CAST(N'2016-10-05' AS Date), N'BÁO CÁO 5');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP004', N'RH004', N'4', CAST(N'2016-10-04' AS Date), N'BÁO CÁO 4');
INSERT `VISITS` (`ID`, `InmateID`, `VISITS_Date`, `Remarks`) VALUES (N'VS001', N'IM001', NULL, NULL);
INSERT `VISITS` (`ID`, `InmateID`, `VISITS_Date`, `Remarks`) VALUES (N'VS002', N'IM002', NULL, NULL);
INSERT `VISITS` (`ID`, `InmateID`, `VISITS_Date`, `Remarks`) VALUES (N'VS003', N'IM003', NULL, NULL);
INSERT `VISITS` (`ID`, `InmateID`, `VISITS_Date`, `Remarks`) VALUES (N'VS004', N'IM004', NULL, NULL);
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`) VALUES (N'RE001', N'Hồ', N'mã', N'a', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, N'IM001');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`) VALUES (N'RE002', N'Hồ', N'mã', N'B', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, N'IM002');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`) VALUES (N'RE003', N'Hồ', N'mã', N'C', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, N'IM003');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`) VALUES (N'RE004', N'Hồ', N'mã', N'D', N'nam', CAST(N'1990-10-02 00:00:00.000' AS DateTime), NULL, NULL, N'IM004');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET001', N'IM001', CAST(N'2016-10-02 00:00:00.000' AS DateTime), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET002', N'IM003', CAST(N'2016-10-02 00:00:00.000' AS DateTime), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET003', N'IM004', CAST(N'2016-10-02 00:00:00.000' AS DateTime), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET004', N'IM004', CAST(N'2016-11-02 00:00:00.000' AS DateTime), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET005', N'IM002', CAST(N'2016-10-02 00:00:00.000' AS DateTime), N'BT');
INSERT `RE_LEASE` (`ID`, `InmateID`, `RELEASE_Date`, `Remarks`) VALUES (N'RL001', N'IM001', CAST(N'2018-10-02 00:00:00.000' AS DateTime), N'');
INSERT `RE_LEASE` (`ID`, `InmateID`, `RELEASE_Date`, `Remarks`) VALUES (N'RL002', N'IM003', CAST(N'2020-10-02 00:00:00.000' AS DateTime), N'');
INSERT `RE_LEASE` (`ID`, `InmateID`, `RELEASE_Date`, `Remarks`) VALUES (N'RL004', N'IM004', CAST(N'2020-10-06 00:00:00.000' AS DateTime), N'');
INSERT `MEDCHECKS` (`ID`, `InmateID`, `MEDCHECKS_Date`, `Urgency`, `Condi`, `Remarks`) VALUES (N'MC001', N'IM001', CAST(N'2016-10-02 00:00:00.000' AS DateTime), NULL, NULL, NULL);
INSERT `MEDCHECKS` (`ID`, `InmateID`, `MEDCHECKS_Date`, `Urgency`, `Condi`, `Remarks`) VALUES (N'MC002', N'IM004', NULL, NULL, NULL, NULL);
INSERT `MEDCHECKS` (`ID`, `InmateID`, `MEDCHECKS_Date`, `Urgency`, `Condi`, `Remarks`) VALUES (N'MC003', N'IM003', NULL, NULL, NULL, NULL);
