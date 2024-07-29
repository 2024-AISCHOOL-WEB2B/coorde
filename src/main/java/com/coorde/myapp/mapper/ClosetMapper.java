package com.coorde.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.coorde.myapp.entity.Closet;

@Mapper
public interface ClosetMapper {

	List<Closet> getClosetList(String cl_cate);
	
	List<Closet> getAllCloset();

	int deleteCloset(List<String> closetIdx);
	
	int deleteClosetAndSize(List<String> closetIdx);

	List<String> getTopColors(String user_id);
	
	List<String> getTopCategories(String user_id);
	
	List<Closet> getFilteredClothes(Map<String, Object> params);

	int checkWish(Map<String, Object> wishItem);

	int insertToWish(Map<String, Object> wishItem);

	int deleteToWish(Map<String, Object> wishItem);

	
}
