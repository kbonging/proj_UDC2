package com.boot.project.member;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MemberController {
	private final MemberService memberService;



	@RequestMapping(value = "/MemberAgreement", method = RequestMethod.GET)
	public String memberAgreement() {
		return "member/agreement";
	}
	
	
	@RequestMapping(value = "/MemberAgreement", method = RequestMethod.POST)
	public String memberAgreement_POST(@RequestParam String chkAgree) {
		
		String viewName = "";
		if(chkAgree != null) {
			viewName = "redirect:/member";
		}else {
			viewName = "redirect:/MemberAgreement";
		}
		
		return viewName;
	}

	//회원가입 페이지 보여주기
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
		return "member/join";
	}



	///////////////회원가입 처리 시작//////////////
	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public String member_join(@RequestParam Map<String, Object> map, Model model){
//		System.out.println("RequestParam /member_join map : "+map.toString());

		//회원가입 처리 메서드(insert)
		String result = memberService.insert(map);

		String url = "/member", msg ="회원가입 중 문제가 발생했습니다. 다시 시도해주세요.\\\\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.";
		if (result != null && !(result.equals(""))) {
			url = "/";
			msg = "회원가입 되었습니다.";
		}

		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		System.out.println("memberJoin result :"+result);
//		System.out.println("insert 후/memberJoin map : "+map.toString());


		return "common/message";
	}
	///////////////회원가입 처리 끝///////////////

	//////////// 아이디 중복 체크 (ajax) 시작//////////////
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheckAjax(@RequestParam Map<String, Object> map){
		int result = memberService.idCheck(map);

		String answer = Integer.toString(result);

		return answer;
	}
	//////////// 아이디 중복 체크 (ajax) 끝//////////////


	/////////// 로그인 페이지 보여주기 시작  /////////////
	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public String memberLogin(){
		return "member/login";
	}
	/////////// 로그인 페이지 보여주기 끝  /////////////

	/////////// 로그인 처리 시작  /////////////
	@RequestMapping(value = "/memberLogin_post", method = RequestMethod.POST)
	public String memberLogin_post(@RequestParam Map<String, Object> map, Model model, HttpSession session){
		System.out.println("/memberLogin_post : "+map.toString()+", medel : " +model.toString());


		String url = "/memberLogin", msg = "ID 혹은 비밀번호를 잘못 입력하셨거나 등록되지 않은 ID입니다.";

		if (memberService.memberLogin(map) != null && !memberService.memberLogin(map).isEmpty()) {
			Map<String, Object> userMap = memberService.memberLogin(map);
			session.setAttribute("userid", userMap.get("userid"));

			return "redirect:/boardList?category=All";
		}

		model.addAttribute("url",url);
		model.addAttribute("msg",msg);



		return "common/message";
	}
	/////////// 로그인 처리 끝  /////////////

	/////////// 로그아웃 처리 시작  /////////////
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response){


		session.invalidate();
		return "redirect:/memberLogin";
	}
	/////////// 로그아웃 처리 끝  /////////////

	///////// 마이페이지 시작 ////////////
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model){

		// 현재 로그인한 회원 아이디
		String userid = session.getAttribute("userid").toString();
		Map<String,Object> map = new HashMap<>();
		map.put("userid", userid);

		// 로그인한 회원의 정보들이 담긴 Map
	 	Map<String,Object> userMap =  memberService.selectBy_userid(map);

		// 주민번호를 가져와서 생일만 추출
		String jumin = userMap.get("jumin").toString();
		String birthday = jumin.substring(0,6);
		userMap.put("birthday",birthday);

		// 전화번호 '-' 표시 넣어 표시하기
		String tel = userMap.get("tel").toString();
		tel = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" +tel.substring(7);
		userMap.put("tel", tel);
		//System.out.println("userMap : "+userMap.toString());

		model.addAttribute("userMap", userMap);

		return "member/myPage";
	}
	///////// 마이페이지 끝 ////////////

	///////// 회원 정보 수정 페이지 보여주기 시작 ////////////

	@RequestMapping(value = "/memModify", method = RequestMethod.GET)
	public String memModify(HttpSession session, Model model){
		String userid = session.getAttribute("userid").toString();

		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);

		// 로그인한 회원 정보 가져오기
		Map<String, Object> userMap = memberService.selectBy_userid(map);

		// 디버깅
		//System.out.println("/memModify - 로그인한 회원 정보 :"+userMap.toString());

		// DB에서 이메일을 가져와 '@' 기준으로 잘라서 각각 userMap 에 저장
		String uEmail = (String)userMap.get("uEmail");
		String[] emailArr =  uEmail.split("@");
		String uEmail_01 = emailArr[0];
		String uEmail_02 = emailArr[1];

		userMap.put("uEmail_01", uEmail_01);
		userMap.put("uEmail_02", uEmail_02);

		// DB에서 주민번호를 가져와 '-' 기준으로 잘라서 각각 userMap 에 저장
		String jumin = (String)userMap.get("jumin");
		String[] juminArr =  jumin.split("-");
		String jumin_01 = juminArr[0];
		String jumin_02 = juminArr[1];

		userMap.put("jumin_01", jumin_01);
		userMap.put("jumin_02", jumin_02);

		// 전화번호가져와서 나누기
		String tel = (String)userMap.get("tel");
		String mobile1 = tel.substring(0, 3);
		String mobile2 =tel.substring(3, 7);
		String mobile3 =tel.substring(7);

		userMap.put("mobile1", mobile1);
		userMap.put("mobile2", mobile2);
		userMap.put("mobile3", mobile3);

		//System.out.println("뷰로 보낼 userMap :"+userMap.toString());
		model.addAttribute("userMap", userMap);

		return "member/memModify";
	}
	///////// 회원 정보 수정 페이지 보여주기 끝 ////////////


	///////////// 회원 정보 수정 처리 시작 ///////////
	@RequestMapping(value = "/memModify", method = RequestMethod.POST)
	public String memModify_POST(@RequestParam Map<String, Object> map, Model model){
		System.out.println("memModify_POST - map:"+map.toString());


		String msg = "회원정보 수정 중 문제가 발생했습니다. 다시 시도해주세요.\\\\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.";
		String url = "/memModify";

		// 회원정보 수정 메서드
		int cnt = memberService.memberUpdate(map);

		if(cnt > 0){
			msg="회원정보 수정 완료되었습니다.";
			url="/myPage";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	///////////// 회원 정보 수정 처리 끝 ///////////


	////////////  비밀번호 변경 페이지 보여주기 시작 /////////////
	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public String changePwd(HttpSession session, Model model){
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("userid",userid);

		return "member/changePwd";
	}
	////////////  비밀번호 변경 페이지 보여주기 끝 /////////////


	//////////////// 비밀번호 변경 처리 시작 ///////////////////

	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public String changePwd_POST(@RequestParam Map<String, Object> map,
								 HttpSession session, Model model){

		System.out.println("changePwd_POST - map:"+map.toString());

		// 현재 로그인한 회원 아이디
		String userid = session.getAttribute("userid").toString();
		map.put("userid", userid);

		// 사용자 입력 패스워드
		String pwd = (String) map.get("currentPwd");

		int result = memberService.checkPwd(userid, pwd);

		String msg = "비밀번호 체크 실패", url = "/changePwd";

		if(result == MemberService.LOGIN_OK){ // 비밀번호 일치할때
			int cnt = memberService.updatePwd(map);

			if(cnt > 0){ // 비밀번호 변경이 되면
				msg = "비밀번호 변경되었습니다.";
				url = "/myPage";
			}else{
				msg = "비밀번호 변경 실패";
			}
		}else if(result == MemberService.DISAGREE_PWD){ // 비밀번호 불 일치
			msg="비밀번호가 일치하지않습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	//////////////// 비밀번호 변경 처리 끝 ///////////////////
	
}	//MemberController 끝
