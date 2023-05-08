use bootudc;

create table comments(
	commentNo 		int				auto_increment, # 댓글 고유번호 #
    content			text			,			 # 댓글 내용 #
    regTM			datetime		not null, 	# 댓글 등록일 #
    groupNo			int 			not null,	# 그룹 넘버 #
    step			int				not null,	# 글의 단계 #
    sortNo			int 			not null,	# 글 정렬순서 #
    delCheck		varchar(1) 	default 'N',	# 삭제 여부 #
    boardNo			int				not null, 	# 게시판 번호 #
    userid			char(30)		not null, 	# 작성자 회원 #
    primary key (commentNo),
    foreign key(boardNo) references board(num) on delete cascade,
    foreign key(userid) references member(userid) on delete cascade
);

desc comments;

insert into comments(content, regTM, groupNo, step, sortNo, boardNo, userid)
values('첫 댓글~', now(), 1, 0, 0, 1, 'lee');

select c.*, m.nick
from comments c join member m
on c.userid = m.userid 
where boardNo=59;

select max(commentNo) from comments;
