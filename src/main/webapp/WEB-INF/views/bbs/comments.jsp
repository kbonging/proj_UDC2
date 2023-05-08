<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/comments.js' />"></script>
</head>
<body>
    <br>
    <div class="div3" id="comment">
        <form name="frm1" id="commentFrm">
            <textarea class="input2" rows="10" cols="50" name="content" id="content"></textarea>
            <div class=div3>
                <input type="button" value="댓글 등록" id="sub1" class="commentBtn">
            </div>
        </form>
    </div>

    <!-- 댓글 for문 돌릴 곳 (시작) -->
    		<div class="div_comm">
    			<table>
    				<colgroup>
    					<col style="width: 50%;" />
    					<col style="width: 50%;" />
    				</colgroup>
    				<!-- 첫 번째 줄 : [좌]아이디/작성일자 //[우]수정 -->
    				<tr>
    					<td>
    						<div class="div_inner">
    							<p class="p1">
    								<a href="#" style="text-decoration: none; color: #466cb4;">댓글닉</a>
    							</p>
    							<p>&nbsp;&nbsp;&nbsp;</p>
    							<p class="p1">2022-10-01 18:50</p>
    						</div>
    					</td>
    					<td>
    						<div class="div_inner">
    							<p class="p1">
    								<a href="#" style="text-decoration: none;">⋮</a>
    							</p>
    						</div>
    					</td>
    				</tr>
    				<!-- 두 번째 줄 : 댓글 본문 내용 -->
    				<tr>
    					<td colspan="2" style="text-align: left;"><span class="p1">댓글처리기능 구현중</span>
    					</td>
    				</tr>
    				<!-- 두 번째 줄 : 댓글 본문 내용 -->
    				<tr>
    					<td colspan="2" style="text-align: right;"><br>
    						<div>
    							<input type="button" class="btns" value="대댓글">
    						</div></td>
    				</tr>
    			</table>
    		</div>

    <!-- 댓글 for문 돌릴 곳 (끝) -->

</body>
</html>
