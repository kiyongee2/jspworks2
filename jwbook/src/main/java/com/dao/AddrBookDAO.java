package com.dao;

import java.util.ArrayList;

public class AddrBookDAO {
	
	private ArrayList<AddrBook> addrList = new ArrayList<>();
	
	//주소 추가
	public void add(AddrBook addrBook) {
		addrList.add(addrBook);
	}
	
	//목록 보기
	public ArrayList<AddrBook> getListAll(){
		return addrList;
	}
	
	//상세 보기
	public AddrBook getAbByUserName(String username) {
		AddrBook abByUsername = null;
		for(int i=0; i<addrList.size(); i++) {
			AddrBook ab = addrList.get(i);
			String dbUser = ab.getUsername(); //이미 입력된 이름 가져오기
			if(dbUser.equals(username)) { //입력된 이름과 외부 입력이름이 같다면
				abByUsername = ab;  //해당 객체 저장
				break;
			}
		}
		return abByUsername;
	}
	
	//주소 삭제
	public void delete(String username) {
		for(int i=0; i<addrList.size(); i++) {
			AddrBook ab = addrList.get(i);
			String dbUser = ab.getUsername(); //이미 입력된 이름 가져오기
			if(dbUser.equals(username)) { //입력된 이름과 외부 입력이름이 같다면
				addrList.remove(i);  //해당 객체 삭제
				break;
			}
		}
	}
}
