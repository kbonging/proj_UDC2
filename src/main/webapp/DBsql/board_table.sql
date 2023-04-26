use bootUdc;

create table board (
	num				int 			auto_increment,			# 게시글 번호
    nick			char(30)		not null,				# 작성자 닉네임
    subject			char(30)		not null,				# 글 제목
    content 		text			null,					# 글 내용
    regTM			datetime		not null,				# 등록일
    readCnt			int 			not	null default 0,		# 조회수
    goodCnt			int 			not null default 0,		# 좋아요
    fileName		char(50)		null,					# 파일 제목
    fileSize	 	int				null,					# 파일 사이즈
    delCheck		varchar(10) 	default 'N',				# 글 삭제 여부
    constraint primary key(num),
    foreign key(userid) references member(userid) on delete cascade
    
);


select * from board;
select * from member order by num desc;

############ 글 입력 ##################
insert into board(userid, subject, content, regTM)
values('lee', '글 제목', '내용', now());
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

select b.num, m.nick, b.*
from member m join board b
on m.userid=b.userid
order by b.num desc;

update board 
set	regTM=now()
where num=27;
