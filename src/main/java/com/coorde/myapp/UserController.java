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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
public class UserController {
	
	@Autowired
	private ClosetMapper closetMapper;
	
	@Autowired
	private UserMapper userMapper;

	
	 @RequestMapping(value = "/signUp", method = RequestMethod.POST)
	   public @ResponseBody String signUp(@RequestBody User user) {
	      
	      System.out.println("Received User data: " + user);
	      
	       int cnt = userMapper.signUp(user);
	       if (cnt > 0) {
	           return "signUpResponse";
	       } else {
	           return "signUpFail";
	       }
	   }
    
    @RequestMapping("/userlogin")
    public String userlogin(User user, HttpSession session) {
        User loginUser = userMapper.userlogin(user);
        session.setAttribute("loginUser", loginUser);
        if (loginUser != null) {
           if (loginUser.getUser_cate().equals("a")) {
              System.out.println("Admin");
              System.out.println(loginUser.toString());
              return "manager";
           }else {
              System.out.println("Success");
              System.out.println(loginUser.toString());
              return "redirect:/";
           }
        } else {
           System.out.println("Fail");
            return "login";
        }
    }
    
    @RequestMapping("/logoutUser")
    public String logoutUser(HttpSession session) {
       session.invalidate();
       return "redirect:/";
    }
    
    @PostMapping("/checkUserId")
    @ResponseBody
    public String checkUserId(@RequestParam("userId") String userId) {
        int count = userMapper.checkDuplicate("user_id", userId);
        return count > 0 ? "unavailable" : "available";
    }
    
