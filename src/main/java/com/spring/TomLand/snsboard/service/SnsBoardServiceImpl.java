package com.spring.TomLand.snsboard.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.GamjaImgVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.SnsBoardVO;
import com.spring.TomLand.command.SnsLikeVO;
import com.spring.TomLand.snsboard.mapper.ISnsBoardMapper;

@Service
public class SnsBoardServiceImpl implements ISnsBoardService {

	@Autowired
	private ISnsBoardMapper mapper;
	
	@Override
	public void insert(SnsBoardVO vo, MultipartFile file) {
		
		//폴더명 설정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(new Date());
		
		//폴더경로 설정
		String uploadPath = "c:/test/sns/" + fileLoca;
		
		//폴더 만들기
		File folder = new File(uploadPath);
		if(!folder.exists()) folder.mkdirs();
		
		//파일명 뽑아내기(UUID로 문자화 및 "-" 없애기)
		String fileRealName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		//파일 확장자 추출
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		
		String fileName = uuids + fileExtension;
		File saveFile = new File(uploadPath + "/" + fileName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setUploadPath(uploadPath);
		vo.setFileLoca(fileLoca);
		vo.setFileName(fileName);
		vo.setFileRealName(fileRealName);
		
		mapper.insert(vo);
	}

	@Override
	public List<SnsBoardVO> getList(PageVO paging) {
		return mapper.getList(paging);
	}

	@Override
	public SnsBoardVO getDetail(int bno) {
		return mapper.getDetail(bno);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

	@Override
	public void createLike(SnsLikeVO vo) {
		mapper.createLike(vo);
	}
	@Override
	public void deleteLike(SnsLikeVO vo) {
		mapper.deleteLike(vo);
	}
	@Override
	public List<Integer> listLike(String userId) {
		return mapper.listLike(userId);
	}
	
	@Override
	public int searchLike(SnsLikeVO vo) {
		return mapper.searchLike(vo);
	}
	
	@Override
	public List<GamjaImgVO> getImg(int gno) {
		return null;
	}
}
