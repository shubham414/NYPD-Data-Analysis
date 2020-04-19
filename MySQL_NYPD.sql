--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      NYPD_Crime.DM1
--
-- Date Created : Wednesday, April 01, 2020 18:40:51
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Dim_Borough 
--

CREATE TABLE Dim_Borough(
    BORO_SK         INT            AUTO_INCREMENT,
    Borough_Name    VARCHAR(80),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (BORO_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_KY_Code 
--

CREATE TABLE Dim_KY_Code(
    KY_SK           INT            AUTO_INCREMENT,
    KY_CD           INT,
    OFNS_DESC       VARCHAR(80),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (KY_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_KY_Code_Duplicates 
--

CREATE TABLE Dim_KY_Code_Duplicates(
    KY_SK           INT            AUTO_INCREMENT,
    KY_CD           INT,
    OFNS_DESC       VARCHAR(80),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (KY_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_PD_Code 
--

CREATE TABLE Dim_PD_Code(
    PD_SK           INT            AUTO_INCREMENT,
    PD_CD           INT,
    PD_DESC         VARCHAR(80),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (PD_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_PD_Code_Duplicates 
--

CREATE TABLE Dim_PD_Code_Duplicates(
    PD_SK           INT            AUTO_INCREMENT,
    PD_CD           INT,
    PD_DESC         VARCHAR(80),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (PD_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Perp_AgeGroup 
--

CREATE TABLE Dim_Perp_AgeGroup(
    Perp_AGE_SK     INT            AUTO_INCREMENT,
    AGE_GROUP       VARCHAR(10),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (Perp_AGE_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_PERP_RACE 
--

CREATE TABLE Dim_PERP_RACE(
    PERP_RACE_SK    INT            AUTO_INCREMENT,
    PERP_RACE       VARCHAR(80),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (PERP_RACE_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Vic_AgeGroup 
--

CREATE TABLE Dim_Vic_AgeGroup(
    Vic_AGE_SK      INT            AUTO_INCREMENT,
    AGE_GROUP       VARCHAR(10),
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (Vic_AGE_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Vic_RACE 
--

CREATE TABLE Dim_Vic_RACE(
    Vic_Race_SK     INT            AUTO_INCREMENT,
    Vic_RACE        VARCHAR(80)    NOT NULL,
    DI_PID          VARCHAR(20),
    DI_Create_DT    DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (Vic_Race_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_Complaints_Historical 
--

CREATE TABLE Fact_Complaints_Historical(
    CMPLNT_NUM           BIGINT         NOT NULL,
    ADDR_PCT_CD          INT,
    VIC_SEX              CHAR(1),
    CMPLNT_FR_DT         DATE,
    CMPLNT_FR_TM         VARCHAR(80),
    CMPLNT_TO_DT         DATE,
    CMPLNT_TO_TM         VARCHAR(80),
    CRM_ATPT_CPTD_CD     VARCHAR(80),
    HADEVELOPT           VARCHAR(80),
    HOUSING_PSA          VARCHAR(80),
    JURISDICTION_CODE    INT,
    JURIS_DESC           VARCHAR(80),
    LAW_CAT_CD           VARCHAR(80),
    LOC_OF_OCCUR_DESC    VARCHAR(80),
    PARKS_NM             VARCHAR(80),
    PATROL_BORO          VARCHAR(80),
    PREM_TYP_DESC        VARCHAR(80),
    RPT_DT               DATE,
    STATION_NAME         VARCHAR(80),
    SUSP_SEX             CHAR(1),
    TRANSIT_DISTRICT     INT,
    PD_SK                INT,
    KY_SK                INT,
    BORO_SK              INT,
    X_COORD_CD           FLOAT(7),
    Y_COORD_CD           FLOAT(7),
    Latitude             FLOAT(7),
    Longitude            FLOAT(7),
    DI_PID               VARCHAR(20),
    DI_Create_DT         DATETIME       DEFAULT (curdate()) NOT NULL,
    Vic_Race_SK          INT,
    PERP_RACE_SK         INT,
    Vic_AGE_SK           INT,
    Perp_AGE_SK          INT,
    PRIMARY KEY (CMPLNT_NUM)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_Shooting_Historical 
--

CREATE TABLE Fact_Shooting_Historical(
    INCIDENT_KEY               BIGINT         NOT NULL,
    OCCUR_DATE                 DATE,
    OCCUR_TIME                 TIME           NOT NULL,
    JURISDICTION_CODE          INT,
    PRECINCT                   INT,
    LOCATION_DESC              VARCHAR(80),
    STATISTICAL_MURDER_FLAG    BIT(1),
    PERP_SEX                   CHAR(1),
    VIC_SEX                    CHAR(1),
    X_COORD_CD                 FLOAT(7),
    Y_COORD_CD                 FLOAT(7),
    Latitude                   FLOAT(7),
    Longitude                  FLOAT(7),
    DI_PID                     VARCHAR(20),
    DI_Create_DT               DATETIME       DEFAULT (curdate()) NOT NULL,
    BORO_SK                    INT,
    Vic_AGE_SK                 INT,
    Perp_AGE_SK                INT,
    Vic_Race_SK                INT,
    PERP_RACE_SK               INT,
    PRIMARY KEY (INCIDENT_KEY)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_Summons_Historical 
--

CREATE TABLE Fact_Summons_Historical(
    SUMMONS_KEY              BIGINT         NOT NULL,
    SUMMONS_DATE             DATE,
    OFFENSE_DESCRIPTION      VARCHAR(80),
    LAW_SECTION_NUMBER       VARCHAR(80),
    LAW_DESCRIPTION          VARCHAR(80),
    SUMMONS_CATEGORY_TYPE    VARCHAR(80),
    Perp_SEX                 CHAR(1),
    JURISDICTION_CODE        INT,
    PRECINCT_OF_OCCUR        INT,
    X_COORD_CD               FLOAT(7),
    Y_COORD_CD               FLOAT(7),
    Latitude                 FLOAT(7),
    Longitude                FLOAT(7),
    DI_PID                   VARCHAR(20),
    DI_Create_DT             DATETIME       DEFAULT (curdate()) NOT NULL,
    Perp_AGE_SK              INT,
    PERP_RACE_SK             INT,
    BORO_SK                  INT,
    PRIMARY KEY (SUMMONS_KEY)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_Complaints_Historical 
--

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_Borough3 
    FOREIGN KEY (BORO_SK)
    REFERENCES Dim_Borough(BORO_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_KY_Code4 
    FOREIGN KEY (KY_SK)
    REFERENCES Dim_KY_Code(KY_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_KY_Code_Duplicates5 
    FOREIGN KEY (KY_SK)
    REFERENCES Dim_KY_Code_Duplicates(KY_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_PD_Code6 
    FOREIGN KEY (PD_SK)
    REFERENCES Dim_PD_Code(PD_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_PD_Code_Duplicates7 
    FOREIGN KEY (PD_SK)
    REFERENCES Dim_PD_Code_Duplicates(PD_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_Vic_RACE9 
    FOREIGN KEY (Vic_Race_SK)
    REFERENCES Dim_Vic_RACE(Vic_Race_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_PERP_RACE10 
    FOREIGN KEY (PERP_RACE_SK)
    REFERENCES Dim_PERP_RACE(PERP_RACE_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_Vic_AgeGroup11 
    FOREIGN KEY (Vic_AGE_SK)
    REFERENCES Dim_Vic_AgeGroup(Vic_AGE_SK)
;

ALTER TABLE Fact_Complaints_Historical ADD CONSTRAINT RefDim_Perp_AgeGroup12 
    FOREIGN KEY (Perp_AGE_SK)
    REFERENCES Dim_Perp_AgeGroup(Perp_AGE_SK)
;


-- 
-- TABLE: Fact_Shooting_Historical 
--

ALTER TABLE Fact_Shooting_Historical ADD CONSTRAINT RefDim_Borough16 
    FOREIGN KEY (BORO_SK)
    REFERENCES Dim_Borough(BORO_SK)
;

ALTER TABLE Fact_Shooting_Historical ADD CONSTRAINT RefDim_Vic_AgeGroup17 
    FOREIGN KEY (Vic_AGE_SK)
    REFERENCES Dim_Vic_AgeGroup(Vic_AGE_SK)
;

ALTER TABLE Fact_Shooting_Historical ADD CONSTRAINT RefDim_Perp_AgeGroup18 
    FOREIGN KEY (Perp_AGE_SK)
    REFERENCES Dim_Perp_AgeGroup(Perp_AGE_SK)
;

ALTER TABLE Fact_Shooting_Historical ADD CONSTRAINT RefDim_Vic_RACE19 
    FOREIGN KEY (Vic_Race_SK)
    REFERENCES Dim_Vic_RACE(Vic_Race_SK)
;

ALTER TABLE Fact_Shooting_Historical ADD CONSTRAINT RefDim_PERP_RACE20 
    FOREIGN KEY (PERP_RACE_SK)
    REFERENCES Dim_PERP_RACE(PERP_RACE_SK)
;


-- 
-- TABLE: Fact_Summons_Historical 
--

ALTER TABLE Fact_Summons_Historical ADD CONSTRAINT RefDim_Perp_AgeGroup13 
    FOREIGN KEY (Perp_AGE_SK)
    REFERENCES Dim_Perp_AgeGroup(Perp_AGE_SK)
;

ALTER TABLE Fact_Summons_Historical ADD CONSTRAINT RefDim_PERP_RACE14 
    FOREIGN KEY (PERP_RACE_SK)
    REFERENCES Dim_PERP_RACE(PERP_RACE_SK)
;

ALTER TABLE Fact_Summons_Historical ADD CONSTRAINT RefDim_Borough15 
    FOREIGN KEY (BORO_SK)
    REFERENCES Dim_Borough(BORO_SK)
;





CREATE TABLE Complaints_Historical(
    CMPLNT_NUM           BIGINT         NOT NULL,
    ADDR_PCT_CD          INT,
    VIC_SEX              CHAR(1),
    CMPLNT_FR_DT         DATE,
    CMPLNT_FR_TM         VARCHAR(80),
    CMPLNT_TO_DT         DATE,
    CMPLNT_TO_TM         VARCHAR(80),
    CRM_ATPT_CPTD_CD     VARCHAR(80),
    HADEVELOPT           VARCHAR(80),
    HOUSING_PSA          VARCHAR(80),
    JURISDICTION_CODE    INT,
    JURIS_DESC           VARCHAR(80),
    LAW_CAT_CD           VARCHAR(80),
    LOC_OF_OCCUR_DESC    VARCHAR(80),
    PARKS_NM             VARCHAR(80),
    PATROL_BORO          VARCHAR(80),
    PREM_TYP_DESC        VARCHAR(80),
    RPT_DT               DATE,
    STATION_NAME         VARCHAR(80),
    SUSP_SEX             CHAR(1),
    TRANSIT_DISTRICT     INT,
    BORO				VARCHAR(80),
	KY_CD				INT,
	OFNS_DESC			VARCHAR(80),
	PD_CD				INT,
	PD_DESC				VARCHAR(80),
	SUSP_AGE_GROUP		VARCHAR(80),
	SUSP_RACE		VARCHAR(80),
	VIC_AGE_GROUP		VARCHAR(80),
	VIC_RACE		VARCHAR(80),
	X_COORD_CD           FLOAT(7),
    Y_COORD_CD           FLOAT(7),
    Latitude             FLOAT(7),
    Longitude            FLOAT(7),
    DI_PID               VARCHAR(20),
    DI_Create_DT         DATETIME       DEFAULT (curdate()) NOT NULL,
    PRIMARY KEY (CMPLNT_NUM)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_Shooting_Historical 
--

CREATE TABLE Shooting_Historical(
    INCIDENT_KEY               BIGINT         NOT NULL,
    OCCUR_DATE                 DATE,
    OCCUR_TIME                 TIME           NOT NULL,
    JURISDICTION_CODE          INT,
    PRECINCT                   INT,
    LOCATION_DESC              VARCHAR(80),
    STATISTICAL_MURDER_FLAG    BIT(1),
    PERP_SEX                   CHAR(1),
    VIC_SEX                    CHAR(1),
    X_COORD_CD                 FLOAT(7),
    Y_COORD_CD                 FLOAT(7),
    Latitude                   FLOAT(7),
    Longitude                  FLOAT(7),
    DI_PID                     VARCHAR(20),
    DI_Create_DT              DATETIME       DEFAULT (curdate()) NOT NULL,
    BORO					  VARCHAR(80),
	VIC_AGE_GROUP 			  VARCHAR(80),
	VIC_RACE 				  VARCHAR(80),
	PERP_RACE 				  VARCHAR(80),
	PERP_AGE_GROUP 			  VARCHAR(80)
    PRIMARY KEY (INCIDENT_KEY)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_Summons_Historical 
--

CREATE TABLE Summons_Historical(
    SUMMONS_KEY              BIGINT         NOT NULL,
    SUMMONS_DATE             DATE,
    OFFENSE_DESCRIPTION      VARCHAR(80),
    LAW_SECTION_NUMBER       VARCHAR(80),
    LAW_DESCRIPTION          VARCHAR(80),
    SUMMONS_CATEGORY_TYPE    VARCHAR(80),
    Perp_SEX                 CHAR(1),
    JURISDICTION_CODE        INT,
    PRECINCT_OF_OCCUR        INT,
    X_COORD_CD               FLOAT(7),
    Y_COORD_CD               FLOAT(7),
    Latitude                 FLOAT(7),
    Longitude                FLOAT(7),
    DI_PID                   VARCHAR(20),
    DI_Create_DT             DATETIME       DEFAULT (curdate()) NOT NULL,
	BORO 					VARCHAR(80),
	PERP_RACE 				  VARCHAR(80),
	PERP_AGE_GROUP 			  VARCHAR(80)
    PRIMARY KEY (SUMMONS_KEY)
)ENGINE=MYISAM
;
