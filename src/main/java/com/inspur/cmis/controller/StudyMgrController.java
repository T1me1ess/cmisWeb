package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.poi.xslf.usermodel.Placeholder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.constant.Constant;
import com.inspur.cmis.pojo.ClientExt;
import com.inspur.cmis.pojo.ClientManager;
import com.inspur.cmis.pojo.MarketRecord;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.pojo.StudyManager;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.ClientMgrService;
import com.inspur.cmis.service.ParamService;
import com.inspur.cmis.service.StudyMgrService;
import com.inspur.cmis.service.UserService;

@Controller
public class StudyMgrController {
	
	@Autowired
	private StudyMgrService studyMgrService;
	@Autowired
	private ParamService paramService;
	@Autowired
	private ClientMgrService clientMgrService;
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping("/getStudyMgrList")
    public String getStudyMgrList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数（通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
		String lName=request.getParameter("lName");
		String lType=request.getParameter("lType");

		Map map=new HashMap<String,String>();
		map.put("lName", lName);
		map.put("lType", lType);
		
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 3);
		
		//进行数据查询（或根据id、name查询，或查询全部）
		List<StudyManager> studyMgrList=studyMgrService.getStudyMgrList(map);
		
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<ClientExt> pageInfo=new PageInfo(studyMgrList,studyMgrList.size());
		System.out.println("============size==============="+studyMgrList.size()+"===================");
		System.out.println("============name==============="+studyMgrList.get(0).getlName()+"===================");
	
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("lName", lName);
		model.addAttribute("lType",lType);
		
		return "/manager/studyMgr.jsp";
		
	}
	
	//下载学习资料
	@RequestMapping("/downLoadStudyMgrFile")
	public ResponseEntity<byte[]> downLoadStudyMgrFile(String fileName,
			HttpServletRequest req) throws IOException {
		String url = req.getSession().getServletContext()
				.getRealPath("/upload/studyMgr");
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
	
	
	//在进入展示页面前，先进入controller中，绑定数据
		@RequestMapping("/toStudyMgrAdd")
		public ModelAndView toStudyMgrAdd(Model model) {
			ModelAndView mv = new ModelAndView();
			// mv.addObject("username","zhangsan");
			mv.setViewName("/manager/studyMgrAdd.jsp");
			return mv;
		}
		
	//在进入展示页面前，先进入controller中，绑定数据
				@RequestMapping("/toStudyMgrUpdate")
				public String  toStudyMgrUpdate(String lKey) {
					//int lKey1=Integer.parseInt(lKey);
//					StudyManager studyManager=new StudyManager();
//					studyManager.setlKey(lKey);
					return "redirect:updateStudyMgr?lKey="+lKey;
				}
		
	
	//学习材料类型
	@ModelAttribute("studyTypeParam")
	public Map<String, String> getStudyTypeList() {
		Map<String, String> studyTypeParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_LEARNTYPE);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				studyTypeParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return studyTypeParam;
	}
	
	//添加学习资料
	@RequestMapping("/addStudyMgr")
	public String addStudyMgr(StudyManager studyManager, MultipartFile upload,HttpServletRequest req, Model model) {
		//添加用户信息
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String lDate=df.format(date);
		studyManager.setlDate(lDate);		
		//添加客户经理信息
		String fileName = "";
		try {// 原始⽂件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图⽚物理路径
				String url = req.getSession().getServletContext()
						.getRealPath("/upload/studyMgr");
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
        studyManager.setlUrl(fileName);
        //根据上传者姓名获取公司
        Map map=new HashMap<String,String>();
        System.out.println("================cmName============="+studyManager.getlUper()+"=============");
        map.put("cmName", studyManager.getlUper());
        map.put("username", studyManager.getlUper());
        String lUnit="";
        //若用户为客户经理通过查表的方式获得
        if(userService.getUserList(map).get(0).getRoleId().equals("2"))
        {
         lUnit=clientMgrService.getClientManagerList(map).get(0).getCmUnit();
         }else {
        	 lUnit="银行";
         }
        
        studyManager.setlUnit(lUnit);
        studyMgrService.addStudyMgr(studyManager);
        System.out.print("====================添加方法执行===================================");
		model.addAttribute("message", "保存成功");
		model.addAttribute("saveFlag", "1");
		model.addAttribute("addST", studyManager);
		return "/manager/studyMgrAdd.jsp";
	}
	
     //修改学习资料
	 @RequestMapping("/updateStudyMgr")
	    public String updateStudyMgr(Model model,StudyManager studyManager,MultipartFile upload,HttpServletRequest req) {
	    	System.out.print("Key====================================================="+studyManager.getlKey()+"===================================");

	    	//展示选择用户的原信息
	    	Map map=new HashMap();
	    	map.put("lKey", studyManager.getlKey());
	    	List<StudyManager> old_sms=studyMgrService.getStudyMgrList(map);
	    	StudyManager old_sm=old_sms.get(0);
	    	model.addAttribute("SM", old_sm);
	    	if(studyManager.getlName()!=null) {
	    	//对提交的用户进行信息的修改
	    		String fileName = "";
	    		try {// 原始⽂件名称
	    			if (upload != null) {
	    				fileName = upload.getOriginalFilename();
	    				// 上传图⽚物理路径
	    				String url = req.getSession().getServletContext()
	    						.getRealPath("/upload/studyMgr");
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
	            studyManager.setlUrl(fileName);
            studyMgrService.updateStudyMgr(studyManager);
	    	model.addAttribute("message", "修改成功");
	    	model.addAttribute("flag", 1);

	    	List<StudyManager> new_sms=studyMgrService.getStudyMgrList(map);
	    	StudyManager new_sm=new_sms.get(0);
	    	model.addAttribute("SM", new_sm);
	    	
	    	}
	    	
			return "/manager/studyMgrUpdate.jsp";
			
	    }
	
      //批量删除学习资料
	 @RequestMapping("/deleteStudyMgr")
		public String deleteStudyMgr(String lKeys,Model model) {
			String[] lkey=lKeys.split(",");
			int[] keys=new int[lkey.length];
			for(int i=0;i<lkey.length;i++) {
				keys[i]=Integer.parseInt(lkey[i]);
			}
			studyMgrService.deleteStudyMgr(keys);
			return "redirect:getStudyMgrList";
		}

}
