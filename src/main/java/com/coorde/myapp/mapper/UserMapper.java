package com.coorde.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.coorde.myapp.entity.User;

import lombok.NonNull;

@Mapper
public interface UserMapper {  // xml에 기재된 sql을 호출하는 인터페이스
	
    int signUp(User user);  // signUp sql 호출
    
	User userlogin(User user);

	User gomyPage(User user);

	String idFind(User user);

	String pwFind(User user);
	
	// 매니저 유저리스트에서 유저정보 가져오기
	List<User> getAllUsers();
	
	// 매니저 유저리스트에서 매니저가 삭제
	int deleteUsers(List<String> userIds);
	
	int checkDuplicate(@Param("field") String field, @Param("value") String value);

	// 회원 정보 수정 화면에서 탈퇴
	int deleteUser(@Param("userId") String userId, @Param("password") String password);

	// 회원 정보 수정
	int updateUser(User user);

	User findUserById(String userId);
	
	void updateUserMeasurements(@Param("userId") String userId, @Param("updates") Map<String, Integer> updates);

	User getUserById(@NonNull String user_id);
	
	List<User> goUserFaq(User user);
	
	int submitFaq(User user);
	
	List<User> goManagerFaq();

	int submitAnswer(User user);

}
