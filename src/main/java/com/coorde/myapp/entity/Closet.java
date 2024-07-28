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
@ToString
public class Closet {
	
	@NonNull private String cl_idx;
	@NonNull private String cl_name;
	@NonNull private String cl_cate;
	@NonNull private String cl_cate_detail;
	@NonNull private String cl_color;
	@NonNull private String cl_imgurl;
	@NonNull private String cl_url;
	@NonNull private String cl_price;
	@NonNull private String cl_dc_price;
	@NonNull private String cl_cnt;

}

