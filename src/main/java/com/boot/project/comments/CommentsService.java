package com.boot.project.comments;

import java.util.Map;

public interface CommentsService {
    //댓글 등록
    public int commentsInsert(Map<String,Object> map);
    // maxNum 가져오기
    public int select_maxCommentNo();
}
