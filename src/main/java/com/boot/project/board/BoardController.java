package com.boot.project.board;

import com.boot.project.comments.CommentsService;
import com.boot.project.common.ConstUtill;
import com.boot.project.common.PaginationInfo;
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
    private final CommentsService commentsService;

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

        int nowPage = 1;

        if(map.get("nowPage")!=null){
            nowPage = Integer.parseInt(map.get("nowPage").toString());
            //System.out.println("나우페이지가 있을떄 여기걸쳐");
        }

        int currentPage = nowPage;
        //[1] PaginationInfo 생성
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setBlockSize(ConstUtill.BLOCKSIZE);
        paginationInfo.setRecordCountPerPage(ConstUtill.RECORD_COUNT);
        paginationInfo.setCurrentPage(currentPage);
        int start = 0;
        int end = paginationInfo.getRecordCountPerPage();

        start = paginationInfo.getFirstRecordIndex();
        map.put("start", start);
        map.put("end", end);

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
            paginationInfo.setTotalRecord(boardService.select_countCategory(map));
        }else{ // 카테고리 = All
            //전체 게시물 가져오기

            //System.out.println("게시물 가져오기할떄 파라미터 : "+map.toString());
            list = boardService.select_ALL(map);
            // 총 게시물 수
            paginationInfo.setTotalRecord(boardService.select_countAll(map));
        }
        
        // 페이징 디버깅 시작
//        System.out.println("*****************************");
//        System.out.println("getTotalPage :"+paginationInfo.getTotalPage());
//        System.out.println("getCurrentPage :"+paginationInfo.getCurrentPage());
//        System.out.println("getBlockSize : "+paginationInfo.getBlockSize());
//        System.out.println("getTotalRecord :"+paginationInfo.getTotalRecord());
//        System.out.println("getRecordCountPerPage :"+paginationInfo.getRecordCountPerPage());
//        System.out.println("getFirstPage :"+paginationInfo.getFirstPage());
//        System.out.println("getLastPage :"+paginationInfo.getLastPage());
//        System.out.println("getFirstRecordIndex :"+paginationInfo.getFirstRecordIndex());
//        System.out.println("getLastRecordIndex :"+paginationInfo.getLastRecordIndex());
//        System.out.println("*****************************");
        // 페이징 디버깅 끝


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
            //System.out.println("/boardList - DB에서 가져온 regTM : "+regTM);


            regTM = regTM.substring(0,10)+" "+regTM.substring(11);
            //System.out.println("substring 후 regTM : "+regTM);

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

        //카테고리 숫자 > 변경 예) 1 > Q&A
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> boardMap = list.get(i);
            String strCategory = boardMap.get("category").toString();
            if (strCategory.equals("1")) {
                strCategory = "Q&A";
            }else if(strCategory.equals("2")){
                strCategory = "후기";
            }else if(strCategory.equals("3")){
                strCategory = "잡담";
            }
            boardMap.put("category", strCategory);
        }
      /*  확인용
        for (Map<String, Object> map2 : list) {
            System.out.println(map2);
        }*/

        // 해당 게시글의 댓글 개수 구하기
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> boardMap = list.get(i);
            int commentsCnt = commentsService.select_commentsCnt(boardMap);
            boardMap.put("commentsCnt", commentsCnt);
        }

        //System.out.println("list 목록 :"+list.toString());
        if(category==0){
            map.put("category", "All");
        }else if (category==1) {
            map.put("category", "Q&A");
        }else if(category==2){
            map.put("category", "Review");
        }else if(category==3){
            map.put("category", "Chat");
        }

        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("list", list);
        //System.out.println("model.addAttribute 될 map : "+map.toString());
        model.addAttribute("map", map);

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
        System.out.println("/boardWrite post (글쓰기 처리)- "+map.toString());
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
        //System.out.println("boardDetail_GET - map.toString() : "+map.toString());
        String category = "";

        //조회수 증가
        boardService.update_readCnt(map);

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

        //System.out.println(boardMap.toString());
        model.addAttribute("boardMap",boardMap);
        return "bbs/boardDetail";
    }

    // 글 수정 페이지 보여주기 시작 //
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modify_GET(@RequestParam Map<String, Object> map, Model model){

        //System.out.println("/modify - map : "+map.toString());
        Map<String, Object> boardMap = boardService.selectByBoardNum(map);
        //System.out.println("/modify - boardMap : "+boardMap.toString());

        model.addAttribute("boardMap", boardMap);
        return "bbs/boardModify";
    }
    // 글 수정 페이지 보여주기 끝 //

    // 글 수정 처리 시작 //
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify_POST(@RequestParam Map<String, Object> map, Model model, HttpSession session){
        //System.out.println("/modify_POST - map : "+map.toString());

        String userid = session.getAttribute("userid").toString();
        map.put("userid", userid);

        int cnt = boardService.update_Board(map);
        //System.out.println("글 수정 처리 : "+cnt);

        String url="/modify?num="+map.get("num").toString(), msg="글수정 중 문제가 발생했습니다. 다시 시도해주세요.\\\\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.";

        if(cnt > 0){
            url="/boardDetail?num="+map.get("num").toString();
            msg="수정 처리 되었습니다.";
        }

        model.addAttribute("url",url);
        model.addAttribute("msg",msg);
        return "common/message";
    }
    // 글 수정 처리 끝 //

    // 글 삭제 처리//
    @RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
    public String boardDelete(@RequestParam Map<String, Object> map){
        //System.out.println("/boardDelete map : "+map.toString());
        int cnt = boardService.delete_Board(map);
        //System.out.println("삭제 처리 cnt:"+cnt);
        //System.out.println("map : "+map.toString());

        return "redirect:/boardList?category=All";
    }

} // BoardController 끝
