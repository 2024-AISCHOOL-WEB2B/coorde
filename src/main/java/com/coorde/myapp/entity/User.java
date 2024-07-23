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
	@NonNull private String user_hei;
	@NonNull private String user_wei;
	@NonNull private String user_addr;
	@NonNull private String user_detail_address;
	
	private Date joined_dt;
	private String user_type;
}

