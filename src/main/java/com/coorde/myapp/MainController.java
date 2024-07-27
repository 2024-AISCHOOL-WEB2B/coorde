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
import org.springframework.web.bind.annotation.ResponseBody;

import com.coorde.myapp.entity.User;
import com.coorde.myapp.mapper.UserMapper;

@Controller
public class MainController {

   @Autowired
   private UserMapper userMapper;
   
   @RequestMapping("/")
    public String main() {
        return "bottom";
    }
   @RequestMapping("/gologin")
   public String gologin() {
       return "login";
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
            return "redirect:/login";
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
    
    @RequestMapping("/gomyPage")
    public String gomyPage() {
        return "mypage";
    }
    
    @RequestMapping("/goEdit")
    public String goEdit() {
        return "edit";
    }
    
    
    @RequestMapping("/goManagerClcart")
    public String goManagerClcart() {
        return "manager_clcart";
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

   

//   @Autowired
//   private UserMapper userMapper;
//   
//   @Autowired
//   private CodyMapper codyMapper;
//   
//   @Autowired
//   private GraphMapper graphMapper;
//   
//   @RequestMapping("/goMain")
//   public String goMain() {
//      
//      return "redirect:/";
//   }
//   
//   @PostMapping("/userSelect")
//   public String userSelect(User user, HttpSession session) {
//
//      User loginUser = userMapper.userSelect(user);
//      session.setAttribute("loginUser", loginUser);
//   
//      if(loginUser != null) {
//         return "redirect:/";
//      }else {
//         return "signInFail";
//   }
//   }
//   
//   @RequestMapping("/logoutUser")
//   public String logoutUser(HttpSession session) {
//      session.invalidate();
//      return "redirect:/";
//   }
//   
//   
//   
//   @RequestMapping("/signUp")
//   public String signUp() {
//      
//      return "signUp";
//   }
//   
//   @RequestMapping("/signIn")
//   public String signIn() {
//      
//      return "signIn";
//   }
//   
//   
//   @RequestMapping("/goUpdateUser")
//   public String goUpdateUser() {
//      
//      return "updateUser";
//   }
//   
//   
//   
//   @RequestMapping("/updateSuccess")
//   public String updateSuccess(User user, HttpSession session) {
//      System.out.println(user.toString());
//      
//      int cnt = userMapper.updateUser(user);
//
//      if (cnt > 0) {
//         user = userMapper.userSelect(user);
//         session.setAttribute("loginUser", user);
//         
//         return "updateSuccess";
//      } else {
//         System.out.println("실패");
//         return "goMain";
//      }
//   }
//
//   
//   
//   @RequestMapping("/signUpSuccess")
//   public String signUpSuccess(User user, Model model) {
//      
//      System.out.println(user.toString());
//      int cnt = userMapper.signUpSuccess(user);
//      
//      if (cnt > 0) {
//         System.out.println("데이터 입력 성공");
//         model.addAttribute("user_id", user.getUser_id());
//         return "signUpSuccess";
//         
//      } else {
//         System.out.println("회원가입 실패");
//         return "signUpFail";
//      }
//      
//   }
//   
//   @RequestMapping("/ConfirmId")
//   @ResponseBody
//   public void confirmId(String user_id, HttpServletResponse response) {
//
//      
//      boolean result = true;      
//      if(user_id.trim().isEmpty()) {
//         result = false;
//      } else {
//         if (userMapper.selectId(user_id)) {
//            result = false;
//         } else {
//            result = true;
//         }
//      }
//      
//      try {
//         PrintWriter out = response.getWriter();
//         out.print(result);
//      } catch (IOException e) {
//         e.printStackTrace();
//      }
//
//   }
//
//private static String makeQuery(String data1, String data2, String data3, String data4, String date) {
//      
//      return String.format("{\"startDate\":\"%s\"," +
//                "\"endDate\":\"%s\"," + 
//                "\"timeUnit\":\"date\"," +
//                "\"keywordGroups\":[{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +             
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}]," +
//                "\"device\":\"pc\"," +
//                "\"ages\":[\"3\",\"4\",\"5\",\"6\"]," +
//                "\"gender\":\"f\"}", date, date, data1, data1, data2, data2, data3, data3, 
//                                  data4, data4);
//   }
//   
//   private static ArrayList<Double> makeMap(String responseBody, ArrayList<Double> rateList) {
//      JSONParser parser = new JSONParser();
//        try {
//         Object obj = parser.parse(responseBody);
//         JSONObject jsonObject = (JSONObject) obj;
//         
//         JSONArray resultsArray = (JSONArray) jsonObject.get("results");
//         
//          for (int i = 0; i < resultsArray.size(); i++) {
//                  JSONObject resultObject = (JSONObject) resultsArray.get(i);
//                  String title = (String) resultObject.get("title");
//
//                   // "data" 배열에 접근
//                  JSONArray dataArray = (JSONArray) resultObject.get("data");
//                   
//                   // 각 데이터에 대한 정보 출력a
//                  if (i != 0) {
//                      // 각 데이터에 대한 정보 출력
//                      for (Object data : dataArray) {
//                          JSONObject dataObject = (JSONObject) data;
//                          Object ratio = dataObject.get("ratio");
//
//                          if (ratio instanceof Double) {
//                              // Number 타입인 경우 Double로 변환하여 리스트에 추가
//                             rateList.add(((Number) ratio).doubleValue());
//                          }
//                      }
//                  }         
//         }
//         
//      } catch (ParseException e) {
//         // TODO Auto-generated catch block
//         e.printStackTrace();
//         
//      }
//        
//        
//      return rateList;
//        
//        
//   }
//    private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
//        HttpURLConnection con = connect(apiUrl);
//
//        try {
//            con.setRequestMethod("POST");
//            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
//                con.setRequestProperty(header.getKey(), header.getValue());
//            }
//
//            con.setDoOutput(true);
//            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
//                wr.write(requestBody.getBytes());
//                wr.flush();
//            }
//
//            int responseCode = con.getResponseCode();
//            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
//                return readBody(con.getInputStream());
//            } else {  // 에러 응답
//                return readBody(con.getErrorStream());
//            }
//        } catch (IOException e) {
//            throw new RuntimeException("API 요청과 응답 실패", e);
//        } finally {
//            con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
//        }
//    }
//
//    private static HttpURLConnection connect(String apiUrl) {
//        try {
//            URL url = new URL(apiUrl);
//            return (HttpURLConnection) url.openConnection();
//        } catch (MalformedURLException e) {
//            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
//        } catch (IOException e) {
//            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
//        }
//    }
//
//    private static String readBody(InputStream body) {
//        InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);
//
//        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
//            StringBuilder responseBody = new StringBuilder();
//
//            String line;
//            while ((line = lineReader.readLine()) != null) {
//                responseBody.append(line);
//            }
//
//            return responseBody.toString();
//        } catch (IOException e) {
//            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
//        }
//    }
//   
//   

}
