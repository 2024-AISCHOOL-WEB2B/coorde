package com.coorde.myapp;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.coorde.myapp.entity.Closet;
import com.coorde.myapp.entity.User;
import com.coorde.myapp.mapper.ClosetMapper;
import com.coorde.myapp.mapper.UserMapper;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class ClosetController {
	
	@Autowired
	private ClosetMapper closetMapper;
	@Autowired
	private UserMapper userMapper;
	private Map<String, Object> review_star;
	
	
	@RequestMapping("/goCloset")
	public String goCloset(
	    @RequestParam("cl_cate") String cl_cate, Model model, HttpServletRequest request, HttpSession session) {

	    if (cl_cate == null || cl_cate.isEmpty()) {
	        return "main"; 
	    }
	    System.out.println("============");
	    System.out.println("goCloset 접근");

	    List<Closet> clothList = closetMapper.getClosetList(cl_cate);
	    List<Closet> filteredclothList = new ArrayList<>();

	    // 로그인 여부 확인
	    User loginUser = (User) session.getAttribute("loginUser");
	    boolean isLoggedIn = loginUser != null; // 로그인 여부를 확인하는 방식

	    if (isLoggedIn) {
	        System.out.println("isLoggedIn 확인");
	        // 로그인된 경우: 상위 색상과 카테고리를 포함한 필터링된 리스트 가져오기
	        List<String> topColors = closetMapper.getTopColors(loginUser);
	        List<String> topCategories = closetMapper.getTopCategories(loginUser);

	        if (topColors.size() >= 2 && topCategories.size() >= 2) {
	            Map<String, Object> filterParams = new HashMap<>();
	            filterParams.put("topColors", topColors);
	            filterParams.put("topCategories", topCategories);
	            filteredclothList = closetMapper.getFilteredClothes(filterParams);
	        }
	    } else {
	        System.out.println("isLoggedIn 안함");
	        // 로그인되지 않은 경우: 기본 리스트 가져오기
	        filteredclothList = closetMapper.getClosetList(cl_cate);
	    }

	    // 모델에 데이터 추가
	    model.addAttribute("clothList", clothList);
    	if (clothList.size() > 0) {
	        System.out.println("필터링 리스트 0 :"+clothList.get(0));
	    }
	    if (clothList.size() > 1) {
	        System.out.println("필터링 리스트 1 : "+clothList.get(1));
	    }
	    
	    model.addAttribute("filteredclothList", filteredclothList);
	    model.addAttribute("clothList", clothList);
	    System.out.println("model 추가");

	    // 전체 페이지 반환
	    return "closet"; // 전체 페이지
	}
	
	@PostMapping("/filterCloset")
	@ResponseBody
	public List<Closet> filterCloset(
	    @RequestBody Map<String, Object> params,
	    HttpSession session) {

	    System.out.println("filterCloset");
	    System.out.println("Received params: " + params);

	    List<Closet> filteredclothList = new ArrayList<>();

	    String cl_cate = (String) params.get("cl_cate");
	    System.out.println("cl_cate :" + cl_cate);

	    if (cl_cate == null || cl_cate.isEmpty()) {
	        throw new IllegalArgumentException("cl_cate parameter is missing or invalid.");
	    }

	    String color = (String) params.get("color");
	    if (color != null && !color.isEmpty()) {
	        System.out.println("color :" + color);
	    }

	    String category = (String) params.get("category");
	    if (category != null && !category.isEmpty()) {
	        System.out.println("category :" + category);
	    }

	    String sort = (String) params.get("sort");
	    if (sort != null && !sort.isEmpty()) {
	        String[] sortParts = sort.split(",");
	        System.out.println("sortField :" + sortParts[0]);
	        System.out.println("sortOrder :" + sortParts[1]);
	    }

	    filteredclothList = closetMapper.getClosetListWithFilters(params);
	    // 필터와 정렬이 적용된 리스트 가져오기
	    if (filteredclothList.size() > 0) {
	        System.out.println("필터링 리스트 0 :" + filteredclothList.get(0));
	    }
	    if (filteredclothList.size() > 1) {
	        System.out.println("필터링 리스트 1 : " + filteredclothList.get(1));
	    }

	    // 필터링된 리스트 반환
	    return filteredclothList;
	}

	@PostMapping("/closetToWish")
	@ResponseBody
	public Map<String, Object> closetToWish(@RequestParam("cl_idx") int cl_idx, @RequestParam("user_id") String user_id) {

		Map<String, Object> response = new HashMap<>();
		
		Map<String, Object> wishItem = new HashMap<>();
		wishItem.put("cl_idx", cl_idx);
		wishItem.put("user_id", user_id);
		
		int count = closetMapper.checkWish(wishItem);

		if (count == 0) {
			int cnt = closetMapper.insertToWish(wishItem);
			if (cnt > 0) {
				response.put("insert success", true);
			} else {
				response.put("insert fail", false);
			}
		} else {
			int cnt = closetMapper.deleteToWish(wishItem);
			if (cnt > 0) {
				response.put("delete success", true);
			} else {
				response.put("delete fail", false);
			}

		}

		return response;
	}
	
    @PostMapping("/deleteWishlistItems")
    public String deleteWishlistItems(@RequestParam("productIds") String productIdsString, HttpSession session, RedirectAttributes redirectAttributes) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser != null) {
            List<String> productIds = Arrays.asList(productIdsString.split(","));
            int deletedCount = closetMapper.deleteWishlistItems(productIds, loginUser.getUser_id());
            redirectAttributes.addFlashAttribute("message", deletedCount + "개의 상품이 위시리스트에서 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
        }
        return "redirect:/gomyPage";
    }
    
    @PostMapping("/updateUserMeasurements")
    @ResponseBody
    public Map<String, Object> updateUserMeasurements(@RequestBody Map<String, Object> params, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        User loginUser = (User) session.getAttribute("loginUser");
        
        if (loginUser != null) {
            try {
                String userId = loginUser.getUser_id();
                String clIdx = String.valueOf(params.get("cl_idx"));
                int reviewStar = Integer.parseInt(String.valueOf(params.get("review_star")));
                Map<String, String> sizeInfo = (Map<String, String>) params.get("sizeInfo");

                // 사용자 측정값 업데이트
                Map<String, Integer> updates = new HashMap<>();
                Map<String, Integer> changeValues = new HashMap<String, Integer>() {{
                    put("arm", 2);
                    put("sh", 2);
                    put("top", 4);
                    put("ch", 2);
                    put("waist", 1);
                    put("thighs", 2);
                    put("bot", 3);
                    put("hem", 2);
                }};
                
                for (Map.Entry<String, Integer> entry : changeValues.entrySet()) {
                    String field = entry.getKey();
                    int changeValue = entry.getValue();
                    String value = sizeInfo.get("cl_" + field);
                    System.out.println(field);
                    System.out.println(changeValue);
                    System.out.println(value);
                    if (value != null) {
                        int change = value.equals("small") ? changeValue : (value.equals("large") ? -changeValue : 0);
                        updates.put("user_" + field, change);
                    }
                }
                
                userMapper.updateUserMeasurements(userId, updates);
                
                // 별점 정보 저장
                Map<String, Object> reviewInfo = new HashMap<>();
                reviewInfo.put("cl_idx", clIdx);
                reviewInfo.put("user_id", userId);
                reviewInfo.put("review_star", reviewStar);
                
                int starCount = closetMapper.checkStar(reviewInfo);
                if (starCount == 0) {
                    closetMapper.insertStar(reviewInfo);
                } else {
                    closetMapper.updateStar(reviewInfo);
                }
                 
                response.put("success", true);
            } catch (Exception e) {
                response.put("success", false);
                e.printStackTrace();
            }
        } else {
            response.put("success", false);
        }
        
        return response;
    }

    
    @PostMapping("/editCloset")
    public String editCloset(@RequestBody List<Closet> closets, RedirectAttributes redirectAttributes) {
        if (closets != null && !closets.isEmpty()) {
            try {
                int updatedCount = closetMapper.updateCloset(closets);
                redirectAttributes.addFlashAttribute("message", updatedCount + "개의 항목이 수정되었습니다.");
            } catch (Exception e) {
                redirectAttributes.addFlashAttribute("message", "수정 중 오류가 발생했습니다: " + e.getMessage());
            }
        } else {
            redirectAttributes.addFlashAttribute("message", "수정할 항목이 없습니다.");
        }
        return "redirect:/goManagerClcart";
    }

    @PostMapping("/deleteCloset")
    public String deleteCloset(@RequestParam(value = "selectedCloset", required = false) List<String> closetIdx, RedirectAttributes redirectAttributes) {
        if (closetIdx != null && !closetIdx.isEmpty()) {
            int deletedCount = closetMapper.deleteClosetAndSize(closetIdx);
            redirectAttributes.addFlashAttribute("message", deletedCount + "개의 항목이 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("message", "삭제할 항목이 없습니다.");
        }
        return "redirect:/goManagerClcart";
    }

    
    
}
