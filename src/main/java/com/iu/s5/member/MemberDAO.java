package com.iu.s5.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.s5.member.MemberDAO.";

	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getIdCheck", memberDTO);
	}
	
	public MemberDTO getNickNameCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getNickNameCheck", memberDTO);
	}
	
	public int setJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setJoin", memberDTO);
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
	}
	
	public int setDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", memberDTO);
	}
	
	public int setFileInsert(MemberFilesDTO memberFilesDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setFileInsert", memberFilesDTO);
	}
	
	public MemberFilesDTO getFile(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getFile", memberDTO);
	}
}
