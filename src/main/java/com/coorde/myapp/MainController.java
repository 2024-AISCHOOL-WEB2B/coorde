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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coorde.myapp.entity.Closet;
import com.coorde.myapp.entity.User;
import com.coorde.myapp.mapper.ClosetMapper;
import com.coorde.myapp.mapper.UserMapper;

@Controller
public class MainController {

   @Autowired
   private UserMapper userMapper;
   
   @Autowired
   private ClosetMapper closetMapper;
   
   @RequestMapping("/")
   public String main(Model model) {
	   List<Closet> clothList = closetMapper.getAllCloset();
	   model.addAttribute("clothList", clothList);
      return "main";
   }
  
   @RequestMapping("/gologin")
   public String gologin() {
       return "login";
   }
   
   @PostMapping("/checkUserId")
   @ResponseBody
   public String checkUserId(@RequestParam("userId") String userId) {
       int count = userMapper.checkDuplicate("user_id", userId);
       return count > 0 ? "unavailable" : "available";
   }

    @RequestMapping("/signUp")
    public String signUp(User user, Model model) {
        int cnt = userMapper.signUp(user);
        if (cnt > 0) {
            model.addAttribute("user_id", user.getUser_id());
            return "redirect:/";
        } else {
            return "signUpFail";
        }
    }

    @RequestMapping("/userlogin")
    public String userlogin(User user, HttpSession session, Model model) {
        User loginUser = userMapper.userlogin(user);
        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            if (loginUser.getUser_cate().equals("a")) {
                System.out.println("Admin");
                System.out.println(loginUser.toString());
                return "manager";
            } else {
                System.out.println("Success");
                System.out.println(loginUser.toString());
                return "redirect:/";
            }
        } else {
            System.out.println("Fail");
            model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "login";
        }
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
    
    @RequestMapping("/goJoin")
    public String goJoin() {
       return "join";
    }
    
    @RequestMapping("/goFind")
    public String goFind() {
       return "find";
    }

    
    @RequestMapping("/logoutUser")
    public String logoutUser(HttpSession session) {
       session.invalidate();
       return "redirect:/";
    }
    
    @RequestMapping("/goEdit")
    public String goEdit() {
        return "edit";
    }
    
    @PostMapping("/updateUser")
    @ResponseBody
    public Map<String, Object> updateUser(@ModelAttribute User user, 
                                          @RequestParam("confirmPassword") String confirmPassword,
                                          HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        User loginUser = (User) session.getAttribute("loginUser");
        
        // 입력받은 비밀번호와 세션의 비밀번호 비교
        if (!loginUser.getUser_pw().equals(confirmPassword)) {
            response.put("status", "error");
            response.put("message", "비밀번호가 일치하지 않습니다.");
            return response;
        }

        // 이름에 특수문자나 숫자가 포함되어 있는지 확인
        if (!user.getUser_name().matches("^[a-zA-Z\\s]+$")) {
            response.put("status", "error");
            response.put("message", "이름에는 문자와 공백만 입력 가능합니다.");
            return response;
        }
        
        // 이메일 형식 검증
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        if (!user.getUser_email().matches(emailRegex)) {
            response.put("status", "error");
            response.put("message", "유효한 이메일 주소를 입력해주세요.");
            return response;
        }

        // 전화번호 형식 검증
        if (!user.getUser_phone().matches("\\d{3}-\\d{4}-\\d{4}")) {
            response.put("status", "error");
            response.put("message", "전화번호는 000-0000-0000 형식으로 입력해주세요.");
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
            // 업데이트된 사용자 정보를 다시 조회
            User updatedUser = userMapper.getUserById(user.getUser_id());
            session.setAttribute("loginUser", updatedUser);
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
    
   
    
    @RequestMapping("/goManagerUserList")
    public String goManagerUserList() {
        return "manager_userlist";
    }
    
    @RequestMapping("/goManagerFaq")
    public String goManagerFaq() {
        return "manager_faq";
    }
    
    @RequestMapping("/goManager")
    public String goManager() {
       return "manager";
    }

    
    @RequestMapping("/test5")
    public String managerfaq() {
       return "managerfaq";
    }
    
    @RequestMapping("/test6")
    public String manager_userlist() {
       return "manager_userlist";
    }
    
    @RequestMapping("/test7")
    public String mypage() {
       return "mypage";
    }
    
    @RequestMapping("/test8")
    public String userfaq() {
       return "userfaq";
    }


}
