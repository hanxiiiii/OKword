package study.com.mybatis.dao;

import study.com.mybatis.dto.UserlikeDto;

public interface UserlikeDao {
	public void user_like_in(UserlikeDto uldto);
	public void user_like_out(int like_id);

}
