-- (0908수정할점)모든 DB명, seq 앞에 'TB3_' 붙히기

-- [1] member

DROP TABLE TP3_MEMBER
CASCADE CONSTRAINTS;


SELECT * FROM TP3_MEMBER;

CREATE TABLE TP3_MEMBER(
	M_ID VARCHAR2(64) PRIMARY KEY,
	M_NAME VARCHAR2(20) NOT NULL,
	M_NICKNAME VARCHAR2(20) NOT NULL,
	M_PASSWORD VARCHAR2(12) NOT NULL,
	M_PHONE VARCHAR2(11) NOT NULL,
	M_REGDATE DATE NOT NULL,
	M_BIRTHDAY VARCHAR2(8) NOT NULL,
	M_PROFILE VARCHAR2(1000),
	M_HIGHSCHOOL VARCHAR2(100),
	M_UNIVERSITY VARCHAR2(100),
	M_OFFICE VARCHAR2(100),
	M_MARRIAGE NUMBER(1),
	M_ADDRESS VARCHAR2(100),
	M_DEACTIVATION NUMBER(1) NOT NULL,
	M_ASK NUMBER(1) NOT NULL,
	M_CONTENT VARCHAR2(100),
	M_STOPDATE VARCHAR2(8),
	M_GENDER NUMBER(1) NOT NULL
);

