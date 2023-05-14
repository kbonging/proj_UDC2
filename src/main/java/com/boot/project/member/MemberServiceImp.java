package com.boot.project.member;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberServiceImp implements MemberService {
    private final MemberDAO memberDAO;

    @Override
    public String insert(Map<String, Object> map){
        int affectRowCnt = this.memberDAO.memberInsert(map);
        String result = "";

        if (affectRowCnt == 1) {
            System.out.println("MemberServiceImp insert : "+map.toString());
            System.out.println("MemberServiceImp insert : "+map.get("num"));
            result = String.valueOf(map.get("num"));
            System.out.println("MemberServiceImp result : "+result);
        }

        return result;
    }

    @Override
    public int idCheck(Map<String, Object> map) {
        int cnt = memberDAO.idCheck(map);

        int result = 0;
        if (cnt > 0) {
            result = MemberService.UNUSABLE_ID; //이미 존재함으로 사용불가
        }else{
            result = MemberService.USABLE_ID; // 사용가능
        }

        return result;
    }

    @Override
    public Map<String, Object> memberLogin(Map<String, Object> map) {
        return this.memberDAO.memberLogin(map);
    }

    @Override
    public Map<String, Object> selectBy_userid(Map<String, Object> map) {
        return this.memberDAO.selectBy_userid(map);
    }

    @Override
    public int memberUpdate(Map<String, Object> map) {
        return this.memberDAO.memberUpdate(map);
    }

    @Override
    public int checkPwd(String userid, String pwd) {
        String dbPwd = this.memberDAO.selectPwd(userid);

        int result = 0;
        if(dbPwd !=null && !dbPwd.isEmpty()){
            if(dbPwd.equals(pwd)){
                result = MemberService.LOGIN_OK;
            }else{
                result = MemberService.DISAGREE_PWD;
            }
        }else{
            result = MemberService.NONE_USERID;
        }

        return result;
    }

    @Override
    public int updatePwd(Map<String, Object> map) {
        return this.memberDAO.updatePwd(map);
    }
}
