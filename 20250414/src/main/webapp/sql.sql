CREATE TABLE tbl_customer (
	customerid VARCHAR2(6) PRIMARY KEY,
	name VARCHAR2(20),
	jumin CHAR(13),
	phone char(13),
	address VARCHAR2(20),
	email VARCHAR2(30)
);

INSERT INTO tbl_customer VALUES ('C001', '김고객', '7901012111111', '010-0000-1111', '서울시', 'kim@abc.com');
INSERT INTO tbl_customer VALUES ('C002', '이고객', '8301012111112', '010-0000-1111', '용인시', 'lee@abc.com');
INSERT INTO tbl_customer VALUES ('C003', '박고객', '0301012111115', '010-0000-1111', '성남시', 'park@abc.com');
INSERT INTO tbl_customer VALUES ('C004', '정고객', '9301012111115', '010-0000-1111', '부천시', 'jung@abc.com');
INSERT INTO tbl_customer VALUES ('C005', '최고객', '8401011111114', '010-0000-1111', '의정부시', 'choi@abc.com');
INSERT INTO tbl_customer VALUES ('C006', '장고객', '0201014111116', '010-0000-1111', '동두천시', 'jang@abc.com');


CREATE TABLE tbl_performance (
	p_number varchar2(6) PRIMARY KEY,
	customerid VARCHAR2(6),
	grade varchar2(6),
	menucode1 varchar2(6),
	menucode2 varchar2(6),
	menucode3 varchar2(6),
	visitdate varchar2(6)
);
INSERT INTO tbl_performance VALUES ('1', 'C001', 'V', 'N00', 'P01', 'E00', '230801');
INSERT INTO tbl_performance VALUES ('2', 'C002', 'G', 'N01', 'P02', 'E00', '230801');
INSERT INTO tbl_performance VALUES ('3', 'C003', 'S', 'N00', 'P00', 'E01', '230802');
INSERT INTO tbl_performance VALUES ('4', 'C004', 'G', 'N03', 'P03', 'E00', '230802');
INSERT INTO tbl_performance VALUES ('5', 'C005', 'V', 'N04', 'P04', 'E00', '230803');
INSERT INTO tbl_performance VALUES ('6', 'C006', 'S', 'N05', 'P05', 'E00', '230803');
INSERT INTO tbl_performance VALUES ('7', 'C001', 'V', 'N00', 'P00', 'E01', '230804');
INSERT INTO tbl_performance VALUES ('8', 'C002', 'G', 'N01', 'P01', 'E01', '230804');



CREATE TABLE tbl_menu (
	menucode VARCHAR2(6) PRIMARY KEY,
	menuname VARCHAR2(30),
	menutype VARCHAR2(6),
	price number(30)
);
INSERT INTO tbl_menu VALUES ('N00', '해당 없음', 'N', 0);
INSERT INTO tbl_menu VALUES ('N01', '풀코트', 'N', 20000);
INSERT INTO tbl_menu VALUES ('N02', '아트/라인아트', 'N', 15000);
INSERT INTO tbl_menu VALUES ('N03', '글리트', 'N', 10000);
INSERT INTO tbl_menu VALUES ('N04', '글라데이션', 'N', 10000);
INSERT INTO tbl_menu VALUES ('N05', '프렌치', 'N', 10000);
INSERT INTO tbl_menu VALUES ('P00', '해당없음', 'P', 0);
INSERT INTO tbl_menu VALUES ('P01', '풀코트', 'P', 20000);
INSERT INTO tbl_menu VALUES ('P02', '아트/라인아트', 'P', 15000);
INSERT INTO tbl_menu VALUES ('P03', '글리트', 'P', 10000);
INSERT INTO tbl_menu VALUES ('P04', '글라데이션', 'P', 10000);
INSERT INTO tbl_menu VALUES ('P05', '프렌치', 'P', 10000);
INSERT INTO tbl_menu VALUES ('E00', '해당없음', 'E', 0);
INSERT INTO tbl_menu VALUES ('E01', '손/발 기본 케어', 'E', 30000);

SELECT * FROM tbl_performance;

SELECT p.p_number, c.customerid, c.name, c.address, (CASE WHEN p.grade = 'V' THEN '우수고객' WHEN p.grade = 'G' THEN '일반고객' WHEN p.grade = 'S' THEN '학생고객' else '기타' END) AS grade, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode1) AS menucode1, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode2) AS menucode2, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode3) AS menucode3, p.visitdate FROM tbl_performance p, tbl_customer c WHERE p.customerid = c.customerid;
	
	
SELECT p_number, customerid, name, address, CASE grade WHEN 'V' THEN '우수고객' WHEN 'G' THEN '일반고객' WHEN 'S' THEN '학생고객' END as 'grade', (SELECT menuname FROM WHERE menucode = menucode1), (SELECT menuname FROM WHERE menucode = menucode2), (SELECT menuname FROM WHERE menucode = menucode3), visitdate FROM tbl_performance p, tbl_customer c WHERE p.customerid = c.customerid;

SELECT p.p_number, c.customerid, c.name, c.address, (CASE WHEN p.grade = 'V' THEN '우수고객' WHEN p.grade = 'G' THEN '일반고객' WHEN p.grade = 'S' THEN '학생고객' else '기타' END) AS grade, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode1) AS menucode1, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode2) AS menucode2, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode3) AS menucode3, to_char(to_date(p.visitdate), 'yyyy/MM/dd') FROM tbl_performance p, tbl_customer c WHERE p.customerid = c.customerid;

SELECT to_char(to_date(p.visitdate), 'yyyy/MM/dd') as visitdate, COUNT(*), SUM(CASE WHEN p.grade = 'V' THEN m.price * 0.9 WHEN p.grade = 'S' THEN m.price * 0.8 ELSE m.price END ) as price FROM tbl_performance p, tbl_menu m WHERE p.menucode1 = m.menucode AND m.price != 0 GROUP BY p.visitdate ORDER BY p.visitdate

select to_char(to_date(visitdate, 'yymmdd'), 'yyyy/mm/dd')  count(*)from TBL_PERFORMANCE

