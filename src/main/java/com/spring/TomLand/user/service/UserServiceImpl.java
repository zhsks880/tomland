package com.spring.TomLand.user.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.javassist.bytecode.LineNumberAttribute.Pc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.FreeBoardVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.UserVO;
import com.spring.TomLand.user.mapper.IUserMapper;
import com.spring.TomLand.util.PageCreator;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserMapper mapper;
	
	@Autowired
	private PageCreator pc;
	
	
	@Override
	public int idCheck(String userId) {
		return mapper.idCheck(userId);
	}

	@Override
	public void join(UserVO vo, MultipartFile file) {
		
		//비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(vo.getUserPw());
		vo.setUserPw(securePw);
		
		//폴더만들기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String userFileLoca = sdf.format(new Date());
		
		//폴더 경로 설정
		String userUploadPath = "c:/test/tomland/" + userFileLoca;
		
		//폴더 만들기
		File folder = new File(userUploadPath);
		if(!folder.exists()) folder.mkdirs();
		
		//파일명 (UUID 화 시키기)
		String userFileRealName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		//파일 확장자 추출
		String fileExtension = userFileRealName.substring(userFileRealName.lastIndexOf("."), userFileRealName.length());	
		String userFileName = uuids + fileExtension;
		File saveFile = new File(userUploadPath + "/" + userFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		vo.setUserUploadPath(userUploadPath);
		vo.setUserFileLoca(userFileLoca);
		vo.setUserFileName(userFileName);
		vo.setUserFileRealName(userFileRealName);
		
		mapper.join(vo);	
	}

	@Override
	public UserVO login(String id) {
		return mapper.login(id);
	}

	@Override
	public List<UserVO> getInfo(String id) {
		return mapper.getInfo(id);
	}

	@Override
	public void userUpdate(UserVO vo, MultipartFile file) {
		//비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(vo.getUserPw());
		vo.setUserPw(securePw);
		
		//폴더만들기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String userFileLoca = sdf.format(new Date());
		
		//폴더 경로 설정
		String userUploadPath = "c:/test/tomland/" + userFileLoca;
		
		//폴더 만들기
		File folder = new File(userUploadPath);
		if(!folder.exists()) folder.mkdirs();
		
		//파일명 (UUID 화 시키기)
		String userFileRealName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		//파일 확장자 추출
		String fileExtension = userFileRealName.substring(userFileRealName.lastIndexOf("."), userFileRealName.length());
		String userFileName = uuids + fileExtension;
		File saveFile = new File(userUploadPath + "/" + userFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		vo.setUserUploadPath(userUploadPath);
		vo.setUserFileLoca(userFileLoca);
		vo.setUserFileName(userFileName);
		vo.setUserFileRealName(userFileRealName);
				
		mapper.userUpdate(vo);
	}
	
	@Override
	public int writeCount(String userId) {
		return mapper.writeCount(userId);
	}
	
	@Override
	public int replyCount(String userId) {
		return mapper.replyCount(userId);
	}
	@Override
	public int gamjaCount(String userId) {
		return mapper.gamjaCount(userId);
	}
	@Override
	public int imgCount(String userId) {
		return mapper.imgCount(userId);
	}
	
	//getTotal
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.writeCount(vo.getUserId()));
		return pc;
	}
	
}
