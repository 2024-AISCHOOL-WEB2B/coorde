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
	
	@NonNull private int cl_idx;
	@NonNull private String cl_name;
	@NonNull private String cl_cate;
	@NonNull private String cl_cate_detail;
	@NonNull private String cl_color;
	@NonNull private String cl_imgurl;
	@NonNull private String cl_url;
	@NonNull private int cl_price;
	@NonNull private int cl_dc_price;
	@NonNull private int cl_cnt;

	private String cl_size;
	private int cl_arm;
	private int cl_sh;
	private int cl_top;
	private int cl_ch;
	private int cl_waist;
	private int cl_thighs;
	private int cl_bot;
	private int cl_hem;
	
	private int review_star;
}


