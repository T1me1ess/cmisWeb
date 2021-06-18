package com.inspur.cmis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.CMWork;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.CMWorkService;

@Controller
public class CMWorkController {
	
	@Autowired 
	private CMWorkService cmWorkService;

	/*方法可以实现：
	 * 1.查询所有的客户经理工作（以分页的的形式展示出来）
	 * 2.根据客户经理的编号或者录入的日期查询相关的信息
	 */
	@RequestMapping("/cmworkInfoList")
	public String cmworkInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数（cmId和cmDate是通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
		String cmId=request.getParameter("cmId");
		String cmDate=request.getParameter("cmDate");
		Map map=new HashMap<String,String>();
		map.put("cmId", cmId);
		map.put("cmDate", cmDate);
		
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 3);
		
		//进行数据查询（或根据id、name查询，或查询全部）
		List<CMWork> cmWorkList=cmWorkService.getCMWorkList(map);
		
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<CMWork> pageInfo=new PageInfo(cmWorkList,cmWorkList.size());
		
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("cmId", cmId);
		model.addAttribute("cmDate",cmDate);
		
		return "/manager/workMgr.jsp";
		
	}
	
	
	//添加工作管理
		@RequestMapping("/addCMWork")
		public String addCMWork(CMWork cmWork,Model model) {
			/*设置添加的的时间
			 * 1.设置日期格式
			 * 2.获取当前时间
			 * */
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			String cmDate=df.format(date);
			// new Date()为获取当前系统时间
			cmWork.setCmDate(cmDate);
			
			cmWorkService.addCMWork(cmWork);
			model.addAttribute("message", "保存成功");
			model.addAttribute("addCMWork", cmWork);
			model.addAttribute("flag", "1");
			
			return "/manager/workMgrAdd.jsp";
		}
		
    //修改工作记录
		 @RequestMapping("/updateCMWork")
		    public String updateCMWork(Model model,CMWork cmWork) {
			 System.out.println("==================================进入方法===========================");	    	
		    	//展示选择用户的原信息
	    	   Map map=new HashMap();
		    	map.put("key", cmWork.getKey());
		    	List<CMWork> old_works=cmWorkService.getCMWorkList(map);
		    	CMWork old_work=old_works.get(0);
		    	model.addAttribute("updateWork", old_work);
		    	System.out.print("key====================================================="+cmWork.getKey()+"===================================");
		    	
		    	if(cmWork.getCmWorkProposal()!=null) {
		    	//对选择的工作记录进行修改
		    	cmWorkService.updateCMWork(cmWork);
		    	model.addAttribute("message", "修改成功");
		    	model.addAttribute("flag", "1");
		    	List<CMWork> new_works=cmWorkService.getCMWorkList(map);
		    	CMWork new_work=new_works.get(0);
		    	model.addAttribute("updateWork", new_work);
		    	
		    }
		    	
				return "/manager/workMgrUpdate.jsp";
				
		    }
		 
		 //删除工作记录
		    @RequestMapping("/deleteCMWork")
		    public String deleteCMWork(String keys) {
		        String[] key=keys.split(",");
		        int key2[]=new int[key.length];
		        for(int i=0;i<key.length;i++) {
		        	key2[i]=Integer.parseInt(key[i]);
		        }
	           cmWorkService.deleteCMWork(key2);
	        	return "redirect:cmworkInfoList";
	           
		    }


		
}
