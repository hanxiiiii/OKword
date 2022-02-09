package study.com.mybatis.dao;

import java.util.ArrayList;

import study.com.mybatis.dto.CommentDto;

public interface CommentDao {
	//마이페이지 댓글
	public ArrayList<CommentDto> cmlist(int member_id,int index2);
	public void delete(int comment_id);
	public Integer get_pagecnt2(int member_id);
	public Integer user_comment_count(int member_id);
	//댓글페이지 댓글
	public void comment_view_all_ok(CommentDto cdto);
	public ArrayList<CommentDto> clist(Integer news_id);
	public void comment_delete(int comment_id);
}
