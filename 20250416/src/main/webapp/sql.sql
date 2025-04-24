
CREATE TABLE member_tbl_03 (
id varchar2(5) PRIMARY KEY,
name varchar2(20),
gender char(1)
);
CREATE TABLE score_tbl_03 (
id varchar2(5) PRIMARY KEY,
korean number(3),
english number(3),
math number(3),
history number(3)
);
INSERT INTO member_tbl_03 VALUES ('10301', '권이준', '1');
INSERT INTO member_tbl_03 VALUES ('10302', '구지우', '2');
INSERT INTO member_tbl_03 VALUES ('10303', '권태준', '1');
INSERT INTO member_tbl_03 VALUES ('10304', '금기연', '2');
INSERT INTO member_tbl_03 VALUES ('10305', '김영진', '1');
INSERT INTO member_tbl_03 VALUES ('10401', '김주현', '1');
INSERT INTO member_tbl_03 VALUES ('10402', '김태민', '2');
INSERT INTO member_tbl_03 VALUES ('10403', '임수민', '2');
INSERT INTO member_tbl_03 VALUES ('10404', '남상도', '1');
INSERT INTO member_tbl_03 VALUES ('10405', '조은호', '2');


INSERT INTO score_tbl_03 VALUES ('10301', 70, 80, 75, 95);
INSERT INTO score_tbl_03 VALUES ('10302', 80, 73, 80, 85);
INSERT INTO score_tbl_03 VALUES ('10303', 45, 75, 45, 75);
INSERT INTO score_tbl_03 VALUES ('10304', 65, 73, 65, 65);
INSERT INTO score_tbl_03 VALUES ('10305', 90, 100, 68, 95);
INSERT INTO score_tbl_03 VALUES ('10401', 95, 75, 84, 60);
INSERT INTO score_tbl_03 VALUES ('10402', 65, 70, 50, 94);
INSERT INTO score_tbl_03 VALUES ('10403', 80, 60, 100, 80);
INSERT INTO score_tbl_03 VALUES ('10404', 64, 50, 40, 65);
INSERT INTO score_tbl_03 VALUES ('10405', 55, 70, 80, 75);

SELECT substr(id, 3, 1), AVG(korean), AVG(english), AVG(math), AVG(history), SUM(korean + english + math + history) FROM score_tbl_03 GROUP BY substr(id, 3, 1); 


SELECT m.id, m.name, s.korean, s.english, s.math, s.history, s.korean + s.english + s.math + s.history, RANK() OVER (ORDER BY s.korean + s.english + s.math + s.history DESC) FROM member_tbl_03 m, score_tbl_03 s WHERE m.id = s.id  