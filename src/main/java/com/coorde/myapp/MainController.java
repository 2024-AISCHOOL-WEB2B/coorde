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

    @RequestMapping("/goJoin")
    public String goJoin() {
       return "join";
    }
    
    @RequestMapping("/goFind")
    public String goFind() {
       return "find";
    }

    @RequestMapping("/gomyPage")
    public String gomyPage(HttpSession session, Model model) {
    	
    	User loginUser = (User)session.getAttribute("loginUser");

    	if(loginUser != null) {
    		String userId = loginUser.getUser_id();
    		List<Closet> wishListItems = closetMapper.getWishListWithClosetInfo(userId);
    		model.addAttribute("wishListItems", wishListItems);
    	}else {
    		return "redirect:/login";
    	}
        
        return "mypage";
    }
    
    @RequestMapping("/goEdit")
    public String goEdit() {
        return "edit";
    }

}
