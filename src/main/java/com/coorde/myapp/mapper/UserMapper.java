package com.coorde.myapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.coorde.myapp.entity.User;

@Mapper
public interface UserMapper {  // xml에 기재된 sql을 호출하는 인터페이스
	
    int signUp(User user);  // signUp sql 호출
    
	User userlogin(User user);

	User gomyPage(User user);

	String idFind(User user);

	String pwFind(User user);
}
