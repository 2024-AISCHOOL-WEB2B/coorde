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
public class Style {
	@NonNull private int style_idx;
	private String style_cate;
	private String style_item;
	@NonNull private String style_img_url;
	@NonNull private String style_color;
	@NonNull private String style_tag;
	@NonNull private String style_google;
	private String user_id;
	private String top_stItem;
	private String top_stColor;
	private String top_stTag;
	
	public Style(int style_idx, String user_id) {
		super();
		this.style_idx = style_idx;
		this.user_id = user_id;
	}
	
	public Style(String style_item, String style_color, String style_tag) {
		super();
		this.style_item = style_item;
		this.style_color = style_color;
		this.style_tag = style_tag;
	}
	
	public Style(String user_id, String style_item, String style_color, String style_tag) {
		super();
		this.user_id = user_id;
		this.style_item = style_item;
		this.style_color = style_color;
		this.style_tag = style_tag;
	}
	
}
