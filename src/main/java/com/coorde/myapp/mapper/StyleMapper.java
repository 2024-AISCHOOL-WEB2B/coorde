package com.coorde.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.coorde.myapp.entity.Style;

@Mapper
public interface StyleMapper {

//	@Insert("insert into tb_user(user_id,user_pw,user_name,user_nick) values(#{user_id},#{user_pw},#{user_name},#{user_nick})")
//	int signUpSuccess(User user);
//
//	boolean selectId(String user_id); //중복 Id 검색
//	
//	public User userSelect(User user) ;
//
//	public List<Style> styleList();
//	
//	public int checkStyleHeart(Style style);
//	
//	public int insertStyleHeart(Style style);
//
//	public int deleteStyleHeart(Style style);
//	
//	public int checkCloset(Style style);
//	
//	public int insertCloset(Style style);
//
//	public int deleteCloset(Style style);
//	
//	public List<Style> likeStyleList(String user_id);
//	
//	public List<Style> getTags(String user_id);
//	
//	public List<Style> myClosetList(String user_id);
//	
//	public List<Style> recoList(String user_id);
//
//	public int insertStyleReco(Style style);
//
//	public int deleteStyleReco(String user_id);
//	
//	public List<Style> filterStyleCate(String style_cate);
//
//	public List<Style> filterStyleColor(String style_color);
//
//	public List<Style> filterStyleTag(String style_tag);
//	
}
