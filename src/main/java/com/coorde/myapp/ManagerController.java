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
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class ManagerController {
	
	@Autowired
	private ClosetMapper closetMapper;
	@Autowired
	private UserMapper userMapper;
	 
	@RequestMapping("/goManagerClcart")
	public String goManagerClcart(Model model) {
		List<Closet> clothList = closetMapper.getAllCloset();
		model.addAttribute("closetList", clothList);
	    return "manager_clcart";
	}
	
	
	@PostMapping("/deleteCloset")
	public String deleteCloset(@RequestParam(value="selectedCloset", required=false) List<String> closetIdx, RedirectAttributes redirectAttributes) {
	    if (closetIdx != null && !closetIdx.isEmpty()) {
	        int deletedCount = closetMapper.deleteClosetAndSize(closetIdx);
	        redirectAttributes.addFlashAttribute("message", deletedCount + "개의 항목이 삭제되었습니다.");
	    } 
	    return "redirect:/goManagerClcart";
	}
    
	@RequestMapping("/goManagerUserList")
    public String goManagerUserList(Model model) {
        List<User> userList = userMapper.getAllUsers();
        for (User user : userList) {
            System.out.println("User birth: " + user.getUser_birth());
            int age = calculateAge(user.getUser_birth());
            System.out.println("Calculated age: " + age);
            user.setUserAge(age);
        }
        model.addAttribute("userList", userList);
        return "manager_userlist";
    }
    // 생년월일을 나이로 변환하는 메서드
    private int calculateAge(String birthDateString) {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            LocalDate birthDate = LocalDate.parse(birthDateString, formatter);
            LocalDate currentDate = LocalDate.now();
            return Period.between(birthDate, currentDate).getYears();
        } catch (Exception e) {
            System.out.println("Error calculating age for birth date: " + birthDateString);
            e.printStackTrace();
            return 0; // 오류 발생 시 기본값 반환
        }
    }
    @GetMapping("/userList") // 이 메서드는 '/userList' 경로로 GET 요청이 들어오면 호출됩니다.
    public String getUserList(Model model) {
        List<User> users = userMapper.getAllUsers(); // 데이터베이스에서 사용자 목록을 가져옵니다.
        for (User user : users) { // 각 사용자에 대해
            int age = calculateAge(user.getUser_birth()); // 생년월일을 나이로 변환하고
            user.setUserAge(age); // 사용자 객체에 나이를 설정합니다.
        }
        model.addAttribute("users", users); // 사용자 목록을 모델에 추가하여 뷰에 전달합니다.
        return "manager_userlist"; // 'manager_userlist' 뷰를 반환합니다.
    }
    
    // 매니저 유저리스트에서 삭제
    @PostMapping("/deleteUsers")
    public String deleteUsers(@RequestParam(value="selectedUsers", required=false) List<String> userIds, RedirectAttributes redirectAttributes) {
        // userIds가 null이 아니고 비어 있지 않으면 실행
        if (userIds != null && !userIds.isEmpty()) {
            // userMapper를 사용하여 사용자를 삭제하고 삭제된 사용자 수를 반환
            int deletedCount = userMapper.deleteUsers(userIds);
            // 삭제된 사용자 수를 플래시 메시지로 설정
            // redirectAttributes.addFlashAttribute("message", deletedCount + "개의 항목이 삭제되었습니다.");
        } 
        // 사용자 목록 페이지로 리디렉션
        return "redirect:/goManagerUserList";
    }
    
    @RequestMapping("/goManagerFaq")
    public String goManagerFaq() {
        return "manager_faq";
    }
    
    @RequestMapping("/goManager")
    public String goManager() {
       return "manager";
    }

}
