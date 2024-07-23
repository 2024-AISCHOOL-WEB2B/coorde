package com.coorde.myapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.coorde.myapp.entity.User;

@Mapper
public interface UserMapper {
    int signUp(User user);
    User userSelect(User user);
}
