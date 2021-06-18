package com.inspur.cmis.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.RegularMeet;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.RegularMeetService;

@Controller
public class RegularMeetController {
	
	
	@Autowired
	private RegularMeetService regularMeetService;
	
	/*方法可以实现：
	 * 1.查询客户经理所有的的会议信息（以分页的的形式展示出来）
	 * 2.根据客户经理的Id或者日期或主题查询信息
	 */
	@RequestMapping("/regularMeetInfoList")
	public String regularMeetInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数（cmid、meetDate和theme是通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
		String cmId=request.getParameter("cmId");
		String meetDate=request.getParameter("meetDate");
		String theme=request.getParameter("theme");
		
		Map map=new HashMap<String,String>();
		map.put("cmId", cmId);
		map.put("meetDate", meetDate);
		map.put("theme", theme);
		
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 3);
		
		//进行数据查询（或根据id、name查询，或查询全部）
		List<RegularMeet> meet_List=regularMeetService.getRegularMeetList(map);
		
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<User> pageInfo=new PageInfo(meet_List,meet_List.size());
		
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("cmId", cmId);
		model.addAttribute("meetDate",meetDate);
		
		return "/manager/regularMeeting.jsp";
		
	}
	
	
	
	//添加会议记录
		@RequestMapping(value="/addRegularMeet")
		public String addRegularMeet(RegularMeet regularMeet,Model model,MultipartFile upload, HttpServletRequest req) throws UnsupportedEncodingException {
			System.out.print("======================进入方法============================");
			req.setCharacterEncoding("UTF-8");
			String fileName = "";
			try {// 原始⽂件名称
				if (upload != null) {
					fileName = upload.getOriginalFilename();
					// 上传图⽚物理路径
					String url = req.getSession().getServletContext()
							.getRealPath("/upload/meet");
					System.out.print("=================url==================="+url);
					File uploadfile = new java.io.File(url + "/" + fileName);
					if (!uploadfile.exists()) {
						uploadfile.mkdirs();
					}
					upload.transferTo(uploadfile);
				}

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//在数据库只保存文件的名称
			regularMeet.setAttachment(fileName);
			
			System.out.print("=============================方法2====================================");
			regularMeetService.addRegularMeet(regularMeet);
			System.out.print("=============================方法3====================================");

			model.addAttribute("message", "添加成功");
			model.addAttribute("addRegulaMeet", regularMeet);
			model.addAttribute("flag", "1");
			
			return "/manager/regularMeetingAdd.jsp";
		}
		
		@RequestMapping("/downLoadFile")
		public ResponseEntity<byte[]> downFile(String fileName,
				HttpServletRequest req) throws IOException {
			String url = req.getSession().getServletContext()
					.getRealPath("/upload/meet");
			File file = new File(url + "/" + fileName);
			HttpHeaders headers = new HttpHeaders();
			// 下载显示的⽂件名，解决中⽂名称乱码问题
			String downloadFielName = new String(fileName.getBytes("UTF-8"),
					"iso-8859-1");
			// 通知浏览器以attachment（下载⽅式）打开图⽚
			headers.setContentDispositionFormData("attachment", downloadFielName);
			// application/octet-stream：⼆进制流数据（最常⻅的⽂件下载）。
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
					headers, HttpStatus.CREATED);

		}
		
		
		
		
		//修改选定的会议
	    @RequestMapping("/updateRegularMeet")
	    public String updateRegularMeet(Model model,RegularMeet regularMeet,HttpServletRequest req,MultipartFile upload) {
	    	//System.out.println("key====================================================="+key+"===================================");

	    	//展示选择会议记录的原信息
	    	Map map=new HashMap();
	    	map.put("key",regularMeet.getKey());
	    	List<RegularMeet> old_meets=regularMeetService.getRegularMeetList(map);
	    	RegularMeet old_meet=old_meets.get(0);
	    	model.addAttribute("updateMeet", old_meet);
	    	System.out.println("key====================================================="+regularMeet.getKey()+"===================================");
	    	
	    	if(regularMeet.getTheme()!=null) {
	    	/*对提交的会议记录进行修改
	    	 * 1.将修改的文件上传
	    	 */
	    		String fileName = "";
				try {// 原始⽂件名称
					if (upload != null) {
						fileName = upload.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/meet");
						System.out.print("=================url==================="+url);
						File uploadfile = new java.io.File(url + "/" + fileName);
						if (!uploadfile.exists()) {
							uploadfile.mkdirs();
						}
						upload.transferTo(uploadfile);
					}

				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//在数据库只保存文件的名称
				regularMeet.setAttachment(fileName);
				//2.修改数据库里的信息
            regularMeetService.updateRegularMeet(regularMeet);
	        model.addAttribute("message", "修改成功");
	    	List<RegularMeet> new_meets=regularMeetService.getRegularMeetList(map);
	    	RegularMeet new_meet=new_meets.get(0);
	    	System.out.print("new========================================"+new_meet.getMeetDate()+"==================="+new_meet.getTheme());
	    	model.addAttribute("flag", "1");
	    	model.addAttribute("updateMeet", new_meet);
	    	
	    	}
			return "/manager/regularMeetingUpdate.jsp";
	    	}
	    
	    
	    //删除会议记录
	    @RequestMapping("/deleteRegularMeet")
	    public String deleteRegularMeet(String keys) {
	        String[] key=keys.split(",");
	        int key2[]=new int[key.length];
	        for(int i=0;i<key.length;i++) {
	        	key2[i]=Integer.parseInt(key[i]);
	        }
           regularMeetService.deleteRegularMeet(key2);
        	return "redirect:regularMeetInfoList";
           
	    }

}
