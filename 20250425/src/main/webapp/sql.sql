
CREATE TABLE emp_tbl (
empno number(5) PRIMARY KEY,
empname varchar2(21) NOT NULL,
empphone varchar2(11),
empdate date
);
select * from emp_tbl;


INSERT INTO emp_tbl VALUES (10001, '정우성', '01012122323', '20141008');
INSERT INTO emp_tbl VALUES (10002, '김태희', '01023233434', '20150109');
INSERT INTO emp_tbl VALUES (10003, '한가인', '01034344545', '20200402');
INSERT INTO emp_tbl VALUES (10004, '이나영', '01045455656', '20200105');
INSERT INTO emp_tbl VALUES (10005, '원빈', '01056566767', '20101122');
INSERT INTO emp_tbl VALUES (10006, '장동건', '01067677878', '20050302');


CREATE TABLE product_tbl (
productno char(5) PRIMARY KEY,
productname varchar2(60) NOT NULL,
productprice number,
producttype char(1),
productstock number
);

SELECT * FROM product_tbl WHERE productno = 'A0001'
update product_tbl set productname = ?, productprice = ?, producttype = ?, productstock = ? WHERE productno = ?

INSERT INTO product_tbl values ('A0001', '나이키 에어맥스 95', 169000, '1', 150);
INSERT INTO product_tbl values ('A0002', '나이키 에어맥스 98', 149000, '1', 170);
INSERT INTO product_tbl values ('A0003', '나이키 윈드러너', 95000, '2', 80);
INSERT INTO product_tbl values ('A0004', '나이키 드라이핏', 79000, '2', 75);
INSERT INTO product_tbl values ('B0001', '프레쉬폼x', 139000, '1', 200);
INSERT INTO product_tbl values ('B0002', '서밋 언노운', 129000, '1', 155);

create table sell_tbl (
empno number(5),
productno char(5),
selldate date,
selltime char(4),
sellcount number,
PRIMARY KEY(empno, productno, selldate, selltime)
);

INSERT INTO sell_tbl VALUES (10001, 'A0001', '2020-04-08', '1200', 1);
INSERT INTO sell_tbl VALUES (10002, 'A0002', '2020-04-08', '1250', 5);
INSERT INTO sell_tbl VALUES (10001, 'B0001', '2020-04-08', '1305', 2);
INSERT INTO sell_tbl VALUES (10003, 'A0004', '2020-04-09', '0920', 2);
INSERT INTO sell_tbl VALUES (10003, 'B0001', '2020-04-09', '0925', 3);
INSERT INTO sell_tbl VALUES (10004, 'B0002', '2020-04-09', '1130', 1);
INSERT INTO sell_tbl VALUES (10005, 'B0001', '2020-04-09', '1145', 2);
INSERT INTO sell_tbl VALUES (10006, 'A0002', '2020-04-09', '1240', 4);
INSERT INTO sell_tbl VALUES (10006, 'A0002', '2020-04-09', '1325', 3);
INSERT INTO sell_tbl VALUES (10006, 'B0002', '2020-04-09', '1400', 5);