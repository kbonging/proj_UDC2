package com.boot.project.comments;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommentsServiceImp implements CommentsService{

    private final CommentsDAO commentsDAO;


    @Override
    public int commentsInsert(Map<String, Object> map) {
        return this.commentsDAO.commentsInsert(map);
    }

    @Override
    public int select_maxCommentNo() {
        return this.commentsDAO.select_maxCommentNo();
    }

    @Override
    public List<Map<String, Object>> select_commentsList(Map<String, Object> map) {
        return this.commentsDAO.select_commentsList(map);
    }

    @Override
    public int select_commentsCnt(Map<String, Object> map) {
        return this.commentsDAO.select_commentsCnt(map);
    }

    @Override
    public int delete_comments(Map<String, Object> map) {
        return this.commentsDAO.delete_comments(map);
    }
}
