package com.web.f5.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AdminBoardVO {

	String boardIdx;
	String memberId;
	int boardHits;
	String boardTitle;
	String boardContent;
	String boardDate;
	String boardUpdateDate;
	String boardSort;
	String boardCategory;
	int rno;
	
	String bFile1, bFile2, bFile3, bFile4, bFile5,
	bsFile1, bsFile2, bsFile3, bsFile4, bsFile5;
	
	CommonsMultipartFile[] files;	// 폼에서 넘어오는 멀티파일
	List<String> bFiles = new ArrayList<String>(); // DB에 저장되는 bFile
	List<String> bsFiles = new ArrayList<String>(); // DB에 저장되는 bsFile
	
	public String getbFile1() {
		return bFile1;
	}
	public void setbFile1(String bFile1) {
		this.bFile1 = bFile1;
	}
	public String getbFile2() {
		return bFile2;
	}
	public void setbFile2(String bFile2) {
		this.bFile2 = bFile2;
	}
	public String getbFile3() {
		return bFile3;
	}
	public void setbFile3(String bFile3) {
		this.bFile3 = bFile3;
	}
	public String getbFile4() {
		return bFile4;
	}
	public void setbFile4(String bFile4) {
		this.bFile4 = bFile4;
	}
	public String getbFile5() {
		return bFile5;
	}
	public void setbFile5(String bFile5) {
		this.bFile5 = bFile5;
	}
	public String getBsFile1() {
		return bsFile1;
	}
	public void setBsFile1(String bsFile1) {
		this.bsFile1 = bsFile1;
	}
	public String getBsFile2() {
		return bsFile2;
	}
	public void setBsFile2(String bsFile2) {
		this.bsFile2 = bsFile2;
	}
	public String getBsFile3() {
		return bsFile3;
	}
	public void setBsFile3(String bsFile3) {
		this.bsFile3 = bsFile3;
	}
	public String getBsFile4() {
		return bsFile4;
	}
	public void setBsFile4(String bsFile4) {
		this.bsFile4 = bsFile4;
	}
	public String getBsFile5() {
		return bsFile5;
	}
	public void setBsFile5(String bsFile5) {
		this.bsFile5 = bsFile5;
	}
	public CommonsMultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(CommonsMultipartFile[] files) {
		this.files = files;
	}
	public List<String> getbFiles() {
		return bFiles;
	}
	public void setbFiles(List<String> bFiles) {
		this.bFiles = bFiles;
	}
	public List<String> getBsFiles() {
		return bsFiles;
	}
	public void setBsFiles(List<String> bsFiles) {
		this.bsFiles = bsFiles;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardUpdateDate() {
		return boardUpdateDate;
	}
	public void setBoardUpdateDate(String boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}
	public String getBoardSort() {
		return boardSort;
	}
	public void setBoardSort(String boardSort) {
		this.boardSort = boardSort;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
}
