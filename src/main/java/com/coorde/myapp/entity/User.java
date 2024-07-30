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
	private String user_detail_address;
	@NonNull private int user_ch;
	@NonNull private int user_arm;
	@NonNull private int user_waist;
	@NonNull private int user_top;
	@NonNull private int user_bot;
	@NonNull private int user_sh;
	@NonNull private int user_thighs;
	@NonNull private int user_hem;
	@NonNull private String user_email;
	private int userAge; // 사용자 나이 (추가된 필드)
	
	private Date joined_dt;
	private String user_cate;
	private String faq_cate;
	private String faq_title;
	private String faq_detail;
	private String faq_answer;

	
	
}

