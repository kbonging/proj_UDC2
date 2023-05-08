<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<link rel="stylesheet" type="text/css" href="style/comments.css" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/comments.js' />"></script>
</head>
<body>
    <br>
    <div class="div3" id="comment">
        <form name="frm1" id="commentFrm">
            <textarea class="content" rows="4" cols="95" name="content" id="content" placeholder="댓글을 남겨보세요"></textarea>
            <div class=div3>
                <input type="button" value="댓글 등록" id="sub1" class="commentBtn">
            </div>
        </form>
    </div>

    <div class="div_comm">
        <!-- 댓글 for문 돌릴 곳 (시작) -->
            여기


        <!-- 댓글 for문 돌릴 곳 (끝) -->
    </div>



</body>
</html>
