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
}
