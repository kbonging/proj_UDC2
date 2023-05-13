package com.boot.project.member;

import java.util.Map;

public interface MemberService {
    //아이디 중복확인에서 사용하는 상수
    public static final int USABLE_ID=1;  //사용가능한 아이디
    public static final int UNUSABLE_ID=2; //이미 존재해서 사용불가능한 아이디

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
}
