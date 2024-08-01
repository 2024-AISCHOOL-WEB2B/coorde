package com.coorde.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.coorde.myapp.entity.Closet;
import com.coorde.myapp.entity.User;

@Mapper
public interface ClosetMapper {

	List<Closet> getClosetList(String cl_cate);
	
	List<Closet> getAllCloset();

	int deleteCloset(List<String> closetIdx);
	
	int deleteClosetAndSize(@Param("closetIdx") List<String> closetIdx);
	
	int updateCloset(List<Closet> closets);

	List<String> getTopColors(User loginUser);
	
	List<String> getTopCategories(User loginUser);
	
	List<Closet> getFilteredClothes(Map<String, Object> params);

	int checkWish(Map<String, Object> wishItem);

	int insertToWish(Map<String, Object> wishItem);

	int deleteToWish(Map<String, Object> wishItem);
	
	List<Closet> getWishListWithClosetInfo(String userId);
	
	int deleteWishlistItems(@Param("clIdxList") List<String> clIdxList, @Param("userId") String userId);

    int checkStar(Map<String, Object> reviewInfo);

    int insertStar(Map<String, Object> reviewInfo);

    int updateStar(Map<String, Object> reviewInfo);

	List<Closet> getClosetListWithFilters(Map<String, Object> params);

	

	
	
}
