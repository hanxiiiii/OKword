package study.com.mybatis.dao;

import study.com.mybatis.dto.MemberDto;

public interface MemberDao {
	public void write(MemberDto mdto);
	public void Dwrite(MemberDto mdto);
	public Integer id_check(String user_id);
	public void update(MemberDto mdto);
	public MemberDto user_data(String user_id);
	public void logoff(MemberDto mdto);
	public void loginstate0(MemberDto mdto);
	public void like_change(MemberDto mdto);	
}
