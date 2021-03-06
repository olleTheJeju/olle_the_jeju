CREATE TABLE OLLE_BOOKING
(
    BOOK_NUM        NUMBER            NULL, 
    SITU_NUM        NUMBER            NULL, 
    BOOK_NAME       VARCHAR2(500)     NULL, 
    BOOK_PEOPLE     NUMBER            NULL, 
    BOOK_REGDATE    VARCHAR2(2000)  , 
    BOOK_TIME       VARCHAR2(2000)              NULL, 
    BOOK_PHONE      VARCHAR2(100)     NULL, 
    BOOK_CONTENT    VARCHAR2(3000)    NULL, 
    CONSTRAINT PK_OLLE_BOOKING PRIMARY KEY (BOOK_NUM)
)
;
CREATE TABLE OLLE_SITUATION(
    SITU_NUM        NUMBER  CONSTRAINT PK_OLLE_SITUATION PRIMARY KEY , 
    SITU_NAME       VARCHAR2(300)     NULL, 
    SITU_WRITER     VARCHAR2(500)     NULL, 
    SITU_REGDATE    DATE              DEFAULT SYSDATE NULL, 
    SITU_PHONE      VARCHAR2(100)     NULL, 
    SITU_ADDR       VARCHAR2(3000)    NULL, 
    SITU_OPEN_TIME VARCHAR2(300) NULL,
    SITU_CLOSE_TIME VARCHAR2(300) NULL,
    SITU_GUBUN       VARCHAR2(500)     NULL
);
CREATE TABLE OLLE_SITU_MENU(
    MENU_ID NUMBER CONSTRAINT PK_OLLE_SITU_MENU_ID PRIMARY KEY,
    STORE_ID NUMBER CONSTRAINT FK_OLLE_SITU_STORE_ID REFERENCES OLLE_SITUATION(SITU_NUM) ON DELETE CASCADE,
    MENU     VARCHAR2(3000) NULL,
    PRICE     NUMBER
);
CREATE TABLE OLLE_CORONA(
    SEQ NUMBER CONSTRAINT PK_OLLE_CORONA_SEQ PRIMARY KEY,
    CREATE_DT VARCHAR2(2000) NULL,
    UPDATE_DT VARCHAR2(2000) NULL,
    STD_DAY VARCHAR2(2000),
    DEATH_CNT NUMBER,
    DEF_CNT NUMBER,
    GUBUN VARCHAR2(2000),
    GUBUN_CN VARCHAR2(2000),
    GUBUN_EN VARCHAR2(2000),
    INC_DEC NUMBER,
    ISOL_CLEAR_CNT NUMBER,
    LOCAL_OCC_CNT NUMBER,
    OVERFLOW_CNT NUMBER,
    QUR_RATE VARCHAR2(2000)
);
  COMMENT ON COLUMN "KH"."OLLE_CORONA"."SEQ" IS '제주도 코로나 현황 식별자';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."CREATE_DT" IS '작성일자';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."UPDATE_DT" IS '수정일자';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."STD_DAY" IS '기준 일시';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."DEATH_CNT" IS '사망자 수';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."DEF_CNT" IS '확진자 수';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."GUBUN" IS '권역';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."GUBUN_CN" IS '권역-중문';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."GUBUN_EN" IS '권역-영문';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."INC_DEC" IS '전일 대비 증감수';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."ISOL_CLEAR_CNT" IS '격리 해제수';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."LOCAL_OCC_CNT" IS '지역 발생수';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."OVERFLOW_CNT" IS '해외유입 수';
   COMMENT ON COLUMN "KH"."OLLE_CORONA"."QUR_RATE" IS '10만명 당 발생률';
   COMMENT ON TABLE "KH"."OLLE_CORONA"  IS '제주도 코로나 현황';
-----------------------------------------------------------------------------------------------
--test01.png등은 그냥 넣은 거에요
INSERT INTO OLLE_USER(USER_ID, USER_PW,USER_NAME,USER_AGE,USER_ADDR,USER_PHONE,USER_EMAIL,USER_MEMBER,USER_STATUS,USER_WARNING,USER_REGDATE,USER_NICK,USER_IMG)
VALUES('JEJU_CEO1','1234','김길동',30,'가나다','123-4567-8901','123@123.CO.KR','사업자','N',0,SYSDATE,'김길동','TEST01.png');

