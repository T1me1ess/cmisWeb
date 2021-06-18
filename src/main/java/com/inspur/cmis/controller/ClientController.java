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
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.ClientExt;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.ClientMgrService;
import com.inspur.cmis.service.ClientService;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService clientService;
	@Autowired
	private ClientMgrService clientMgrService;
	
	
	
	@RequestMapping("/clientInfoList")
	public String clientInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数（通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
		String cmId=request.getParameter("cmId");
		String cName=request.getParameter("cName");
		String cSsn=request.getParameter("cSsn");
		Map map=new HashMap<String,String>();
		map.put("cmId", cmId);
		map.put("cName", cName);
		map.put("cSsn", cSsn);
		
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 3);
		
		//进行数据查询（或根据id、name查询，或查询全部）
		List<ClientExt> clientList=clientService.getClientList(map);
		
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<ClientExt> pageInfo=new PageInfo(clientList,clientList.size());
		
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);
		//model.addAttribute("userList",userList);
		model.addAttribute("cmId", cmId);
		model.addAttribute("cName",cName);
		model.addAttribute("cSsn", cSsn);
		
		return "/manager/clientInfo.jsp";
		
	}
	
	//添加客户信息
	@RequestMapping("/addClient")
	public String addClient(Client client,Model model) {
        clientService.addClient(client);
		model.addAttribute("message", "保存成功");
		model.addAttribute("addClient", client);
		
		return "/manager/clientInfoAdd.jsp";
	}
	
	//修改客户信息
	@RequestMapping("/updateClient")
    public String updateClient(Model model,Client client) {
    	
    	//展示选择客户的原信息
    	Map map=new HashMap();
    	map.put("ckey", client.getCkey());
    	List<ClientExt> old_clients=clientService.getClientList(map);
    	Client old_client=old_clients.get(0);
    	model.addAttribute("Client", old_client);
    	System.out.print("ckey====================================================="+old_client.getCkey()+"===================================");
    	if(client.getcName()!=null) {
    	//对提交的用户进行信息的修改
    	clientService.updateClient(client);
    	model.addAttribute("message", "修改成功");
    	List<ClientExt> new_clients=clientService.getClientList(map);
    	ClientExt new_client=new_clients.get(0);
    	model.addAttribute("Client", new_client);
    	
    	}
    	
		return "/manager/clientInfoUpdate.jsp";
		
    }
	//删除客户信息
	@RequestMapping("/deleteClient")
	public String deleteClient(String ckeys,Model model) {
		String[] ckey=ckeys.split(",");
		int[] keys=new int[ckey.length];
		for(int i=0;i<ckey.length;i++) {
			keys[i]=Integer.parseInt(ckey[i]);
		}
		clientService.deleteClient(keys);
		return "redirect:clientInfoList";
	}

}
