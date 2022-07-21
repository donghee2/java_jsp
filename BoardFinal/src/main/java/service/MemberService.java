package service;

import java.sql.Connection;

import config.DBManager;
import dao.MemberDAO;
import dto.MemberDTO;
import mapper.MemberMapper;

public class MemberService {
	private static MemberService instance = new MemberService();

	private MemberService() {
	}

	public static MemberService getInstance() {
		if(instance == null)
			instance = new MemberService();
		return instance;
	}
	
	public MemberDTO login(String id, String passwd) {
		return MemberMapper.getInstance().login(id, passwd);
	}
	
}