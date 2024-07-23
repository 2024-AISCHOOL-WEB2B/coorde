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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main(String collected_at, Model model) throws IOException {

		

		return "managerfaq";
	}

//	@Autowired
//	private UserMapper userMapper;
//	
//	@Autowired
//	private CodyMapper codyMapper;
//	
//	@Autowired
//	private GraphMapper graphMapper;
//	
//	
//	@RequestMapping("/")   
//	   public String main(String collected_at, Model model) throws IOException {
//	      
//	      List<Cody> bestCody = codyMapper.bestCody();
//	      model.addAttribute("bestCody", bestCody);
//
//	      LocalDate now = LocalDate.now();
//	      String now_string = now.toString();
//
//	      String date = "2024-01-23";
//
//	      Keyword keywordList = graphMapper.keywordListing("2024-01-23");
//
//	        String clientId = "EUOsprwxSj6kFEPTAUbW"; // 애플리케이션 클라이언트 아이디
//	        String clientSecret = "rR3tjTJTAg"; // 애플리케이션 클라이언트 시크릿
//
//
//	        String apiUrl = "https://openapi.naver.com/v1/datalab/search";
//
//	        Map<String, String> requestHeaders = new HashMap<>();
//	        requestHeaders.put("X-Naver-Client-Id", clientId);
//	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
//	        requestHeaders.put("Content-Type", "application/json");
//
//	        ArrayList<Double> rateList = new ArrayList<Double>();
//	        rateList.add(100.0);
//	              
//	        String requestBody = makeQuery(keywordList.getTop1(), keywordList.getTop2(), keywordList.getTop3(), keywordList.getTop4(), date);
//	        String responseBody1 = post(apiUrl, requestHeaders, requestBody);
//	       
//	        rateList = makeMap(responseBody1, rateList);
//	        
//	        requestBody = makeQuery(keywordList.getTop1(), keywordList.getTop5(), keywordList.getTop6(), keywordList.getTop7(), date);
//	        String responseBody2 = post(apiUrl, requestHeaders, requestBody);
//	        
//	        rateList = makeMap(responseBody2, rateList);
//	        
//	        requestBody = makeQuery(keywordList.getTop1(), keywordList.getTop8(), keywordList.getTop9(), keywordList.getTop10(), date);
//	        String responseBody3 = post(apiUrl, requestHeaders, requestBody);
//	        
//	        rateList = makeMap(responseBody3, rateList);
//   
//	        Collections.sort(rateList, Collections.reverseOrder());
//	        keywordList.setTop1_rate(rateList.get(0));
//	        keywordList.setTop2_rate(rateList.get(1));
//	        keywordList.setTop3_rate(rateList.get(2));
//	        keywordList.setTop4_rate(rateList.get(3));
//	        keywordList.setTop5_rate(rateList.get(4));
//	        keywordList.setTop6_rate(rateList.get(5));
//	        keywordList.setTop7_rate(rateList.get(6));
//	        keywordList.setTop8_rate(rateList.get(7));
//	        keywordList.setTop9_rate(rateList.get(8));
//	        keywordList.setTop10_rate(rateList.get(9));
//	 
//	        model.addAttribute("keywordList", keywordList);
//
//	        //여기부터 기상청 데이터
//	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");         // 포맷 적용        String formatedNow = now.format(formatter);
//	        String formatedNow = now.format(formatter);
//
//	        URL url = new URL("https://apihub.kma.go.kr/api/typ01/url/kma_sfcdd.php?tm=" + formatedNow + "&stn=156&help=0&dataType=JSON&authKey=rfjJrTMzQpK4ya0zM6KSpw");
//	        // HttpURLConnection 객체를 만들어 API를 호출
//	        HttpURLConnection con = (HttpURLConnection) url.openConnection(); 
//	        // 요청 방식을 GET으로 설정
//	        con.setRequestMethod("GET");
//	        // 요청 헤더를 설정 Content-Type을 application/json으로 설정
//	        con.setRequestProperty("Content-Type", "application/json");
//	        
//	        // API의 응답을 읽기 위한 BufferedReader 생성
//	        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "euc-kr"));
//	        String inputLine;
//	        StringBuffer response = new StringBuffer();
//	        
//	        // 응답을 StringBuffer에 추가
//	        while ((inputLine = in.readLine()) != null) {
//	           if(inputLine.contains("#")) {
//	              
//	           }
//	           else {
//	              response.append(inputLine+"\n");
//	           }
//	           
//	            
//	        }
//	        in.close();
//
//	        String newInput = response.toString();
//	        
//	        String[] weatherList = newInput.split(",");
//	        
//	        ArrayList<String> weatherFinal = new ArrayList<String>();
//	        weatherFinal.add(weatherList[11]);
//	        weatherFinal.add(weatherList[13]);
//	        model.addAttribute("weather", weatherFinal);
//
//        List<Keyword> article_list = graphMapper.article_list();
//        model.addAttribute("article_list", article_list);
//
//        Date date2 = new Date();
//    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM");
//    	String month = simpleDateFormat.format(date2);
//    	String season;
//        
//    	
//    	Float sum = Float.parseFloat(weatherFinal.get(0)) + Float.parseFloat(weatherFinal.get(1));
//    	Float mean = sum/2;
//    	
//    	if(mean > 20) {
//            season = "여름";
//         }else if(mean > 5) {
//            if (month.equals("12") || month.equals("01") || month.equals("02") || month.equals("03") || month.equals("04")
//                  || month.equals("05")) {
//               season = "봄";
//            } else {
//               season = "가을";
//            } ;
//         }else {
//            season = "겨울";
//         }
//    	
//    	List<Cody> randomCody = codyMapper.randomCody(season);
//		model.addAttribute("randomCody", randomCody);
//    	
//		return "Main";
//	}
//	
//	@RequestMapping("/goMain")
//	public String goMain() {
//		
//		return "redirect:/";
//	}
//	
//	@PostMapping("/userSelect")
//	public String userSelect(User user, HttpSession session) {
//
//		User loginUser = userMapper.userSelect(user);
//		session.setAttribute("loginUser", loginUser);
//	
//		if(loginUser != null) {
//			return "redirect:/";
//		}else {
//			return "signInFail";
//	}
//	}
//	
//	@RequestMapping("/logoutUser")
//	public String logoutUser(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}
//	
//	
//	
//	@RequestMapping("/signUp")
//	public String signUp() {
//		
//		return "signUp";
//	}
//	
//	@RequestMapping("/signIn")
//	public String signIn() {
//		
//		return "signIn";
//	}
//	
//	
//	@RequestMapping("/goUpdateUser")
//	public String goUpdateUser() {
//		
//		return "updateUser";
//	}
//	
//	
//	
//	@RequestMapping("/updateSuccess")
//	public String updateSuccess(User user, HttpSession session) {
//		System.out.println(user.toString());
//		
//		int cnt = userMapper.updateUser(user);
//
//		if (cnt > 0) {
//			user = userMapper.userSelect(user);
//			session.setAttribute("loginUser", user);
//			
//			return "updateSuccess";
//		} else {
//			System.out.println("실패");
//			return "goMain";
//		}
//	}
//
//	
//	
//	@RequestMapping("/signUpSuccess")
//	public String signUpSuccess(User user, Model model) {
//		
//		System.out.println(user.toString());
//		int cnt = userMapper.signUpSuccess(user);
//		
//		if (cnt > 0) {
//			System.out.println("데이터 입력 성공");
//			model.addAttribute("user_id", user.getUser_id());
//			return "signUpSuccess";
//			
//		} else {
//			System.out.println("회원가입 실패");
//			return "signUpFail";
//		}
//		
//	}
//	
//	@RequestMapping("/ConfirmId")
//	@ResponseBody
//	public void confirmId(String user_id, HttpServletResponse response) {
//
//		
//		boolean result = true;		
//		if(user_id.trim().isEmpty()) {
//			result = false;
//		} else {
//			if (userMapper.selectId(user_id)) {
//				result = false;
//			} else {
//				result = true;
//			}
//		}
//		
//		try {
//			PrintWriter out = response.getWriter();
//			out.print(result);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}
//
//private static String makeQuery(String data1, String data2, String data3, String data4, String date) {
//		
//		return String.format("{\"startDate\":\"%s\"," +
//                "\"endDate\":\"%s\"," + 
//                "\"timeUnit\":\"date\"," +
//                "\"keywordGroups\":[{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +             
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}]," +
//                "\"device\":\"pc\"," +
//                "\"ages\":[\"3\",\"4\",\"5\",\"6\"]," +
//                "\"gender\":\"f\"}", date, date, data1, data1, data2, data2, data3, data3, 
//                						data4, data4);
//	}
//	
//	private static ArrayList<Double> makeMap(String responseBody, ArrayList<Double> rateList) {
//		JSONParser parser = new JSONParser();
//        try {
//			Object obj = parser.parse(responseBody);
//			JSONObject jsonObject = (JSONObject) obj;
//			
//			JSONArray resultsArray = (JSONArray) jsonObject.get("results");
//			
//			 for (int i = 0; i < resultsArray.size(); i++) {
//		            JSONObject resultObject = (JSONObject) resultsArray.get(i);
//		            String title = (String) resultObject.get("title");
//
//	                // "data" 배열에 접근
//		            JSONArray dataArray = (JSONArray) resultObject.get("data");
//	                
//	                // 각 데이터에 대한 정보 출력a
//		            if (i != 0) {
//		                // 각 데이터에 대한 정보 출력
//		                for (Object data : dataArray) {
//		                    JSONObject dataObject = (JSONObject) data;
//		                    Object ratio = dataObject.get("ratio");
//
//		                    if (ratio instanceof Double) {
//		                        // Number 타입인 경우 Double로 변환하여 리스트에 추가
//		                    	rateList.add(((Number) ratio).doubleValue());
//		                    }
//		                }
//		            }         
//			}
//			
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			
//		}
//        
//        
//		return rateList;
//        
//        
//	}
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
