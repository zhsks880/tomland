package com.spring.TomLand.gamjareview.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.GamjaReviewVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.gamjareview.mapper.IGamjaReviewMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GamjaReviewServiceImpl implements IGamjaReviewService {
	
	@Autowired
	private IGamjaReviewMapper mapper;
	
	@Override
	public void insert(GamjaReviewVO vo, MultipartFile file) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(new Date());
		String uploadPath = "c:/test/review/" + fileLoca;
		File folder = new File(uploadPath);
		if(!folder.exists()) folder.mkdirs();
		String fileRealName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
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
	public List<GamjaReviewVO> getList(PageVO paging) {
		return mapper.getList(paging);
	}

	@Override
	public GamjaReviewVO getDetail(int bno) {
		return null;
	}

	@Override
	public void delete(int bno) {

	}

}
