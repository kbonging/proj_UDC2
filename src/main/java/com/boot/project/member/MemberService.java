package com.boot.project.member;

import java.util.Map;

public interface MemberService {
    //아이디 중복확인에서 사용하는 상수
    public static final int USABLE_ID=1;  //사용가능한 아이디
    public static final int UNUSABLE_ID=2; //이미 존재해서 사용불가능한 아이디

    //로그인 체크에서 사용하는 상수
    public static final int LOGIN_OK=1;  // 로그인 성공
    public static final int DISAGREE_PWD=2;  //비번 불일치
    public static final int NONE_USERID=3;  //해당 아이디 없다

    //회원가입
    public String insert(Map<String, Object> map);

    // 아이디 중복 체크
    public int idCheck(Map<String, Object> map);

    //로그인
    public Map<String, Object> memberLogin(Map<String, Object> map);

    //로그인한 회원 정보 조회
    public Map<String, Object> selectBy_userid(Map<String, Object> map);

    // 회원정보 수정
    public int memberUpdate(Map<String, Object> map);

    // 비밀번호 체크
    public int checkPwd(String userid, String pwd);

    // 비밀번호 변경
    public int updatePwd(Map<String, Object> map);
}
