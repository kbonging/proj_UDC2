package com.boot.project.member;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberDAO {
    //회원가입
    public int memberInsert(Map<String, Object> map);
    //아이디 중복체크
    public int idCheck(Map<String, Object> map);
    //로그인
    public Map<String, Object> memberLogin(Map<String, Object> map);
    //로그인한 회원 정보 조회
    public Map<String, Object> selectBy_userid(Map<String, Object> map);
    // 회원정보 수정
    public int memberUpdate(Map<String, Object> map);
    // 해당유저 비밀번호 가져오기
    public String selectPwd(String userid);

    // 비밀번호 변경
    public int updatePwd(Map<String, Object> map);

}
