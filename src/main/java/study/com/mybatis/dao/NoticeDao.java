package study.com.mybatis.dao;

import java.util.ArrayList;

import study.com.mybatis.dto.NoticeDto;



public interface NoticeDao {

	public ArrayList<NoticeDto> notice_list(String sword,int index);
	public Integer get_pagecnt();
	public NoticeDto notice_content(String id);
	
	
	
}
