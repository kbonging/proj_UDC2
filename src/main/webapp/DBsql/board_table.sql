use bootUdc;
desc member;
create table board (
	num				int 			auto_increment,			# 게시글 번호
	userid 			char(30)		not null,				# 유저 아이디
    subject			char(100)		not null,				# 글 제목
    content 		text			null,					# 글 내용
    regTM			datetime		not null,				# 등록일
    readCnt			int 			not	null default 0,		# 조회수
    goodCnt			int 			not null default 0,		# 좋아요
    fileName		char(50)		null,					# 파일 제목
    fileSize	 	int				null,					# 파일 사이즈
    delCheck		varchar(10) 	default 'N',			# 글 삭제 여부
    category 		int 			not null,				# 카테고리 1=Q&A, 2=후기, 3=잡담
    constraint primary key(num),
    foreign key(userid) references member(userid) on delete cascade
    
);
## drop table board;

desc board;

select * from board;
select * from member order by num desc;

############ 글 입력 ##################
insert into board(userid, subject, content, regTM, category)
values('lee', '글 제목', '내용', now(),1);
insert into board(userid, subject, content, regTM)
values('messi', '메시 월드컵 우승', '메시 덕에 우승했다', now());
insert into board(userid, subject, content, regTM)
values('kan', '칸토나 민머리', '칸토나칸쵸', now());
insert into board(userid, subject, content, regTM)
values('kim', '승기의 성은?', '김승기~', now());

insert into board(userid, subject, content, regTM)
values('carmex', '카멕스립밤', '립밤좋지~', now());
insert into board(userid, subject, content, regTM)
values('jump', '나는야초딩은지원', '초딩이라네', now());
insert into board(userid, subject, content, regTM)
values('lee', '이창섭이라네', '이창섭이라네', now());
insert into board(userid, subject, content, regTM)
values('been', '빈객체생성', '빈객체생성이라네', now());
insert into board(userid, subject, content, regTM)
values('budu', '버드와이저 맥주 맛있나?', '맛있지', now());
insert into board(userid, subject, content, regTM, category)
values('messi', '메시 바르샤 복귀?', '제발', now(), 1);
 ################## ##################
 
 
 
select * from member;
select * from board order by num desc;

desc board;

alter table board modify subject char(100);

update member
set nick = '봉잉'
where num=22;

select * from member;
select m.nick, b.*
from member m join board b
on m.userid=b.userid
order by num desc;

select m.nick, b.*
from member m join board b
on m.userid=b.userid
order by num desc;

select * from board;

desc board;

update board
set category=2
where num=9;

alter table board add category int not null;

#alter table board modify category int;

update board
set fileName='', fileSize=0
where num='1';

alter table board add category char(30) not null;

select b.*, m.nick
from member m join board b
on m.userid=b.userid
order by b.num desc
limit 0,10;

select b.*, m.nick
from member m join board b
on m.userid=b.userid
order by b.num desc;

select b.*, m.nick
from member m join board b
on m.userid=b.userid
where subject like '%m%'
order by b.num desc;

update board 
set	delCheck='Y'
where num=1;

select count(*) from board;

 select * from board order by num desc limit  30,10;
 
 select count(*) from board where category=1;
select count(*) from 
board
where subject like '%test%';

select m.nick, b.*
        from member m join board b
        on m.userid=b.userid
        where category=1 and  subject like CONCAT('%','${search_keyword}','%')
        order by num desc
        limit 0,10;