    @PostMapping("/checkPhone")
    @ResponseBody
    public Map<String, String> checkPhone(@RequestParam("userPhone") String userPhone, HttpSession session) {
        Map<String, String> response = new HashMap<>();
        User loginUser = (User) session.getAttribute("loginUser");
        
        // userPhone은 이미 하이픈이 제거된 상태입니다
        if (!userPhone.equals(loginUser.getUser_phone())) {
            int count = userMapper.checkDuplicate("user_phone", userPhone);
            if (count > 0) {
                response.put("status", "unavailable");
            } else {
                response.put("status", "available");
            }
        } else {
            response.put("status", "available");
        }
        return response;
    }
    
    
    @RequestMapping(value = "/idFind", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> idFind(@ModelAttribute User user) {
        String findId = userMapper.idFind(user);
        Map<String, String> response = new HashMap<>();
        response.put("findId", findId);
        return response;
    }
    
    @RequestMapping(value = "/pwFind", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> pwFind(@ModelAttribute User user) {
        String findPw = userMapper.pwFind(user);
        Map<String, String> response = new HashMap<>();
        response.put("findPw", findPw);
        return response;
    }
    
    @GetMapping("/getCurrentUser")
    @ResponseBody
    public User getCurrentUser(HttpSession session) {
        return (User) session.getAttribute("loginUser");
    }
    
    @PostMapping("/updateUser")
    @ResponseBody
    public synchronized Map<String, Object> updateUser(@ModelAttribute User user, 
                                          @RequestParam("confirmPassword") String confirmPassword,
                                          HttpSession session) {
        
    	Map<String, Object> response = new HashMap<>();
        User loginUser = (User) session.getAttribute("loginUser");
        
        System.out.println("Received user data: " + user);  // 받은 데이터 로깅
        System.out.println("Confirm password: " + confirmPassword);  // 비밀번호 로깅
        
        // 입력받은 비밀번호와 세션의 비밀번호 비교
        if (!loginUser.getUser_pw().equals(confirmPassword)) {
            response.put("status", "error");
            response.put("message", "비밀번호가 일치하지 않습니다.");
            return response;
        }

        // 이름 유효성 검사
        if (!user.getUser_name().matches("^[a-zA-Z\\s]+$|^[가-힣]+$")) {
            response.put("status", "error");
            response.put("message", "이름은 영어(공백 포함) 또는 한글(공백 미포함)로만 입력 가능합니다.");
            return response;
        }
        
        // 이메일 형식 검증
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        if (!user.getUser_email().matches(emailRegex)) {
            response.put("status", "error");
            response.put("message", "유효한 이메일 주소를 입력해주세요.");
            return response;
        }

        // 전화번호 유효성 검사
        if (!user.getUser_phone().matches("^010\\d{8}$")) {
            response.put("status", "error");
            response.put("message", "올바른 전화번호 형식이 아닙니다.");
            return response;
        }
        
        // 전화번호 중복 검사
        if (!user.getUser_phone().equals(loginUser.getUser_phone())) {
            int count = userMapper.checkDuplicate("user_phone", user.getUser_phone());
            if (count > 0) {
                response.put("status", "error");
                response.put("message", "이미 사용 중인 전화번호입니다.");
                return response;
            }
        }

        // 키와 몸무게 유효성 검사
        if (user.getUser_hei() < 1 || user.getUser_hei() > 300) {
            response.put("status", "error");
            response.put("message", "키는 1cm 이상 300cm 이하의 정수여야 합니다.");
            return response;
        }
        if (user.getUser_wei() < 1 || user.getUser_wei() > 500) {
            response.put("status", "error");
            response.put("message", "몸무게는 1kg 이상 500kg 이하의 정수여야 합니다.");
            return response;
        }

        user.setUser_id(loginUser.getUser_id());

        int result = userMapper.updateUser(user);
        if (result > 0) {
            User updatedUser = userMapper.findUserById(user.getUser_id());  // 업데이트된 사용자 정보를 다시 조회
            session.setAttribute("loginUser", updatedUser);  // 새로 조회한 정보로 세션 업데이트
            response.put("status", "success");
            response.put("message", "프로필이 성공적으로 업데이트되었습니다.");
        } else {
            response.put("status", "error");
            response.put("message", "프로필 업데이트에 실패했습니다.");
        }
        return response;
    }
    
    // 회원 정보 수정에서 탈퇴
    @PostMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam String password, HttpSession session) {
        // 세션에서 로그인한 사용자 정보 가져오기
        User loginUser = (User) session.getAttribute("loginUser");
        System.out.println("Session User ID: " + (loginUser != null ? loginUser.getUser_id() : "null"));
        System.out.println("Password: " + password);

        if (loginUser != null) {
            String userId = loginUser.getUser_id();
            System.out.println("Deleting user with ID: " + userId + " and password: " + password);

            // 사용자 삭제
            int result = userMapper.deleteUser(userId, password);
            if (result > 0) {
                session.invalidate(); // 세션 무효화
                return "success";
            } else {
                return "fail";
            }
        }
        return "fail";
    }

    @RequestMapping("/goFaq")
    public String goFaq(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loginUser");
        
        List<User> userfaqList = userMapper.goUserFaq(user);

        model.addAttribute("userfaqList", userfaqList);
        
        return "userfaq";
    }
    
    @PostMapping("/submitFaq")
    @ResponseBody
    public Map<String, Object> submitFaq(HttpSession session,
    		@RequestParam("faq_cate") String faq_cate,
            @RequestParam("faq_detail") String faq_detail,
            @RequestParam("faq_title") String faq_title) {

        
    	User user = (User) session.getAttribute("loginUser");
    	System.out.println(user.toString());
    	Map<String, Object> response = new HashMap<>();

        user.setFaq_cate(faq_cate);
        user.setFaq_title(faq_title);
        user.setFaq_detail(faq_detail);

        System.out.println("test1");
        int cnt = userMapper.submitFaq(user);
        if (cnt > 0) {
            System.out.println("질문 입력 성공");
            response.put("status", "success");
            response.put("message", "프로필이 성공적으로 업데이트되었습니다.");
        } else {
            System.out.println("질문 입력 실패");
            response.put("status", "error");
            response.put("message", "프로필 업데이트에 실패했습니다.");
        }

        return response;

    }
	


}
