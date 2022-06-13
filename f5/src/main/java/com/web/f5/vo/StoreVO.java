package com.web.f5.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class StoreVO {
	
	String storeIdx,storeName,storePlace,storeContent,storeTel,storeEvent,storeBenefit,storeCategory,storeParking,storeWebSite,storePrice
			,storeMinPrice,storeMaxPrice,storeMinPriceWon,storeMaxPriceWon;
	String sFile1,sFile2,sFile3,sFile4,sFile5;
	String suFile1,suFile2,suFile3,suFile4,suFile5;
	CommonsMultipartFile[] sFiles;
	int storeMaxCount,rno;
	
	List<String> sFileList=new ArrayList();
	List<String> suFileList=new ArrayList();
	
	
	
	public CommonsMultipartFile[] getsFiles() {
		return sFiles;
	}
	public void setsFiles(CommonsMultipartFile[] sFiles) {
		this.sFiles = sFiles;
	}
	public List<String> getsFileList() {
		return sFileList;
	}
	public void setsFileList(List<String> sFileList) {
		this.sFileList = sFileList;
	}
	public List<String> getSuFileList() {
		return suFileList;
	}
	public void setSuFileList(List<String> suFileList) {
		this.suFileList = suFileList;
	}
	public String getsFile1() {
		return sFile1;
	}
	public void setsFile1(String sFile1) {
		this.sFile1 = sFile1;
	}
	public String getsFile2() {
		return sFile2;
	}
	public void setsFile2(String sFile2) {
		this.sFile2 = sFile2;
	}
	public String getsFile3() {
		return sFile3;
	}
	public void setsFile3(String sFile3) {
		this.sFile3 = sFile3;
	}
	public String getsFile4() {
		return sFile4;
	}
	public void setsFile4(String sFile4) {
		this.sFile4 = sFile4;
	}
	public String getsFile5() {
		return sFile5;
	}
	public void setsFile5(String sFile5) {
		this.sFile5 = sFile5;
	}
	public String getSuFile1() {
		return suFile1;
	}
	public void setSuFile1(String suFile1) {
		this.suFile1 = suFile1;
	}
	public String getSuFile2() {
		return suFile2;
	}
	public void setSuFile2(String suFile2) {
		this.suFile2 = suFile2;
	}
	public String getSuFile3() {
		return suFile3;
	}
	public void setSuFile3(String suFile3) {
		this.suFile3 = suFile3;
	}
	public String getSuFile4() {
		return suFile4;
	}
	public void setSuFile4(String suFile4) {
		this.suFile4 = suFile4;
	}
	public String getSuFile5() {
		return suFile5;
	}
	public void setSuFile5(String suFile5) {
		this.suFile5 = suFile5;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getStoreMinPrice() {
		return storeMinPrice;
	}
	public void setStoreMinPrice(String storeMinPrice) {
		this.storeMinPrice = storeMinPrice;
	}
	public String getStoreMaxPrice() {
		return storeMaxPrice;
	}
	public void setStoreMaxPrice(String storeMaxPrice) {
		this.storeMaxPrice = storeMaxPrice;
	}
	public String getStoreMinPriceWon() {
		return storeMinPriceWon;
	}
	public void setStoreMinPriceWon(String storeMinPriceWon) {
		this.storeMinPriceWon = storeMinPriceWon;
	}
	public String getStoreMaxPriceWon() {
		return storeMaxPriceWon;
	}
	public void setStoreMaxPriceWon(String storeMaxPriceWon) {
		this.storeMaxPriceWon = storeMaxPriceWon;
	}
	public String getStoreParking() {
		return storeParking;
	}
	public void setStoreParking(String storeParking) {
		this.storeParking = storeParking;
	}
	public String getStoreWebSite() {
		return storeWebSite;
	}
	public void setStoreWebSite(String storeWebSite) {
		this.storeWebSite = storeWebSite;
	}
	public String getStorePrice() {
		if(storePrice != null) {
			return storePrice;
		}else {
			return storeMinPrice  + "원    ~   "+storeMaxPrice + "원";
		}
	}
	public void setStorePrice(String storePrice) {
		this.storePrice = storePrice;
	}
	public int getStoreMaxCount() {
		return storeMaxCount;
	}
	public void setStoreMaxCount(int storeMaxCount) {
		this.storeMaxCount = storeMaxCount;
	}
	public String getStoreIdx() {
		return storeIdx;
	}
	public void setStoreIdx(String storeIdx) {
		this.storeIdx = storeIdx;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorePlace() {
		return storePlace;
	}

	public void setStorePlace(String storePlace) {
		this.storePlace = storePlace;
	}

	public String getStoreContent() {
		return storeContent;
	}

	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}

	public String getStoreTel() {
		return storeTel;
	}

	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}

	public String getStoreEvent() {
		return storeEvent;
	}

	public void setStoreEvent(String storeEvent) {
		this.storeEvent = storeEvent;
	}

	public String getStoreBenefit() {
		return storeBenefit;
	}

	public void setStoreBenefit(String storeBenefit) {
		this.storeBenefit = storeBenefit;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	
}
