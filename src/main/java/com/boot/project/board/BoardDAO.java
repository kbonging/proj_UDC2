package com.boot.project.board;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {
    // 전체 게시글 목록 조회
    public List<Map<String, Object>> select_ALL(Map<String, Object> map);
    // 카테고리 조회
    public List<Map<String, Object>> select_Category(Map<String, Object> map);
    // 글번호로 조회
    public Map<String, Object> selectByBoardNum(Map<String, Object> map);
    // 글 쓰기
    public int insert_Board(Map<String, Object> map);
    //글 수정
    public int update_Board(Map<String, Object> map);
    //글 삭제
    public int delete_Board(Map<String, Object> map);
    //전체 개시글 개수 조회
    public int select_countAll(Map<String, Object> map);
    // 카테고리별 게시글 개수 조회
    public int select_countCategory(Map<String, Object> map);
}
