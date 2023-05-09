package com.boot.project.comments;

import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class CommentsController {
    private final CommentsService commentsService;

    // 댓글 등록
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

    // 댓글 목록
    @RequestMapping(value = "/GET_commentsList", method = RequestMethod.GET)
    @ResponseBody
    public String GET_commentsList(@RequestParam Map<String, Object> map){
        System.out.println("/GET_commentsList - map : "+map.toString());

        List<Map<String,Object>> list = commentsService.select_commentsList(map);
        System.out.println(list.toString());

        JSONArray jsonArray = new JSONArray();

//        for(Map<String, Object> listMap : list){
//            jsonArray.put(listMap);
//        }


        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> listMap = list.get(i);
            String regTM = listMap.get("regTM").toString();
            regTM = regTM.substring(0,10) + " " + regTM.substring(11);
            System.out.println("DB에서 가져온 등록일을  substring 을 사용함 : "+regTM);
            listMap.put("regTM", regTM);
            jsonArray.put(listMap);
        }

        return jsonArray.toString();
    }

    // 댓글 삭제
    @RequestMapping(value = "/deleteComProc", method = RequestMethod.GET)
    @ResponseBody
    public String deleteComProc(@RequestParam Map<String, Object> map){
        System.out.println("댓글 삭제 메서드 map : "+map.toString());

        int cnt = commentsService.delete_comments(map);

        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("cnt", cnt);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

        return jsonObject.toString();

    }
}
