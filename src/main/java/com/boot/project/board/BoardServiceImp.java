package com.boot.project.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardServiceImp implements BoardService{
    private final BoardDAO boardDAO;

    @Override
    public List<Map<String, Object>> select_ALL(Map<String, Object> map){
        return this.boardDAO.select_ALL(map);
    }

    @Override
    public List<Map<String, Object>> select_Category(Map<String, Object> map) {
        return this.boardDAO.select_Category(map);
    }

    @Override
    public Map<String, Object> selectByBoardNum(Map<String, Object> map) {
        return this.boardDAO.selectByBoardNum(map);
    }

    @Override
    public int insert_Board(Map<String, Object> map) {
        return this.boardDAO.insert_Board(map);
    }

    @Override
    public int update_Board(Map<String, Object> map) {
        return this.boardDAO.update_Board(map);
    }

    @Override
    public int delete_Board(Map<String, Object> map) {
        return this.boardDAO.delete_Board(map);
    }
}
