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
	
	
	@RequestMapping("/goCloset")
	public String goCloset(@RequestParam("cl_cate") String cl_cate, Model model) {
		List<Closet> clothList = closetMapper.getClosetList(cl_cate);
		model.addAttribute("clothList", clothList);
		
		return "closet";
	}
	
	 
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

}
