package com.web.f5.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.f5.vo.BoardVO;

public class FileServiceImpl {
	
	// 멀티 파일 저장
	public void multiFileSave(BoardVO vo, HttpServletRequest request) throws Exception {
		
		if( vo != null ) {
			for( int i = 0; i<vo.getFiles().length; i++ ) {
				CommonsMultipartFile bFile = vo.getFiles()[i];
				
				if(!bFile.getOriginalFilename().equals("")) {
					String root_path = request.getSession().getServletContext().getRealPath("/");
					root_path += "resources\\upload\\";
					
					File file = new File(root_path + vo.getBsFiles().get(i));
					bFile.transferTo(file);
				}
			}
		}
	}
	
	// 멀티파일 체크
	public BoardVO mutiFileCheck(BoardVO vo) {
		if(vo != null) {
			
			System.out.println(vo.getFiles().length);
			
			for( int i = 0; i<vo.getFiles().length; i++) {
				UUID uuid = UUID.randomUUID();
				CommonsMultipartFile bFile = vo.getFiles()[i];

				if(!bFile.getOriginalFilename().equals("")) {
					vo.getbFiles().add(bFile.getOriginalFilename());
					vo.getBsFiles().add(uuid + "_" + bFile.getOriginalFilename());
				} else {
					vo.getbFiles().add("");
					vo.getBsFiles().add("");
					
				}
				
			}
			
		}
		return vo;
	}
	
	// 멀티파일 수정
	public int multiFileSave(BoardVO vo, HttpServletRequest request, List<String> fname) throws Exception {
		
		int check = 0;
		
		if( vo.getFiles() != null && vo.getFiles().length == 5 ) {
			for( int i = 0; i<vo.getFiles().length; i++ ) {
				CommonsMultipartFile bFile = vo.getFiles()[i];
				
				if(!bFile.getOriginalFilename().equals("")) {
					String root_path = request.getSession().getServletContext().getRealPath("/");
					root_path += "resources\\upload\\";
					
					
					File file = new File(root_path + vo.getBsFiles().get(i));

					bFile.transferTo(file);
					
					File ofile = new File(root_path + fname.get(i));

					if( ofile.exists() ) {
						ofile.delete();
					}
				}
				check = 1;
			}
		}
		return check;
	}
	
}







