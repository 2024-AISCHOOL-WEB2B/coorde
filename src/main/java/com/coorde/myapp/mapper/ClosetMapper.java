package com.coorde.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.coorde.myapp.entity.Closet;

@Mapper
public interface ClosetMapper {

	List<Closet> getClosetList(String cl_cate);
	
	List<Closet> getAllCloset();

	int deleteCloset(List<String> closetIdx);
	
	int deleteClosetAndSize(List<String> closetIdx);

	
}
