create database bootUdc;

use bootUdc;
########### 회원 테이블 #################
create table member(
	num			int			unique		auto_increment, 
    userid		char(30)	primary key,
    userPwd		char(30)	not null, 
    uName		char(30)	not null,
    nick		char(30)	not null,
    uEmail		char(100)	not null,
    jumin		char(30)	not null,
    tel			char(30)	not null,
    zipcode		char(30)	not null,
    address 	char(100)	not null,
    locationName char(100),
    joinTM		datetime
);

# alter table member add joinTM datetime;

# delete from member where num = 12;

########## 회원정보 데이터 입력###########
insert into member(userid, userPwd, uName, nick, uEmail, jumin, tel, zipcode, address, locationName, joinTM)
values('lee', '1234', '이창섭', '창소푸', 'leeEmail@naver.com', '910226-1234567', '01012345678' , '11111', '서울 어딘가', '어딘가있겠지', now());
insert into member(userid, userPwd, uName, nick, uEmail, jumin, tel, zipcode, address, locationName, joinTM)
values('kim', '1234', '김승기', '패배', 'kims@naver.com', '900301-1234567', '01012345678' , '11111', '김포 어딘가', '어딘가있겠지', now());
########################


#############################################
select * from member order by num desc;

# 아이디 유무 체크
select count(*) from member where userid = 'k';

# 로그인
select userid, userPwd from member where userid = 'lee' and userPwd = '1234';

#####################

update member
set nick='조대한'
where num=24;
