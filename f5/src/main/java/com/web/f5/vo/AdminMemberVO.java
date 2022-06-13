package com.web.f5.vo;

public class AdminMemberVO {

	String memberId;
	String memberPass;
	String memberName;
	String memberBirth;
	String memberGender;
	String memberTel;
	String memberEmail;
	String memberAddress;
	String memberDate;
	String memberAuthority;
	String memberAgree;
	String memberPassHint;
	String memberPassHintAnswer;
	String memberPassRand;
	String storeName;
	String storeIdx;
	String storePlace;
	int rno;
	
	String postcode;
	String address;
	String detailAddress;
	String extraAddress;
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreIdx() {
		return storeIdx;
	}
	public void setStoreIdx(String storeIdx) {
		this.storeIdx = storeIdx;
	}
	public String getStorePlace() {
		return storePlace;
	}
	public void setStorePlace(String storePlace) {
		this.storePlace = storePlace;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPass() {
		return memberPass;
	}
	public void setMemberPass(String memberPass) {
		this.memberPass = memberPass;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getMemberAddress() {
		
		if ( postcode != null && address != null && detailAddress != null ) {
			
			memberAddress = postcode + " " + address + " " + detailAddress;
		}
		
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
	public String getMemberAuthority() {
		return memberAuthority;
	}
	public void setMemberAuthority(String memberAuthority) {
		this.memberAuthority = memberAuthority;
	}
	public String getMemberAgree() {
		return memberAgree;
	}
	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}
	public String getMemberPassHintAnswer() {
		return memberPassHintAnswer;
	}
	public void setMemberPassHintAnswer(String memberPassHintAnswer) {
		this.memberPassHintAnswer = memberPassHintAnswer;
	}
	public String getMemberPassHint() {
		return memberPassHint;
	}
	public void setMemberPassHint(String memberPassHint) {
		this.memberPassHint = memberPassHint;
	}
	public String getMemberPassRand() {
		return memberPassRand;
	}
	public void setMemberPassRand(String memberPassRand) {
		this.memberPassRand = memberPassRand;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
}