insert into TP3_MEMBER
values('4@4', '4', 'gogo', '23', '01012345678', sysdate, '19881010',
'', '', '', '', 1, '서울시', 0, 0, '4입니다', '', 1);
insert into TP3_MEMBER
values('qwer', 'qwer', 'qwer', 'qwer', '01012345678', sysdate, '881111',
'', '', '', '', 0, '서울시', 0, 0, 'qwer입니다', '', 1);
insert into TP3_MEMBER
values('asdf', 'asdf', 'asdf', 'asdf', '01056471234', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'asdf입니다', '',1);
insert into TP3_MEMBER
values('kwon', 'kwon', 'kwon', 'kwon', '01001001000', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'kwon입니다', '',1);
insert into TP3_MEMBER
values('kim', 'kim', 'kim', 'kim', '01078945612', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'kim입니다', '',1);
insert into TP3_MEMBER
values('young', 'young', 'young', 'young', '01088885252', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'young입니다', '',1);
insert into TP3_MEMBER
values('Ahyo', 'Ahyo', 'Ahyo', 'Ahyo', '01012341234', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'Ahyo입니다', '',1);
insert into TP3_MEMBER
values('nanna', 'nanna', 'nanna', 'nanna', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'nanna입니다', '',1);
insert into TP3_MEMBER
values('imma', 'imma', 'imma', 'imma', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'imma입니다', '',1);
insert into TP3_MEMBER
values('yonyon', 'yonyon', 'yonyon', 'yonyon', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'yonyon입니다', '',1);
insert into TP3_MEMBER
values('asktest1', 'asktest1', 'asktest1', 'asktest1', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asktest1입니다', '',1);
insert into TP3_MEMBER
values('asktest2', 'asktest2', 'asktest2', 'asktest2', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asktest2입니다', '',1);
--알수도있는 친구 test
insert into TP3_MEMBER
values('asdff1', 'asdff1', 'asdff1', 'asdff1', '0101111111', sysdate, '111111',
'', '', '', '', 0, '강원도', 0,  0, 'asdff1입니다', '', 1);
insert into TP3_MEMBER
values('asdff2', 'asdff2', 'asdff2', 'asdff2', '01013434344', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asdff2입니다', '', 1);
insert into TP3_MEMBER
values('asdff3', 'asdf3', 'asdf3', 'asdf3', '01045681235', sysdate, '111111',
'', '', '', '', 0, '충청도', 0,  0, 'asdf3입니다', '', 1);
insert into TP3_MEMBER
values('kwonf1', 'kwonf1', 'kwonf1', 'kwonf1', '01078321478', sysdate, '111111',
'', '', '', '', 0, '강원도', 0,  0, 'kwonf1입니다', '', 1);
insert into TP3_MEMBER
values('kwonf2', 'kwonf2', 'kwonf2', 'kwonf2', '01046851245', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'kwonf2입니다', '', 1);
insert into TP3_MEMBER
values('kimf1', 'kimf1', 'kimf1', 'kimf1', '01078652158', sysdate, '111111',
'', '', '', '', 0, '강원도', 0,  0, 'kimf1입니다', '', 1);
insert into TP3_MEMBER
values('asdfkwonkim', 'asdfkwonkim', 'asdfkwonkim', 'asdfkwonkim', '01022504180', sysdate, '111111',
'', '', '', '', 0, '충청도', 0,  0, 'asdfkwonkim입니다', '', 1);
insert into TP3_MEMBER
values('asdfkwon', 'asdfkwon', 'asdfkwon', 'asdfkwon', '01035963102', sysdate, '111111',
'', '', '', '', 0, '강원도', 0,  0, 'asdfkwon입니다', '', 1);
insert into TP3_MEMBER
values('kay', '고나용', '고나용', '고나용', '01054541467', sysdate, '111111',
'', '', '', '', 0, '서울', 0,  0, '고나용입니다', '', 1);
insert into TP3_MEMBER
values('nick_id', 'nick_name', 'nick_nick', 'nick_pass', '01054541467', sysdate, '111111',
'', '', '', '', 0, '서울', 0,  0, '고나용입니다', '', 1);
--0928 친구요청 받는 범위가 친구의친구일경우에 관련한 test
insert into TP3_MEMBER
values('lalala', 'lalala', 'lalala', 'lalala', '01012345678', sysdate, '881111',
'', '', '', '', 0, '서울시', 0, 1, 'lalala입니다', '', 1);


update TP3_MEMBER set m_profile='1473138776001.jpg'
where m_id='imma';
update TP3_MEMBER set m_profile='IMG_3454.JPG'
where m_id='yonyon';
update TP3_MEMBER set m_profile='1.jpg'
where m_id='asktest1';
update TP3_MEMBER set m_profile='2.jpg'
where m_id='asktest2';
update TP3_MEMBER set m_profile='buttonimg.jpg'
where m_id='kwon';
update TP3_MEMBER set m_nickname='아리용'
where m_id='Ahyo';
update TP3_MEMBER set m_ask=0
where m_id='lalala';


-- [2] friend

DROP TABLE TP3_FRIEND
CASCADE CONSTRAINTS;

DROP SEQUENCE TP3_FRIEND_SEQ;

SELECT * FROM TP3_FRIEND;

CREATE TABLE TP3_FRIEND(
	F_SEQ NUMBER PRIMARY KEY,
	M_ID VARCHAR2(20) NOT NULL,
	F_ID VARCHAR2(20) NOT NULL,
	F_ACCEPT NUMBER(1) NOT NULL,
	F_GROUP NUMBER(1) NOT NULL,
	F_BLOCK NUMBER(1) NOT NULL
);

CREATE SEQUENCE TP3_FRIEND_SEQ
START WITH 1 INCREMENT BY 1;

ALTER TABLE TP3_FRIEND 
ADD CONSTRAINT FK_TP3_FRIEND_M_ID FOREIGN KEY(M_ID)
REFERENCES TP3_MEMBER(M_ID);

ALTER TABLE TP3_FRIEND 
ADD CONSTRAINT FK_TP3_FRIEND_F_ID FOREIGN KEY(F_ID)
REFERENCES TP3_MEMBER(M_ID);

 	UPDATE TP3_FRIEND SET F_GROUP=1
 	WHERE M_ID='qwer' AND F_ID='Ahyo'
 	SELECT COUNT(*) FROM TP3_FRIEND
	WHERE M_ID='qwer' AND F_ID='Ahyo'
 	UPDATE TP3_FRIEND SET F_ACCEPT=0, F_GROUP=2, F_BLOCK=0 
 	WHERE M_ID='qwer' AND F_ID='Ahyo'
SELECT * FROM TP3_FRIEND;
delete TP3_FRIEND 
where m_id='qwer' and f_id='Ahyo';
delete TP3_FRIEND 
where m_id='Ahyo' and f_id='qwer';

insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asdf', 1, 2, 0);


insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asdf', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'kwon', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'kim', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'young', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'Ahyo', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwon', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kim', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'young', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'Ahyo', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'nanna', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'imma', 'qwer', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'yonyon', 'qwer', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asktest1',  0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asktest2', 0, 2, 0);
--알수도있는친구 test
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'asdff1', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'asdff2', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'asdff3', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwon', 'kwonf1', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwon', 'kwonf2', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kim', 'kimf1', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdff1', 'asdf', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdff2', 'asdf', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdff3', 'asdf', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwonf1', 'kwon',1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwonf2', 'kwon', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kimf1', 'kim', 1, 2, 0);
--asdfkwonkim
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'asdfkwonkim', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwon', 'asdfkwonkim', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kim', 'asdfkwonkim', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdfkwonkim', 'asdf', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdfkwonkim', 'kwon', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdfkwonkim', 'kim', 1, 2, 0);
--asdfkwon
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'asdfkwon', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kwon', 'asdfkwon', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdfkwon','asdf',  1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdfkwon', 'kwon', 1, 2, 0);
--날 차단한 친구 test
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'Ahyo', 'qwer', 0, 2, 1);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'Ahyo', 'kim', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'kim', 'Ahyo', 1, 2, 0);

--asdff1, 2, 3, 
--kwonf1, 2
--kimf1
--asdfkwonkim
--asdfkwon

update TP3_MEMBER set m_id='asdff3'
where m_id='asdffriend';
	SELECT F_BLOCK FROM TP3_FRIEND
	WHERE M_ID='Ahyo' AND F_ID='qwer'
select * from TP3_FRIEND WHERE F_ID='Ahyo'

update FRIEND set f_block=1 where m_id='qwer' and f_id='kwon';
update FRIEND set f_block=1 where m_id='qwer' and f_id='Ahyo';

SELECT COUNT(*) FROM TP3_FRIEND
 	WHERE M_ID='qwer'

SELECT * FROM TP3_FRIEND 
 	WHERE M_ID='qwer' AND F_ACCEPT>0 AND F_BLOCK=0
update TP3_FRIEND_SEQ set f_accept=2
where TP3_FRIEND_SEQ=4
update TP3_FRIEND_SEQ SET F_GROUP=0 WHERE M_ID='qwer' AND F_ID='asdf'
