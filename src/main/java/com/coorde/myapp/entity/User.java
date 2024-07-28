package com.coorde.myapp.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@ToString
@AllArgsConstructor
public class User {
	
	@NonNull private String user_id;
	@NonNull private String user_pw;
	@NonNull private String user_name;
	@NonNull private String user_birth;
	@NonNull private String user_phone;
	@NonNull private int user_hei;
	@NonNull private int user_wei;
	@NonNull private String user_addr;
	@NonNull private String user_detail_address;
	@NonNull private String user_ch;
	@NonNull private String user_arm;
	@NonNull private String user_waist;
	@NonNull private String user_top;
	@NonNull private String user_bot;
	@NonNull private String user_sh;
	@NonNull private String user_thighs;
	private int userAge; // 사용자 나이 (추가된 필드)
	
	private Date joined_dt;
	private String user_cate;
}

