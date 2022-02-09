package study.com.mybatis.dao;

import java.util.ArrayList;

import study.com.mybatis.dto.KwordDto;
import study.com.mybatis.dto.NewsDto;





public interface KwordDao {
	public ArrayList<KwordDto> Klist(int subject_id, String date2);
	public String news_list(int keyword_id);
	public ArrayList<NewsDto> news_list2(String value);
	public ArrayList<KwordDto> list_100(String date2);
}
