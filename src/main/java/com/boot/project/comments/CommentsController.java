package com.boot.project.comments;

import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class CommentsController {
    private final CommentsService commentsService;

    @RequestMapping(value = "/comments", method = RequestMethod.POST)
    @ResponseBody
    public String insert_comments(@RequestParam Map<String, Object> map){
        //System.out.println("/comments - map : "+map.toString());

        // 댓글 최대 번호 가져오기
        int maxNum = commentsService.select_maxCommentNo();

        int groupNo = 1;
        if(maxNum > 0){
            groupNo = maxNum + 1; // 댓글 테이블의 고유 번호와 그룹 넘버를 같게 만듬
        }

        map.put("groupNo", groupNo);

        int cnt = commentsService.commentsInsert(map);

        return Integer.toString(cnt);
    }

    @RequestMapping(value = "/GET_commentsList", method = RequestMethod.GET)
    @ResponseBody
    public String GET_commentsList(@RequestParam Map<String, Object> map){
        System.out.println("/GET_commentsList - map : "+map.toString());

        List<Map<String,Object>> list = commentsService.select_commentsList(map);
        System.out.println(list.toString());

        JSONArray jsonArray = new JSONArray();

        for(Map<String, Object> listMap : list){
            jsonArray.put(listMap);
        }

        return jsonArray.toString();
    }
}
