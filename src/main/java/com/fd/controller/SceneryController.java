package com.fd.controller;


import java.io.IOException;
import java.sql.Date;
import java.util.*;
import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fd.util.MyUtil;
import com.fd.model.Scenery;
import com.fd.model.User;
import com.fd.service.SceneryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SceneryController {
	@Resource
	private SceneryService sceneryService;

	//后台景点列表
	@RequestMapping("/admin/sceneryList")
	public String sceneryList(HttpSession session){
		List<Scenery> allSceneries = sceneryService.allSceneries();
		session.setAttribute("allSceneries", allSceneries);
		return "/admin/scenerylist";
	}

	//返回所有状态不为3的风景
	@RequestMapping("/admin/sceneryChecking")
	@ResponseBody
	public String sceneryChecking() throws JsonProcessingException {
		List<Scenery> sceneryList = sceneryService.selectChecking();
		ObjectMapper objectMapper = new ObjectMapper();
		if(sceneryList.size()>0){
			return objectMapper.writeValueAsString(sceneryList);
		}
		return "null";
	}

	//前台景点展示
	@RequestMapping("/showSceneryList")
	public String showSceneryList(Model model){
		List<Scenery> sList = sceneryService.allSceneries();
		for (Scenery scenery : sList) {
			System.out.println(scenery);
		}
		model.addAttribute("sList", sList);
		return "/template/beautiful";
	}

	//前台index界面随机展示7个景点
	@RequestMapping("/indexShowSceneryList")
	public String indexShowSceneryList(HttpSession session){
		List<Scenery> sceneryList = sceneryService.allSceneries();
		List<Scenery> sceneries = new ArrayList<>();
		int[] a = new int[7];
		Random random = new Random();
		for(int i=0;i<7;i++){
			boolean b = true;
			int num = random.nextInt(sceneryList.size());
			for(int j=0;j<7;j++){
				if(a[j] == num){
					b = false;
					i--;
					break;
				}
			}
			if(b){
				a[i] = num;
				sceneries.add(sceneryList.get(num));
			}
		}
		session.setAttribute("sceneries",sceneries);
		return "redirect:/allHistory";
	}

	//增加风景
	@RequestMapping(value = "/admin/addScenery",method= RequestMethod.POST)
	public String addScenery(@Valid Scenery scenery, HttpSession session, HttpServletRequest request, BindingResult result) throws IOException {
		//验证不通过
		if (result.hasErrors()){
			return "admin/addscenery";
		}

		MultipartFile file = scenery.getMultipartFile();
		String img = MyUtil.upload(request,file);
		if (img != null){
			scenery.setImage(img);
		}

		Date adddate = new Date(System.currentTimeMillis());
		User user = (User) session.getAttribute("user");
		if(user.getStatus() == 3){
			scenery.setState(3);
		}
		if (user.getStatus() == 2){
			scenery.setState(0);
		}
		scenery.setAddDate(adddate);
		scenery.setAuthorId(user.getUserId());
		System.out.println(scenery);
		sceneryService.addScenery(scenery);
		return "redirect:/admin/sceneryList";
	}

	//前台按id查询风景
	@RequestMapping("selectSceneryById")
	public String selectSceneryById(Model model,@RequestParam("id") String id){
		Scenery scenery = sceneryService.selectSceneryById(Integer.parseInt(id));
		System.out.println(scenery);
		if (scenery !=null){
			model.addAttribute("scenery",scenery);
			return "/template/detail";
		}
		return "index";
	}

	//删除风景
	@RequestMapping(value = "/admin/deleteScenery")
	@ResponseBody
	public String deleteScenery(@RequestParam("name") String name,HttpSession session,HttpServletRequest request){
		User user = (User) session.getAttribute("user");
		String msg = "false";
		if(user.getStatus() == 3){
			//删除之前获取该景点信息，用户删除图片
			Scenery scenery = sceneryService.selectSceneryByName(name);
			MyUtil.deleteFile(request,scenery.getImage());
			//删除景点
			sceneryService.deleteScenery(name);
			//修改session中保存的景点
			List<Scenery> allSceneries = sceneryService.allSceneries();
			session.setAttribute("allSceneries",allSceneries);
			msg = "true";
		}
		return msg;
	}

	//跳转到风景信息修改界面
	@RequestMapping("/admin/toUpdateScenery")
	public String toUpdateScenery(@RequestParam("id") String id,Model model){
		Scenery scenery = sceneryService.selectSceneryById(Integer.parseInt(id));
		model.addAttribute("scenery",scenery);
		return "/admin/updatescenery";
	}

	//修改风景信息
	@RequestMapping("/admin/updateScenery")
	public String updateScenery(Scenery scenery,HttpServletRequest request) throws IOException {
		MultipartFile file = scenery.getMultipartFile();
		//修改景点信息后，如果改变图片则删除原图片
		Scenery oldScenery = sceneryService.selectSceneryById(scenery.getId());
		if(!file.isEmpty()){
			//删除旧图换新图
			MyUtil.deleteFile(request,oldScenery.getImage());
			String img = MyUtil.upload(request,file);
			if (img != null){
				scenery.setImage(img);
			}
		}
		else {
			//保留旧图
			scenery.setImage(oldScenery.getImage());
		}
		//修改
		if(oldScenery.getState() == 3){
			scenery.setState(3);
		}
		//审核不通过后提交修改
		if(oldScenery.getState() == 2){
			scenery.setState(0);
		}
		System.out.println(scenery);
		sceneryService.updateScenery(scenery);
		return "redirect:/admin/sceneryList";
	}

	//跳转到风景信息审核界面
	@RequestMapping("/admin/toCheckScenery")
	public String toCheckScenery(@RequestParam("id") String id,Model model){
		Scenery scenery = sceneryService.selectSceneryById(Integer.parseInt(id));
		model.addAttribute("scenery",scenery);
		return "/admin/checkscenery";
	}

	//超级管理员审核
	@RequestMapping(value = "/admin/checkScenery",method = RequestMethod.POST)
	@ResponseBody
	public String checkScenery(@RequestParam("state") String state, @RequestParam("id") String id,@RequestParam("checkMsg") String checkMsg){
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		map.put("state",state);
		map.put("checkMsg",checkMsg);
		System.out.println(map);
		if(sceneryService.upSceneryState(map) > 0 ){
			return "true";
		}
		return "false";
	}

	//按风景名称查找风景
	@RequestMapping("/admin/selectSceneryByName")
	@ResponseBody
	public String selectSceneryByName(@RequestParam("name") String name) throws JsonProcessingException {
		Scenery scenery = sceneryService.selectSceneryByName(name);
		ObjectMapper objectMapper = new ObjectMapper();
		if(scenery!=null){
			String json = objectMapper.writeValueAsString(scenery);
			System.out.println(json);
			return json;
		}else {
			return "false";
		}
	}

	//分页
	@RequestMapping("/admin/fenYe2")
	public String fenYe(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "5") int pageSize,Model model){
		//根据前端选择的当前页和页大小
		PageHelper.startPage(pageNum, pageSize);
		//获取所有的景点数据
		List<Scenery> sceneries = sceneryService.allSceneries();
		//将景点按前前面放入的参数截取
		PageInfo<Scenery> pageInfo = new PageInfo<Scenery>(sceneries);
		//将分好页的数据传回给前端
		List<Scenery> allSceneries = pageInfo.getList();
		model.addAttribute("allSceneries",allSceneries);
		//将分页信息传回给前端
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/scenerylist";
	}
}
