package com.boot.project.board;


import java.util.List;
import java.util.Map;

public interface BoardService {
    public List<Map<String, Object>> select_ALL(Map<String, Object> map);
    public List<Map<String, Object>> select_Category(Map<String, Object> map);
    public Map<String, Object> selectByBoardNum(Map<String, Object> map);
    public int insert_Board(Map<String, Object> map);
    public int update_Board(Map<String, Object> map);
}