INSERT INTO OLLE_USER(USER_ID, USER_PW,USER_NAME,USER_AGE,USER_ADDR,USER_PHONE,USER_EMAIL,USER_MEMBER,USER_STATUS,USER_WARNING,USER_REGDATE,USER_NICK,USER_IMG)
VALUES('JEJU_USER1','1234','나길동',30,'가나다','123-4567-8903','133@123.CO.KR','개인','N',0,SYSDATE,'나길동','TEST02.png');

INSERT INTO OLLE_USER(USER_ID, USER_PW,USER_NAME,USER_AGE,USER_ADDR,USER_PHONE,USER_EMAIL,USER_MEMBER,USER_STATUS,USER_WARNING,USER_REGDATE,USER_NICK,USER_IMG)
VALUES('JEJU_USER2','1234','길동',30,'가나다','122-4567-8903','135@123.CO.KR','개인','N',0,SYSDATE,'길동','TEST04.png');
commit;

INSERT INTO OLLE_USER(USER_ID, USER_PW,USER_NAME,USER_AGE,USER_ADDR,USER_PHONE,USER_EMAIL,USER_MEMBER,USER_STATUS,USER_WARNING,USER_REGDATE,USER_NICK,USER_IMG)
VALUES('JEJU_CEO2','1234','다길동',30,'가나다','123-4567-8911','123@123.CO.KR','사업자','N',0,SYSDATE,'다길동','TEST03.png');

Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (3,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (4,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (5,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'2','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (6,'2345','김길동',to_date('21/09/19','RR/MM/DD'),'234','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (7,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (8,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (9,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (10,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','양식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (11,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'123','2345','09:00','16:00','양식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (1,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (2,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (12,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'12345','12345','09:00','16:00','양식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (13,'123','김길동',to_date('21/09/19','RR/MM/DD'),'2345','123','09:00','16:00','중식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (14,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'234','2345','09:00','16:00','일식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (15,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (16,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (17,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (18,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (19,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (20,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (21,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','234','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (22,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (23,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (24,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (25,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (26,'123','김길동',to_date('21/09/19','RR/MM/DD'),'234','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (27,'12345','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (28,'123','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (29,'2345','김길동',to_date('21/09/19','RR/MM/DD'),'234','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (30,'2345','김길동',to_date('21/09/19','RR/MM/DD'),'123','123','09:00','16:00','한식');
Insert into KH.OLLE_SITUATION (SITU_NUM,SITU_NAME,SITU_WRITER,SITU_REGDATE,SITU_PHONE,SITU_ADDR,SITU_OPEN_TIME,SITU_CLOSE_TIME,SITU_GUBUN) values (31,'123','김길동',to_date('21/09/19','RR/MM/DD'),'234','123','09:00','16:00','한식');



------------------------------------------------------------------------------------------------------------------------------------------
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (8,2,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (9,2,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (10,2,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (11,2,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (12,2,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (13,3,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (14,3,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (15,3,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (16,3,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (17,3,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (18,3,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (19,4,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (20,4,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (21,4,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (22,4,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (23,4,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (24,4,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (25,5,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (26,5,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (27,5,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (28,5,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (29,5,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (30,5,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (31,6,'222',222);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (32,6,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (33,6,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (34,6,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (35,6,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (36,6,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (37,7,'21',21);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (38,7,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (39,7,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (40,7,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (41,7,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (42,7,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (43,8,'222',123);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (44,8,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (45,8,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (46,8,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (47,8,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (48,8,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (49,9,'23',12345);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (50,9,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (51,9,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (52,9,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (53,9,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (54,9,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (55,10,'1',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (56,10,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (57,10,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (58,10,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (59,10,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (60,10,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (61,11,'23456',12345);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (1,1,'123',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (2,1,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (3,1,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (4,1,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (5,1,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (6,1,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (7,2,'123',123);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (62,11,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (63,11,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (64,11,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (65,11,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (66,11,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (67,12,'2',2);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (68,12,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (69,12,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (70,12,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (71,12,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (72,12,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (73,13,'2345',23456);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (74,13,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (75,13,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (76,13,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (77,13,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (78,13,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (79,14,'234567',234567);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (80,14,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (81,14,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (82,14,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (83,14,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (84,14,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (85,16,'234',234);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (86,16,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (87,16,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (88,16,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (89,16,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (90,16,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (91,17,'2345',2345);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (92,17,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (93,17,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (94,17,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (95,17,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (96,17,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (97,18,'222',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (98,18,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (99,18,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (100,18,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (101,18,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (102,18,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (103,19,'222',234);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (104,19,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (105,19,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (106,19,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (107,19,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (108,19,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (109,20,'222',345);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (110,20,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (111,20,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (112,20,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (113,20,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (114,20,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (115,21,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (116,21,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (117,21,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (118,21,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (119,21,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (120,21,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (121,22,'234',234);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (122,22,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (123,22,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (124,22,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (125,22,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (126,22,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (127,23,'2',2);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (128,23,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (129,23,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (130,23,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (131,23,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (132,23,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (133,24,'234',234);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (134,24,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (135,24,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (136,24,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (137,24,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (138,24,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (139,25,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (140,25,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (141,25,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (142,25,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (143,25,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (144,25,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (145,26,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (146,26,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (147,26,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (148,26,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (149,26,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (150,26,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (151,27,'234',234);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (152,27,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (153,27,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (154,27,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (155,27,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (156,27,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (157,28,'222',234);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (158,28,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (159,28,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (160,28,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (161,28,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (162,28,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (163,29,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (164,29,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (165,29,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (166,29,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (167,29,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (168,29,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (169,30,'222',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (170,30,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (171,30,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (172,30,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (173,30,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (174,30,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (175,31,'23',23);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (176,31,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (177,31,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (178,31,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (179,31,'없음',1);
Insert into KH.OLLE_SITU_MENU (MENU_ID,STORE_ID,MENU,PRICE) values (180,31,'없음',1);
-----------------------------------------------------------------------------------------------------------------------------

Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (3,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (4,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (5,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (6,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (7,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (8,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (9,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (10,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (11,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (12,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (13,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (14,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (15,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (16,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (17,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (18,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (19,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (20,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (21,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (22,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (23,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (24,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (25,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (1,1,'123',1,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (2,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (26,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (27,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (28,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (31,2,'123',2,'21/09/25','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (29,1,'123',2,'21/09/24','9:00','123','123');
Insert into KH.OLLE_BOOKING (BOOK_NUM,SITU_NUM,BOOK_NAME,BOOK_PEOPLE,BOOK_REGDATE,BOOK_TIME,BOOK_PHONE,BOOK_CONTENT) values (30,1,'123',1,'21/09/24','9:00','123','123');
--------------------------------------------------------------------------------------------------------------------------------

Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1146,'2021-09-22 09:36:17.291','null','2021년 09월 22일 00시',2,2794,'제주','济州','Jeju',5,2711,5,0,'414.15');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1145,'2021-09-23 10:05:32.115','null','2021년 09월 23일 00시',2,2803,'제주','济州','Jeju',9,2715,9,0,'415.48');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1150,'2021-09-18 09:58:56.235','null','2021년 09월 18일 00시',2,2766,'제주','济州','Jeju',3,2664,3,0,'406.59');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1151,'2021-09-17 10:17:17.459','null','2021년 09월 17일 00시',2,2763,'제주','济州','Jeju',9,2658,9,0,'406.59');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1148,'2021-09-20 09:44:41.418','null','2021년 09월 20일 00시',2,2782,'제주','济州','Jeju',10,2697,8,2,'412.37');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1149,'2021-09-19 09:36:37.792','null','2021년 09월 19일 00시',2,2772,'제주','济州','Jeju',6,2678,6,0,'410.89');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1147,'2021-09-21 09:43:41.335','null','2021년 09월 21일 00시',2,2789,'제주','济州','Jeju',7,2705,7,0,'413');
Insert into KH.OLLE_CORONA (SEQ,CREATE_DT,UPDATE_DT,STD_DAY,DEATH_CNT,DEF_CNT,GUBUN,GUBUN_CN,GUBUN_EN,INC_DEC,ISOL_CLEAR_CNT,LOCAL_OCC_CNT,OVERFLOW_CNT,QUR_RATE) values (1144,'2021-09-24 09:54:05.541','null','2021년 09월 24일 00시',2,2817,'제주','济州','Jeju',14,2729,14,0,'417.56');
