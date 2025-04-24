drop table tbl_jumin_201808;
drop table tbl_hosp_202108;
drop table tbl_vaccresv_202108;

CREATE TABLE tbl_jumin_201808 (
	jumin	char(14)	PRIMARY KEY,
	pname	varchar2(16),
	tel	 	varchar2(13),
	address varchar2(10)
);

CREATE TABLE tbl_hosp_202108 (
	hospcode	char(4)		PRIMARY KEY,
	hospname	varchar2(10),
	hosptel		varchar2(10),
	hospaddr	varchar2(10)
);

CREATE TABLE tbl_vaccresv_202108 (
	resvno		char(8)		PRIMARY KEY,
	jumin		char(14),
	vcode		char(4),
	hospcode	char(4),
	resvdate	char(8),
	resvtime	char(4)
);

INSERT INTO tbl_jumin_201808 VALUES('700101-1000001', '김주민', '010-1234-0001', '서울');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000002', '이주민', '010-1234-0002', '서울');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000003', '박주민', '010-1234-0003', '서울');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000004', '조주민', '010-1234-0004', '대전');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000005', '홍주민', '010-1234-0005', '대전');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000006', '나주민', '010-1234-0006', '대구');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000007', '황주민', '010-1234-0007', '대구');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000008', '용주민', '010-1234-0008', '광주');
INSERT INTO tbl_jumin_201808 VALUES('700101-1000009', '백주민', '010-1234-0009', '광주');
INSERT INTO tbl_jumin_201808 VALUES('700101-2000010', '송주민', '010-1234-0010', '광주');

INSERT INTO tbl_hosp_202108 VALUES('H001', '가-병원', '1588-0001', '서울');
INSERT INTO tbl_hosp_202108 VALUES('H002', '나-병원', '1588-0002', '대전');
INSERT INTO tbl_hosp_202108 VALUES('H003', '다-병원', '1588-0003', '대구');
INSERT INTO tbl_hosp_202108 VALUES('H004', '라-병원', '1588-0004', '광주');

INSERT INTO tbl_vaccresv_202108 VALUES('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920');
INSERT INTO tbl_vaccresv_202108 VALUES('20210002', '700101-2000002', 'V001', 'H002', '20210901', '1030');
INSERT INTO tbl_vaccresv_202108 VALUES('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130');
INSERT INTO tbl_vaccresv_202108 VALUES('20210004', '700101-2000004', 'V002', 'H001', '20210902', '1230');
INSERT INTO tbl_vaccresv_202108 VALUES('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330');
INSERT INTO tbl_vaccresv_202108 VALUES('20210006', '700101-2000006', 'V003', 'H003', '20210903', '1430');
INSERT INTO tbl_vaccresv_202108 VALUES('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530');
INSERT INTO tbl_vaccresv_202108 VALUES('20210008', '700101-2000008', 'V003', 'H002', '20210903', '1630');
INSERT INTO tbl_vaccresv_202108 VALUES('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730');
INSERT INTO tbl_vaccresv_202108 VALUES('20210010', '700101-2000010', 'V003', 'H001', '20210904', '1830');

SELECT j.pname, j.jumin, CASE WHEN substr(j.jumin, 8, 1) = '1' THEN '남' WHEN substr(j.jumin, 8, 1) = '2' THEN '여' end, j.tel, substr(v.resvdate, 1, 4) || '년' || substr(v.resvdate, 5, 2) || '월' || substr(v.resvdate, 7, 2) || '일', substr(v.resvtime, 1, 2) || ':' | substr(v.resvtime, 3, 2), h.hospname, h.hosptel, h.hospaddr, v.vcode FROM tbl_vaccresv_202108 v, tbl_hosp_202108 h, tbl_jumin_201808 j WHERE v.jumin = j.jumin AND v.hospcode = h.hospcode AND v.resvno = '20210001'

SELECT h.hospcode, h.hospname, COUNT(*)
FROM tbl_hosp_202108 h, tbl_vaccresv_202108 v WHERE h.hospcode = v.hospcode
GROUP BY h.hospcode, h.hospname
order by h.hospcode 


SELECT j.pname, j.jumin, CASE WHEN substr(j.jumin, 8, 1) = '1' THEN '남' WHEN substr(j.jumin, 8, 1) = '2' THEN '여' end, j.tel, substr(v.resvdate, 1, 4) || '년' || substr(v.resvdate, 5, 2) || '월' || substr(v.resvdate, 7, 2) || '일', substr(v.resvtime, 1, 2) || ':' || substr(v.resvtime, 3, 2), h.hospname, h.hosptel, h.hospaddr, CASE WHEN substr(v.vcode, 4, 1) = '1' THEN 'A백신' WHEN substr(v.vcode, 4, 1) = '2' THEN 'B백신' WHEN substr(v.vcode, 4, 1) = '3' THEN 'C백신' END FROM tbl_vaccresv_202108 v, tbl_hosp_202108 h, tbl_jumin_201808 j WHERE v.jumin = j.jumin AND v.hospcode = h.hospcode AND v.resvno = ?