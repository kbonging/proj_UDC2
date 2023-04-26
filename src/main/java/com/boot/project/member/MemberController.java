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

			return "redirect:/";
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


}	//MemberController 끝
