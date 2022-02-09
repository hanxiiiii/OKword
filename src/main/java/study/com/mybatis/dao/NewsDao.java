package study.com.mybatis.dao;

import java.util.ArrayList;

import study.com.mybatis.dto.NewsDto;
import study.com.mybatis.dto.UserlikeDto;

public interface NewsDao {
	//마이페이지 뉴스데이터
	 public ArrayList<NewsDto> list(int member_id,int index);
	 public Integer get_pagecnt(int member_id);
	 public Integer user_like_count(int member_id);
	 public void delete(int like_id);
	 public Integer like_id_chk(int member_id,int news_id);
	 public UserlikeDto like_id_select(int member_id,int news_id);
	 //홈화면 뉴스데이터
	 public ArrayList<NewsDto> list2(int sub,String news_writetime);
	 public Integer news_count(NewsDto ndto);
	 public NewsDto news_content(int news_id);
}
