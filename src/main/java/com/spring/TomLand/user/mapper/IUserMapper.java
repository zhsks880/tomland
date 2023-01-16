package com.spring.TomLand.user.mapper;

import java.util.List;

import com.spring.TomLand.command.UserVO;

public interface IUserMapper {
	
	//아이디 중복 확인
	int idCheck(String userId);
	
	//회원가입
	void join(UserVO vo);
	
	//로그인
	UserVO login(String id);
	
	//마이페이지
	List<UserVO> getInfo(String id);
	
	//마이페이지 수정
	void userUpdate(UserVO vo);
	
	//나의 총게시글 카운트
	int writeCount(String userId);
	
	//나의 총댓글 카운트
	int replyCount(String userId);
	
	//나의 총이미지게시글 카운트
	int imgCount(String userId);
	
	//나의 총판매상품 카운트
	int gamjaCount(String userId);
	
}
