package com.web.f5.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.f5.dao.StoreDAO;
import com.web.f5.vo.StoreVO;

public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreDAO storeDao;
	
@Override
	public StoreVO selectSufiles(String storeIdx) {
		// TODO Auto-generated method stub
		return storeDao.selectSufiles(storeIdx);
	}
	@Override
	public int insertResult(StoreVO vo) {
		return storeDao.insert(vo);
	}
	public ArrayList<StoreVO> select(int startCount,int endCount){
		return storeDao.select(startCount, endCount);
	}
	@Override
	public int totalCountResult() {
		return storeDao.execTotalCount();
	}
	@Override
	public StoreVO selectResult(String storeIdx) {
		return storeDao.select(storeIdx);
	}
	@Override
	public StoreVO getmCountResult(String storeIdx) {
		// TODO Auto-generated method stub
		return storeDao.getMaxCount(storeIdx);
	}
	@Override
	public int insertFileResult(StoreVO vo) {
		// TODO Auto-generated method stub
		if(vo != null) {
			for(int i=0; i<vo.getsFiles().length; i++) {
				UUID uuid = UUID.randomUUID();		
				CommonsMultipartFile file = vo.getsFiles()[i];
				
				if(!file.getOriginalFilename().equals("")) { 
					vo.getsFileList().add(file.getOriginalFilename());
					vo.getSuFileList().add(uuid + "_" + file.getOriginalFilename());
				}else {
					vo.getsFileList().add("");
					vo.getSuFileList().add("");
				}
			}
		
		
		}
		return storeDao.insertFile(vo);
	}
	
	@Override
	public void fileSave(StoreVO vo, HttpServletRequest request){
		if(vo != null) {
			for(int i=0; i<vo.getsFiles().length; i++) {
				MultipartFile pfile = vo.getsFiles()[i]; 
			
				if(!pfile.getOriginalFilename().equals("")) {
				
					String root_path = request.getSession().getServletContext().getRealPath("/");
					root_path += "resources/upload/";
					System.out.println(root_path);
					
					File file = new File(root_path + vo.getSuFileList().get(i));			
					try {
						pfile.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}	
	}
	@Override
	public String getStoreIdx() {
		// TODO Auto-generated method stub
		return storeDao.getStoreIdx();
	}
}