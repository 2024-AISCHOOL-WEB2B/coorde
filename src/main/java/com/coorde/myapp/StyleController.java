package com.coorde.myapp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class StyleController {
	
//	@Autowired
//	private StyleMapper styleMapper;
//	
//	
//	@RequestMapping("/filterStyleCate")
//	public String filterStyleCate(@RequestParam("style_cate") String style_cate, Model model) {
//		List<Style> styleCateFilterList = styleMapper.filterStyleCate(style_cate);
//		model.addAttribute("styleCateFilterList", styleCateFilterList);
//		return "styleCateFilter";
//	}
//	
//	@RequestMapping("/filterStyleColor")
//	public String filterStyleColor(@RequestParam("style_color") String style_color, Model model) {
//		List<Style> styleColorFilterList = styleMapper.filterStyleColor(style_color);
//		model.addAttribute("styleColorFilterList", styleColorFilterList);
//		return "styleColorFilter";
//	}
//	
//	@RequestMapping("/filterStyleTag")
//	public String filterStyleTag(@RequestParam("style_tag") String style_tag, Model model) {
//		List<Style> styleTagFilterList = styleMapper.filterStyleTag(style_tag);
//		model.addAttribute("styleTagFilterList", styleTagFilterList);
//		return "styleTagFilter";
//	}
//	
//	
//	@RequestMapping("/goStyleMain")
//	public String goStyleMain(Model model) {
//		List<Style> styleList = styleMapper.styleList();
//		model.addAttribute("styleList", styleList);
//		return "styleMain";
//	}
//	
//
//	
//	@RequestMapping("/goLikeStyle")
//	public String goLikeStyle(@RequestParam("user_id") String user_id, Model model) {
//		List<Style> likeStyleList = styleMapper.likeStyleList(user_id);
//		model.addAttribute("likeStyleList", likeStyleList);
//		return "likeStyle";
//	}
//	
//	@RequestMapping("/insertStyleHeart")
//	@ResponseBody
//	public Map<String, Object> insertHeart(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id) {
//
//		Map<String, Object> response = new HashMap<>(); 
//		Style style = new Style(style_idx, user_id);
//
//		int count = styleMapper.checkStyleHeart(style);
//		
//		if(count == 0) {
//			styleMapper.insertStyleHeart(style);
//			response.put("success", true);
//		} else {
//			styleMapper.deleteStyleHeart(style);
//			response.put("success", false);
//		}
//		
//				// 여기까지는 db에 좋아요 넣고 빼는 코드
//		
//				// 밑으로는 좋아요 태그 분석(item, color, tag)
//				// top3_stItem, top3_stColor, top3_stTag
//				// 이렇게 3개 리스트(좋아요 누를 때마다 갱신)
//				List<Style> list = styleMapper.getTags(user_id);
//				
//				List<String> stItemList = new ArrayList<String>();
//				List<String> stColorList = new ArrayList<String>();
//				List<String> stTagList = new ArrayList<String>();
//				
//				for(int i = 0; i < list.size(); i++) {
//					stItemList.add(list.get(i).getStyle_item());
//					stColorList.add(list.get(i).getStyle_color());
//					stTagList.add(list.get(i).getStyle_tag());
//				} // 만약 3가지 컬럼 따로 가져와서 조합할 거라면 리스트 3개 만들고 컬럼 하나씩 가져와야 함!
//
//				Set<String> stItemDistinct = new HashSet<>(stItemList);
//				Set<String> stColorDistinct = new HashSet<>(stColorList);
//				Set<String> stTagDistinct = new HashSet<>(stTagList);
//		        
//		        Map<String, Integer> map1 = new HashMap<>(); // item
//		        Map<String, Integer> map2 = new HashMap<>(); // color
//		        Map<String, Integer> map3 = new HashMap<>(); // tag
//		        
//		        map1.remove("nan");
//		        map2.remove("nan");
//		        map3.remove("nan");
//		        
//		        for (String item: stItemDistinct) {
//		            map1.put(item, Collections.frequency(stItemList, item)); // map에 K:V 형태로 넣기
//		        }
//		        
//		        for (String color: stColorDistinct) {
//		            map2.put(color, Collections.frequency(stColorList, color)); // map에 K:V 형태로 넣기
//		        }
//		        
//		        for (String tag: stTagDistinct) {
//		            map3.put(tag, Collections.frequency(stTagList, tag)); // map에 K:V 형태로 넣기
//		        }
//		        
//		        List<Map.Entry<String, Integer>> entryList1 = new LinkedList<>(map1.entrySet());
//		        List<Map.Entry<String, Integer>> entryList2 = new LinkedList<>(map2.entrySet());
//		        List<Map.Entry<String, Integer>> entryList3 = new LinkedList<>(map3.entrySet());
//		        
//		        entryList1.sort(new Comparator<Map.Entry<String, Integer>>() {
//		            @Override
//		            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
//		        	return o2.getValue() - o1.getValue();
//		            }
//		        });
//		        
//		        entryList2.sort(new Comparator<Map.Entry<String, Integer>>() {
//		        	@Override
//		        	public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
//		        		return o2.getValue() - o1.getValue();
//		        	}
//		        });
//		        
//		        entryList3.sort(new Comparator<Map.Entry<String, Integer>>() {
//		        	@Override
//		        	public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
//		        		return o2.getValue() - o1.getValue();
//		        	}
//		        }); // 내림차순으로 정렬
//		        
//		        List<String> tagList1 = new ArrayList<String>();
//		        List<String> tagList2 = new ArrayList<String>();
//		        List<String> tagList3 = new ArrayList<String>();
//		        
//		        for(Map.Entry<String, Integer> entry : entryList1){
//		            tagList1.add(entry.getKey());
//		        }
//		        
//		        for(Map.Entry<String, Integer> entry : entryList2){
//		        	tagList2.add(entry.getKey());
//		        }
//		        
//		        for(Map.Entry<String, Integer> entry : entryList3){
//		        	tagList3.add(entry.getKey());
//		        } // 내림차순으로 entryList 안에 들어가 있는 상태에서 key 값(태그 값)만 list에 따로 담기
//		        
//
//		        String top1_stItem;
//		        String top2_stItem;
//		        String top3_stItem;
//		        
//		        String top1_stColor;
//		        String top2_stColor;
//		        String top3_stColor;
//		        
//		        String top1_stTag;
//		        String top2_stTag;
//		        String top3_stTag;
//		        
//		        if(tagList1.size() == 0) {
//		        	top1_stItem = "n";
//		        	top2_stItem = "n";
//		        	top3_stItem = "n";
//		        } else if(tagList1.size() == 1) {
//		        	top1_stItem = tagList1.get(0);
//		        	top2_stItem = "n";
//		        	top3_stItem = "n";
//		        } else if(tagList1.size() == 2) {
//		        	top1_stItem = tagList1.get(0);
//		        	top2_stItem = tagList1.get(1);
//		        	top3_stItem = "n";
//		        } else {
//		        	top1_stItem = tagList1.get(0);
//		        	top2_stItem = tagList1.get(1);
//		        	top3_stItem = tagList1.get(2);
//		        }
//		        
//		        if(tagList2.size() == 0) {
//		        	top1_stColor = "n";
//		        	top2_stColor = "n";
//		        	top3_stColor = "n";
//		        } else if(tagList2.size() == 1){
//		        	top1_stColor = tagList2.get(0);
//		        	top2_stColor = "n";
//		        	top3_stColor = "n";
//		        }else if(tagList2.size() == 2){
//		        	top1_stColor = tagList2.get(0);
//		        	top2_stColor = tagList2.get(1);
//		        	top3_stColor = "n";
//		        	
//		        }else{
//		        	top1_stColor = tagList2.get(0);
//		        	top2_stColor = tagList2.get(1);
//		        	top3_stColor = tagList2.get(2);
//		        }
//		        
//		        if(tagList3.size() == 0) {
//		        	top1_stTag = "n";
//		        	top2_stTag = "n";
//		        	top3_stTag = "n";
//		        } else if(tagList3.size() == 1){
//		        	top1_stTag = tagList3.get(0);
//		        	top2_stTag = "n";
//		        	top3_stTag = "n";
//		        }else if(tagList3.size() == 2){
//		        	top1_stTag = tagList3.get(0);
//		        	top2_stTag = tagList3.get(1);
//		        	top3_stTag = "n";
//		        	
//		        }else{
//		        	top1_stTag = tagList3.get(0);
//		        	top2_stTag = tagList3.get(1);
//		        	top3_stTag = tagList3.get(2);
//		        }   
//		        
//		        styleMapper.deleteStyleReco(user_id);
//		        Style style1 = new Style(user_id, top1_stItem, top1_stColor, top1_stTag);
//		        styleMapper.insertStyleReco(style1);
//		        Style style2 = new Style(user_id, top2_stItem, top2_stColor, top2_stTag);
//		        styleMapper.insertStyleReco(style2);
//		        Style style3 = new Style(user_id, top3_stItem, top3_stColor, top3_stTag);
//		        styleMapper.insertStyleReco(style3);
//		return response;
//	}
//	
//	@RequestMapping("/insertCloset")
//	public String insertCloset(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id) {
//		Style style = new Style(style_idx, user_id);
//		int count = styleMapper.checkCloset(style);
//		if(count == 0) {
//			styleMapper.insertCloset(style);
//		} else {
//			styleMapper.deleteCloset(style);
//		}
//		return "redirect:/goStyleMain";
//	}
//	
//	@RequestMapping("/deleteStyleHeart")
//	public String deleteHeart(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id, Model model) {
//		Style style = new Style(style_idx, user_id);
//		int count = styleMapper.checkStyleHeart(style);
//		if(count == 0) {
//			styleMapper.insertStyleHeart(style);
//		} else {
//			styleMapper.deleteStyleHeart(style);
//		}
//		List<Style> likeStyleList = styleMapper.likeStyleList(user_id);
//		model.addAttribute("likeStyleList", likeStyleList);
//		
//		return "likeStyle";
//	}
//	
//	@RequestMapping("/goMyCloset")
//	public String goMyCloset(@RequestParam("user_id") String user_id, Model model) {
//		List<Style> myClosetList = styleMapper.myClosetList(user_id);
//		model.addAttribute("myClosetList", myClosetList);
//		return "myCloset";
//	}
//	
//	@RequestMapping("/deleteCloset")
//	   public String deleteCloset(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id, Model model) {
//	      Style style = new Style(style_idx, user_id);
//	      int count = styleMapper.checkCloset(style);
//	      if(count == 0) {
//	         styleMapper.insertCloset(style);
//	      } else {
//	         styleMapper.deleteCloset(style);
//	      }
//	      List<Style> myClosetList = styleMapper.myClosetList(user_id);
//	      model.addAttribute("myClosetList", myClosetList);
//	      return "myCloset";
//	   }
//	
//	@RequestMapping("/goRecoStyle")
//	public String goRecoCody(@RequestParam("user_id") String user_id, Model model) {
//		List<Style> recoList1 = styleMapper.recoList(user_id);
//		model.addAttribute("recoList1", recoList1);	
//		return "recommendStyle";
//	}
}
