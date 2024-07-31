package com.coorde.myapp;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coorde.myapp.entity.Closet;
import com.coorde.myapp.entity.User;
import com.coorde.myapp.mapper.ClosetMapper;
import com.coorde.myapp.mapper.UserMapper;

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

	
	@RequestMapping("/goManagerUserList")
    public String goManagerUserList(Model model) {
        List<User> userList = userMapper.getAllUsers();
        for (User user : userList) {
            System.out.println("User birth: " + user.getUser_birth());
            int age = calculateAge(user.getUser_birth());
            System.out.println("Original phone: " + user.getUser_phone());
            user.setUserAge(age);
            user.setUser_phone(maskPhoneNumber(user.getUser_phone()));
            user.setUser_addr(maskAddress(user.getUser_addr()));
            System.out.println("Masked phone: " + user.getUser_phone());
            System.out.println("Masked address: " + user.getUser_addr());
            System.out.println("Calculated age: " + age);
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
	public String deleteUsers(@RequestParam(value = "selectedUsers", required = false) List<String> userIds,
			RedirectAttributes redirectAttributes) {
		// userIds가 null이 아니고 비어 있지 않으면 실행
		if (userIds != null && !userIds.isEmpty()) {
			// userMapper를 사용하여 사용자를 삭제하고 삭제된 사용자 수를 반환
			int deletedCount = userMapper.deleteUsers(userIds);
			// 삭제된 사용자 수를 플래시 메시지로 설정
			// redirectAttributes.addFlashAttribute("message", deletedCount + "개의 항목이
			// 삭제되었습니다.");
		}
		// 사용자 목록 페이지로 리디렉션
		return "redirect:/goManagerUserList";
	}

	@RequestMapping("/goManagerFaq")
    public String goManagerFaq(Model model) {
        List<User> faqList = userMapper.goManagerFaq();
        
        Map<String, User> latestFaqMap = new LinkedHashMap<>();
        for (User faq : faqList) {
            latestFaqMap.put(faq.getUser_id(), faq);
        }
        
        List<User> latestFaqList = new ArrayList<>(latestFaqMap.values());
        
        model.addAttribute("faqList", faqList);
        model.addAttribute("latestFaqList", latestFaqList);
        
        return "manager_faq";
    }

    @RequestMapping("/goManager")
    public String goManager(HttpSession session) {
       User user = (User) session.getAttribute("loginUser");
       if(user.getUser_cate().equals("a")) {
    	   return "manager";    	   
       }  	   
       return "/";    	   
    }

	 private String maskPhoneNumber(String phoneNumber) {
	        if (phoneNumber == null || phoneNumber.length() < 11) {
	            return phoneNumber;
	        }
	        return phoneNumber.substring(0, 4) + "xxxx" + phoneNumber.substring(8);
	    }
	
	 
	 // 주소를 마스킹하는 메서드
	    private String maskAddress(String address) {
	        if (address == null || address.length() < 6) {
	            return address;
	        }
	        return address.substring(0, 5) + "xxxx";
	    }
	    

	    @PostMapping("/submitAnswer")
		@ResponseBody
	    public Map<String, Object> submitAnswer(@RequestParam("user_id") String user_id,
	                               @RequestParam("faq_title") String faq_title,
	                               @RequestParam("faq_answer") String faq_answer, 
	                               Model model) {
	        User user = new User();
	        Map<String, Object> response = new HashMap<>();
	        
	        System.out.println("test0");
	        user.setUser_id(user_id);
	        user.setFaq_title(faq_title); 
	        user.setFaq_answer(faq_answer);

	        System.out.println("test1");
	        int cnt = userMapper.submitAnswer(user);
	        if (cnt > 0) {
	            System.out.println("답변 입력 성공");
	            response.put("status", "success");
	            response.put("message", "프로필이 성공적으로 업데이트되었습니다.");
	        } else {
	            System.out.println("답변 입력 실패");
	            response.put("status", "error");
	            response.put("message", "프로필 업데이트에 실패했습니다.");
	        }

	        return response;
	    }
	
}



