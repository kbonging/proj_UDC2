package com.boot.project.board;

import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class BoardController {
    // RequiredArgsConstructor 로 생성자 주입
    private final BoardService boardService;

    // 날짜
    private static Date currentDate = new Date();
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    //파일 업로드
    private static final String SAVEFOLER = "C:/Users/apple/git/OverWatch_Proj/OverWatch/src/main/webapp/resources/fileUpload";
    private static String encType = "UTF-8";
    private static int maxSize = 5 * 1024 * 1024;


    // 리스트 목록 보여주기
    @RequestMapping(value = "/boardList")
    public String boardList(@RequestParam Map<String, Object> map, Model model){
        System.out.println("/boardList - map : "+map.toString());
        List<Map<String, Object>> list = null;

        //카테고리 받아서 숫자로 변환
        int category = 0;
        if (map.get("category") == null
                || map.get("category").toString().equals("")
                || map.get("category").toString().equals("All")){
            category = 0;
        }else if (map.get("category").toString().equals("Q&A")) {
            category = 1;
        }else if(map.get("category").toString().equals("Review")){
            category = 2;
        }else if(map.get("category").toString().equals("Chat")){
            category = 3;
        }

        map.put("category", category);

        if (category > 0) { //카테고리별 조회
            list = boardService.select_Category(map);
        }else{ // 카테고리없는거 조회
            list = boardService.select_ALL(map);
        }
        // 카테고리가 없거나 ALL일 경우
//        if (map.get("category") == null
//                || map.get("category").toString().equals("") || map.get("category").toString().equals("All")){
//            System.out.println("요ㅕ기 걸침?");
//             list = boardService.select_ALL(map);
//            System.out.println("list : " + list.toString());
//        }


        ///////////////////////////////////////////////////////////////////
        ////////////////////////   날짜 관련 시작    /////////////////////////
        ///////////////////////////////////////////////////////////////////

        // 오늘 자정
        Calendar calStart = new GregorianCalendar();
        calStart.setTime(currentDate);
        calStart.set(Calendar.HOUR_OF_DAY, 0);
        calStart.set(Calendar.MINUTE, 0);
        calStart.set(Calendar.SECOND, 0);
        calStart.set(Calendar.MILLISECOND, 0);
        Date midnightYesterday = calStart.getTime();

        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> boardMap = list.get(i);
            String regTM = boardMap.get("regTM").toString();
            System.out.println("/boardList - DB에서 가져온 regTM : "+regTM);


            regTM = regTM.substring(0,10)+" "+regTM.substring(11);
            System.out.println("substring 후 regTM : "+regTM);

            try {
                Date day = sdf.parse(regTM);
                //오늘 자정 지나면
                if (day.getTime() > midnightYesterday.getTime()) {
                    boardMap.put("regTM", regTM.substring(11,16));
                }else{
                    boardMap.put("regTM", regTM.substring(2, 10));
                }
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        ///////////////////////////////////////////////////////////////////
        ////////////////////////   날짜 관련  끝    /////////////////////////
        ///////////////////////////////////////////////////////////////////
      /*  확인용
        for (Map<String, Object> map2 : list) {
            System.out.println(map2);
        }*/
        System.out.println("list 목록 :"+list.toString());
        model.addAttribute("list", list);

        return "bbs/boardList";
    }

    //글쓰기 페이지 보여주기
    @RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
    public String boardWrite_GET(){
        return "bbs/boardWrite";
    }

    // 글쓰기 처리
    @RequestMapping(value = "/boardWrite")
    public String boardWrite_post(@RequestParam Map<String, Object> map, HttpSession session, Model model){
        //디버깅
        System.out.println("/boardWrite post - "+map.toString());
        // 로그인한 아이디 가져오기
        String userid = session.getAttribute("userid").toString();

        map.put("userid", userid);

        int cnt = boardService.insert_Board(map);
//        System.out.println("글 쓰기 처리 : "+cnt);

        String url = "/boardWrite", msg = "글쓰기 중 문제가 발생했습니다. 다시 시도해주세요.\\\\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.";
        if (cnt > 0) {
            url = "boardList";
            msg = "글쓰기 성공";
        }

        model.addAttribute("url",url);
        model.addAttribute("msg",msg);

        return "common/message";
    }

    // 글 상세페이지 보여주기
    @RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
    public String boardDetail_GET(@RequestParam Map<String, Object> map, Model model){
        System.out.println("boardDetail_GET - map.toString() : "+map.toString());
        String category = "";
        Map<String, Object> boardMap = boardService.selectByBoardNum(map);

        // 번호로 조회한 글 정보가 있을경우
        if (boardMap != null && !boardMap.isEmpty()) {
            String regTM = boardMap.get("regTM").toString();
//            System.out.println("가공전 regTM : "+regTM);
            regTM = regTM.substring(0,10)+" "+ regTM.substring(11,16);
//            System.out.println("가공후 regTM : "+regTM);
            boardMap.put("regTM", regTM);

            if ((int)boardMap.get("category") == 1) {
                category = "Q&A";
            }else if((int)boardMap.get("category") == 2){
                category = "후기";
            }else if((int)boardMap.get("category") == 3){
                category = "잡담";
            }

            boardMap.put("category", category);

        }

        System.out.println(boardMap.toString());
        model.addAttribute("boardMap",boardMap);
        return "bbs/boardDetail";
    }

    // 글 수정 페이지 보여주기 시작 //
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modify_GET(@RequestParam Map<String, Object> map, Model model){

        System.out.println("/modify - map : "+map.toString());
        Map<String, Object> boardMap = boardService.selectByBoardNum(map);
        System.out.println("/modify - boardMap : "+boardMap.toString());

        model.addAttribute("boardMap", boardMap);
        return "bbs/boardModify";
    }
    // 글 수정 페이지 보여주기 끝 //

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify_POST(@RequestParam Map<String, Object> map, Model model, HttpSession session){
        System.out.println("/modify_POST - map : "+map.toString());

        String userid = session.getAttribute("userid").toString();
        map.put("userid", userid);

        int cnt = boardService.update_Board(map);
        System.out.println("글 수정 처리 : "+cnt);



        return "/";
    }

} // BoardController 끝
