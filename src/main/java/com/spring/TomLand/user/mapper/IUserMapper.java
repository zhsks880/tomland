package com.spring.TomLand.user.mapper;

import java.util.List;

import com.spring.TomLand.command.CartVO;
import com.spring.TomLand.command.GamjaVO;
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
	
	//카트 목록
	public List<CartVO> getCart(int userNo);
	
	//주문 목록
	public GamjaVO getOrder(int gno);
	
	//이메일 체크
	int emailCheck(String userEmail1);
	
	//아이디 가져오기
	String getUserId(String userEmail1);
	
	//비밀번호 업데이트
	void userPwUpdate(UserVO vo);
	
	//회원 탈퇴
	void userDelete(String userIdChk);
}
