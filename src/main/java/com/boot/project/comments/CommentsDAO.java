package com.boot.project.comments;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommentsDAO {
    //댓글 등록
    public int commentsInsert(Map<String,Object> map);
    // maxNum 가져오기
    public int select_maxCommentNo();
    // 댓글 목록 가져오기
    public List<Map<String, Object>> select_commentsList(Map<String, Object> map);
}
