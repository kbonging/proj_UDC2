package com.boot.project.email;

import lombok.RequiredArgsConstructor;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/email")
@RequiredArgsConstructor
public class EmailController {
    // 생성자 주입
    private final EmailService emailService;

    @RequestMapping("/emailTest")
    @ResponseBody
    public String emailTest(){
        return "emailTest";
    }

    @RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
    @ResponseBody
    public String sendEmail(@RequestParam String email){
        System.out.println("/sendEmail -"+email);
        String ePw = emailService.createKey();

        String subject="<인증번호>";
        String content="";
        content+= "<div style='margin:20px;'>";
        content+= "<h1> 안녕하세요 UDC입니다. </h1>";
        content+= "<br>";
        content+= "<p>아래 코드를 복사해 입력해주세요<p>";
        content+= "<br>";
        content+= "<p>감사합니다.<p>";
        content+= "<br>";
        content+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
        content+= "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
        content+= "<div style='font-size:130%'>";
        content+= "CODE : <strong>";
        content+= ePw+"</strong><div><br/> ";
        content+= "</div>";

        try {
            emailService.sendEmail(email, subject, content);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("ePw",ePw);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

        return jsonObject.toString();
    }
}
