package com.inspur.cmis.controller;

import java.io.File;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.constant.Constant;
import com.inspur.cmis.pojo.CMWork;
import com.inspur.cmis.pojo.ClientManager;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.ClientMgrService;
import com.inspur.cmis.service.ParamService;
import com.inspur.cmis.service.UserService;
import com.inspur.cmis.util.ImportExcelUtil;

@Controller
public class ClientMgrController {
	
	@Autowired 
	private ClientMgrService clientMgrService;
	@Autowired
	private ParamService paramService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/clientMgrInfoList")
    public String clientMgrInfoList(HttpSession session,Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数（cmUnit、cmId和cmName、cmStatus等是通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
		//机构
		String cmUnit=request.getParameter("cmUnit");
		//编号
		String cmId=request.getParameter("cmId");
		//姓名
		String cmName=request.getParameter("cmName");
		//状态
		String cmStatus=request.getParameter("cmStatus");
		
		Map map=new HashMap<String,String>();
		map.put("cmUnit", cmUnit);
		map.put("cmId", cmId);
		map.put("cmName", cmName);
		map.put("cmStatus", cmStatus);
		
		session.setAttribute("exportMap", map);
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 6);
		
		//进行数据查询（或根据前台传入的条件查询，或查询全部）
		List<ClientManager> clientMgrList=clientMgrService.getClientManagerList(map);
		
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<CMWork> pageInfo=new PageInfo (clientMgrList,clientMgrList.size());
		
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);//用于分页展示
		model.addAttribute("cmId", cmId);
		model.addAttribute("cmUnit",cmUnit);
		model.addAttribute("cmName",cmName);
		model.addAttribute("cmStatus",cmStatus);
		
		return "/manager/clientMgr.jsp";
		
	}
	
	//查询报表的内容
	@RequestMapping("/getclientMgrStatList")
	   public String getclientMgrStatList(HttpSession session,Model model,HttpServletRequest request) {
		
			//获取前台传递的参数（cmUnit、cmId和cmName、cmStatus等是通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
			//机构
			String cmUnit=request.getParameter("cmUnit");
			System.out.println("====================cmUnit========================"+cmUnit+"===================================");
			//状态
			String cmStatus=request.getParameter("cmStatus");
			System.out.println("====================cmStatus========================"+cmStatus+"===================================");

			//性别
			String cmSex=request.getParameter("cmSex");
			//学历
			String cmEducation=request.getParameter("cmEducation");
			//专业技术职称
			String cmProTitles=request.getParameter("cmProTitles");
			//客户经理等级
			String cmLevel=request.getParameter("cmLevel");
			Map stat_map=new HashMap<String,String>();
			stat_map.put("cmUnit", cmUnit);
			stat_map.put("cmStatus", cmStatus);
			stat_map.put("cmSex", cmSex);
			stat_map.put("cmEducation", cmEducation);
			stat_map.put("cmProTitles", cmProTitles);
			stat_map.put("cmLevel", cmLevel);
			System.out.println("==============stat_map============="+stat_map.size()+"==================="+stat_map.get("cmUnit")+"============");
			//进行数据查询（或根据前台传入的条件查询，或查询全部）
			List<ClientManager> clientMgrList=clientMgrService.getClientManagerList(stat_map);
			session.setAttribute("statMap", stat_map);
			System.out.println("=====================size================="+clientMgrList.size()+"==================================");
			model.addAttribute("clientMgrList",clientMgrList);//用于报表展示
			model.addAttribute("cmUnit",cmUnit);
			model.addAttribute("cmStatus",cmStatus);
			model.addAttribute("cmSex", cmSex);
			model.addAttribute("cmEducation", cmEducation);
			model.addAttribute("cmProTitles", cmProTitles);
			model.addAttribute("cmLevel", cmLevel);

			
			return "/manager/clientMgrStat.jsp";
			
		}
	
	
	
	//民族
	@ModelAttribute("nationParam")
	public Map<String, String> getNationList() {
		Map<String, String> nationParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_NATION);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				nationParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return nationParam;
	}

	
	//政治面貌
	@ModelAttribute("policeParam")
	public Map<String, String> getcmPoliList() {
		Map<String, String> policeParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_POLICSTATUS);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				policeParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return policeParam;
	}
	
   //客户经理等级
	@ModelAttribute("levelParam")
	public Map<String, String> getcmLevelList() {
		Map<String, String> levelParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_MGRLEVEL);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				levelParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return levelParam;
	}
	//学历
	@ModelAttribute("educationParam")
	public Map<String, String> getEducationList() {
		Map<String, String> educationParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_EDUCATION);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				educationParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return educationParam;
	}
	//学位
	@ModelAttribute("degreeParam")
	public Map<String, String> getDegreeList() {
		Map<String, String> degreeParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_DEGREE);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				degreeParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return degreeParam;
	}
	
	//专业职称
	@ModelAttribute("proTitlesParam")
	public Map<String, String> getProTitlesList() {
		Map<String, String> proTitlesParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_PROTITLES);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				proTitlesParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return proTitlesParam;
	}

	//在进入增加用户页面前，先进入controller中，绑定数据
	@RequestMapping("/toMgrAdd")
	public ModelAndView toMgrAdd(Model model) {
		ModelAndView mv = new ModelAndView();
		// mv.addObject("username","zhangsan");
		mv.setViewName("/manager/clientMgrAdd.jsp");
		return mv;
	}
	
	/*增加客户经理信息
	 * 1.添加一条用户信息
	 * 2.根据用户的id创建相关联的客户经理信息
	 */
	@RequestMapping("/addClientMgr")
	public String addClientMgr(ClientManager mgr, MultipartFile pic,HttpServletRequest req, Model model) {
		//添加用户信息
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String cmModiDate=df.format(date);
		// 初始化一条用户信息
		User user = new User();
		user.setUsername(mgr.getCmName());
		user.setSex(mgr.getCmSex());
		user.setBirthDay(mgr.getCmBirthDay());
		user.setEmail("1111@qq.con");
		user.setPassword("666666");
		user.setQuestion("6位吉祥数字");
		user.setAnswer("666666");
		user.setIsEnable("T");
		user.setRoleId(Constant.USER_ROLEID_MANAGER);
		user.setRegisterTime(cmModiDate);
		user.setLastTime(cmModiDate);
		userService.addUser(user);
		//获取用户的id
		List<User> addUser=userService.getUserByUserName(mgr.getCmName());
		int cmId = 0;
		for(int i=0;i<addUser.size();i++) {
			cmId=addUser.get(i).getUserId();
		}
					
		//添加客户经理信息
		String uploadFile_name = "";
		String newFileName = "";
		try {// 原始⽂件名称
			if (pic != null) {
				uploadFile_name = pic.getOriginalFilename();
				// 新⽂件名称
				if (!"".equals(uploadFile_name))
					newFileName = UUID.randomUUID().toString()
							+ uploadFile_name.substring(uploadFile_name
									.lastIndexOf("."));
				// 上传图片物理路径
				String url = req.getSession().getServletContext()
						.getRealPath("/images/upload");
				File uploadfile = new java.io.File(url + "/" + newFileName);
				System.out.println("===============================url======================"+url+"==========================");
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				pic.transferTo(uploadfile);
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("==============================ID======================================"+cmId+"==================================");

		mgr.setCmId(cmId);
		mgr.setCmPhoto(newFileName);
		mgr.setCmStatus("T");
		mgr.setCmModiDate(cmModiDate);
        clientMgrService.addClientMgr(mgr);		
System.out.print("====================添加方法执行===================================");
		model.addAttribute("message", "保存成功");
		model.addAttribute("saveFlag", "1");
		model.addAttribute("mgr", mgr);
		return "/manager/clientMgrAdd.jsp";
	}
	
    //导出数据 exportExcel
	@RequestMapping("/exportExcel")
	@ResponseBody
	public void exportExcel(HttpSession session,HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("========================进入导出方法==========================");
		// 调用Service层
		
		Map map=new HashMap<String,String>();
		map=(Map) session.getAttribute("exportMap");
		List<ClientManager> clientMgrList=clientMgrService.getClientManagerList(map);

		String[] title = { "客户经理编号", "姓名", "性别", "身份证号", "出生日期", "年龄", "民族",
				"政治面貌", "籍贯", "学历", "学位", "毕业院校", "参加工作时间", "入职时间", "办公电话",
				"移动电话", "客户经理等级", "机构", "部门" };// 设置EXCEL的第一行的标题头
		// 创建excel工作薄
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 创建一个工作表sheet
		XSSFSheet sheet = workbook.createSheet();
		// 创建第一行
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell = null;

		// 插入第一行数据 id 地区名称
		for (int i = 0; i < title.length; i++) {

			cell = row.createCell(i);
			// 赋值
			cell.setCellValue(title[i]);
		}
		// 追加数据行数
		int j = 1;
        ClientManager cm=new ClientManager();
		for (int i = 0; i < clientMgrList.size(); i++) {
			//获取查询到的列表中的每一个数据
			cm = clientMgrList.get(i);
			System.out.println("=======================size==================="+clientMgrList.size()+"======================");
			//新建一行
			XSSFRow nextrow = sheet.createRow(i + 1);
			//在这行上新建一个单元格
			XSSFCell cessk = nextrow.createCell(0);
			// 在单元格上插入客户经理编号
			cessk.setCellValue(cm.getCmId());
			//在这行上新建一个单元格
			cessk = nextrow.createCell(1);
			// 插入姓名
			cessk.setCellValue(cm.getCmName());
			cessk = nextrow.createCell(2);
			// 性别
			cessk.setCellValue((cm.getCmSex()) == "F" ? "女" : "男");
			cessk = nextrow.createCell(3);
			// 身份证号码
			cessk.setCellValue(cm.getCmSsn());
			cessk = nextrow.createCell(4);
			// 出生日期
		    cessk.setCellValue(cm.getCmBirthDay());// 出生日期
            cessk = nextrow.createCell(5);
            // 年龄
			cessk.setCellValue(cm.getCmAge());
			cessk = nextrow.createCell(6);
			// 民族
			String nation = cm.getCmNation();
			Map paramMap = new HashMap<String, String>();
			//将参数的代码和参数种类的代码封装到map中
			paramMap.put("paramType", Constant.PARAM_TYPE_NATION);
			paramMap.put("paramCode", nation);
			//调用service方法获得参数的名称
			String nationName = paramService.getParamName(paramMap);
			cessk.setCellValue(nationName);
			// 政治面貌
			cessk = nextrow.createCell(7);
			String policeStatus =cm.getCmPoli();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_POLICSTATUS);
			paramMap.put("paramCode", policeStatus);
			String policeStatusName = paramService.getParamName(paramMap);
			cessk.setCellValue(policeStatusName);
			// 籍贯
			cessk = nextrow.createCell(8);
			cessk.setCellValue(cm.getCmHome());
			cessk = nextrow.createCell(9);
			// 学历
			String education = cm.getCmEducation();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_EDUCATION);
			paramMap.put("paramCode", education);
			String educationName = paramService.getParamName(paramMap);
			cessk.setCellValue(educationName);
			// 学位
			cessk = nextrow.createCell(10);
			String degree = cm.getCmDegree();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_DEGREE);
			paramMap.put("paramCode", degree);
			String degreeName = paramService.getParamName(paramMap);
			cessk.setCellValue(degreeName);
			// 毕业院校
			cessk = nextrow.createCell(11);
			cessk.setCellValue(cm.getCmGraduated());
			// 参加工作时间
			cessk = nextrow.createCell(12);
			String hireDate =cm.getCmHireDate();
			if (hireDate != null)
				cessk.setCellValue(hireDate);
			else
				cessk.setCellValue("");
			// 入职时间
			cessk = nextrow.createCell(13);
			String entryDate = cm.getCmEntryDate();
			if (entryDate != null)
				cessk.setCellValue(entryDate);
			else
				cessk.setCellValue("");
			//电话
			cessk = nextrow.createCell(14);
			cessk.setCellValue(cm.getCmTel());
           //移动电话
			cessk = nextrow.createCell(15);
			cessk.setCellValue(cm.getCmMobile());
            //客户经理等级
			cessk = nextrow.createCell(16);
			String level = cm.getCmLevel();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_DEGREE);
			paramMap.put("paramCode", level);
			String epLevel = paramService.getParamName(paramMap);
			cessk.setCellValue(epLevel);// 客户经理级别
			// 机构
			cessk = nextrow.createCell(17);
			cessk.setCellValue(cm.getCmUnit());
			// 部门
			cessk = nextrow.createCell(18);
			cessk.setCellValue(cm.getCmDept());
			j++;
		}
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String("客户经理信息.xlsx".getBytes(), "iso-8859-1"));
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (IOException e) {
		} finally {
			//workbook.();
		}
	}

	
	
	
	//展示客户经理的详细信息
	@RequestMapping("/showClientMgrDetail")
	public String showClientMgrDetail(String cmId,Model model) {
		Map map=new HashMap();
		System.out.print("===========================cmId====="+cmId+"============================");
		map.put("cmId", cmId);
		List<ClientManager> list=clientMgrService.getClientManagerList(map);
		ClientManager clientManager=list.get(0);
		model.addAttribute("clientMgr", clientManager);
		return "/manager/clientMgrInfoDetail.jsp";
	}
	
	
	//修改用户代码
	@RequestMapping("/updateClientMgr")
	public String updateClientMgr(ClientManager clientManager,Model model,MultipartFile pic,HttpServletRequest req) {

    	//展示选择客户经理的原信息
    	Map map=new HashMap();
    	map.put("cmId",clientManager.getCmId());
    	List<ClientManager> old_cms=clientMgrService.getClientManagerList(map);
    	ClientManager old_cm=old_cms.get(0);
    	model.addAttribute("CM", old_cm);
    	System.out.print("cmid====================================================="+clientManager.getCmId()+"===================================");
    	if(clientManager.getCmName()!=null) {
    	//对选择的客户经理的信息进行修改
    		String uploadFile_name = "";
    		String newFileName = "";
    		try {// 原始⽂件名称
    			if (pic != null) {
    				uploadFile_name = pic.getOriginalFilename();
    				// 新⽂件名称
    				if (!"".equals(uploadFile_name))
    					newFileName = UUID.randomUUID().toString()
    							+ uploadFile_name.substring(uploadFile_name
    									.lastIndexOf("."));
    				// 上传图⽚物理路径
    				String url = req.getSession().getServletContext()
    						.getRealPath("/images/upload");
    				File uploadfile = new java.io.File(url + "/" + newFileName);
    				System.out.println("===============================url======================"+url+"==========================");
    				if (!uploadfile.exists()) {
    					uploadfile.mkdirs();
    				}
    				pic.transferTo(uploadfile);
    			}

    		} catch (IllegalStateException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		//修改照片
    	clientManager.setCmPhoto(newFileName);
    	//更新修改时间
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
   		Date date=new Date();
   		String cmModiDate=df.format(date);
   		clientManager.setCmModiDate(cmModiDate);
   		
    	clientMgrService.updateClientMgr(clientManager);
    	model.addAttribute("message", "修改成功");
    	model.addAttribute("tag", "1");
    	List<ClientManager> new_cms=clientMgrService.getClientManagerList(map);
    	ClientManager new_cm=new_cms.get(0);
    	model.addAttribute("CM", new_cm);}
	  return "/manager/clientMgrUpdate.jsp";
	}
	
	//批量删除客户经理的信息记录
	@RequestMapping("/deleteClientMgr")
	public String deleteClientMgr(String cmIds) {
		String[] id=cmIds.split(",");
		int[] cmId=new int[id.length];
		for(int i=0;i<id.length;i++) {
			cmId[i]=Integer.parseInt(id[i]);
		}
		clientMgrService.deleteClientMgr(cmId);
		//将用户表中相应的设为不可用
		Map user_map=new HashMap();
		user_map.put("tag", "2");
        user_map.put("userIds", cmId);	
        userService.operateUsers(user_map);
		return "redirect:clientMgrInfoList";
	}
	
	//单个删除客户经理信息
	@RequestMapping("/singldeleteCM")
	public String singldeleteCM(String cmId) {
		System.out.println("================ids============="+cmId+"==============");

		int[] ids=new int[1];
		ids[0]=Integer.parseInt(cmId);
		clientMgrService.deleteClientMgr(ids);
		//将用户表中相应的设为不可用
		Map user_map=new HashMap();
		user_map.put("tag", "2");
		user_map.put("userIds", ids);	
	    userService.operateUsers(user_map);
		return "redirect:clientMgrInfoList";
	}
	

	
	 //导出报表数据 
		@RequestMapping("/exportExcelStat")
		@ResponseBody
		public void exportExcelStat(HttpSession session,HttpServletRequest request, HttpServletResponse response)
				throws Exception {

			System.out.println("========================进入导出方法==========================");
			// 调用Service层
			
			Map map=new HashMap<String,String>();
			map=(Map) session.getAttribute("statMap");
			List<ClientManager> clientMgrList=clientMgrService.getClientManagerList(map);

			String[] title = { "客户经理编号", "姓名", "性别", "客户经理等级", "机构","部门", "业务线条", "职务",
					"客户经理从业年限", "联系电话", "状态", "年龄", "学历", "专业职称" };// 设置EXCEL的第一行的标题头
			// 创建excel工作薄
			XSSFWorkbook workbook = new XSSFWorkbook();
			// 创建一个工作表sheet
			XSSFSheet sheet = workbook.createSheet();
			// 创建第一行
			XSSFRow row = sheet.createRow(0);
			XSSFCell cell = null;

			// 插入第一行数据 id 地区名称
			for (int i = 0; i < title.length; i++) {

				cell = row.createCell(i);
				// 赋值
				cell.setCellValue(title[i]);
			}
			// 追加数据行数
			int j = 1;
	        ClientManager cm=new ClientManager();
			Map paramMap = new HashMap<String, String>();

			for (int i = 0; i < clientMgrList.size(); i++) {
				//获取查询到的列表中的每一个数据
				cm = clientMgrList.get(i);
				//新建一行
				XSSFRow nextrow = sheet.createRow(i + 1);
				//在这行上新建一个单元格
				XSSFCell cessk = nextrow.createCell(0);
				// 在单元格上插入客户经理编号
				cessk.setCellValue(cm.getCmId());
				//在这行上新建一个单元格---插入姓名
				cessk = nextrow.createCell(1);
				cessk.setCellValue(cm.getCmName());
				//性别
				cessk = nextrow.createCell(2);
				cessk.setCellValue((cm.getCmSex()) == "F" ? "女" : "男");
				// 客户经理等级
				cessk = nextrow.createCell(3);
				String cmLevel=cm.getCmLevel();
				paramMap.clear();
				paramMap.put("paramType", Constant.PARAM_TYPE_MGRLEVEL);
				paramMap.put("paramCode", cmLevel);
				//调用service方法获得参数的名称
				String levelName = paramService.getParamName(paramMap);
				cessk.setCellValue(levelName);
				
				
				// 机构
				cessk = nextrow.createCell(4);
			    cessk.setCellValue(cm.getCmUnit());
			    
	            //部门
	            cessk = nextrow.createCell(5);
			    cessk.setCellValue(cm.getCmDept());

	            // 业务线条
	            String cmBusLines="";
	            if(cm.getCmBusLines().equals("1")) {
	            	cmBusLines="对公";
	            }else {
	            	cmBusLines="对个人";
	            }
				cessk = nextrow.createCell(6);
				cessk.setCellValue(cmBusLines);
				//职务
				cessk = nextrow.createCell(7);
				cessk.setCellValue(cm.getCmPosition());

				// 客户经理从业年限
				cessk = nextrow.createCell(8);
				cessk.setCellValue(cm.getCmEntryDate());
				//联系电话
				cessk = nextrow.createCell(9);
				cessk.setCellValue(cm.getCmMobile());
				//状态
				cessk = nextrow.createCell(10);
			    String cmStatus="";
		        if(cm.getCmStatus().equals("T")) {
		        	cmStatus="在职";
		            }else {
		            cmStatus="退出";
		            }
					cessk.setCellValue(cmStatus);
				//年龄
				cessk = nextrow.createCell(11);
				cessk.setCellValue(cm.getCmAge());
				//学历
				cessk = nextrow.createCell(12);
                String education = cm.getCmEducation();
				//将参数的代码和参数种类的代码封装到map中
                paramMap.clear();
				paramMap.put("paramType", Constant.PARAM_TYPE_EDUCATION);
				paramMap.put("paramCode", education);
				//调用service方法获得参数的名称
				String eduName = paramService.getParamName(paramMap);
				cessk.setCellValue(eduName);
				//专业职称
				cessk = nextrow.createCell(13);
                String cmProTitles = cm.getCmProTitles();
				//将参数的代码和参数种类的代码封装到map中
                paramMap.clear();
				paramMap.put("paramType", Constant.PARAM_TYPE_PROTITLES);
				paramMap.put("paramCode", cmProTitles);
				//调用service方法获得参数的名称
				String proName = paramService.getParamName(paramMap);
				cessk.setCellValue(proName);
				j++;
			}
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename="
					+ new String("客户经理报表信息.xlsx".getBytes(), "iso-8859-1"));
			OutputStream ouputStream;
			try {
				ouputStream = response.getOutputStream();
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			} catch (IOException e) {
			} finally {
				//workbook.();
			}
		}
		
		//导入客户经理信息
		@RequestMapping("/uploadExcel")
		public void uploadExcel(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

			InputStream in = null;
			List<List<Object>> listob = null;
			MultipartFile file = multipartRequest.getFile("upfile");

			if (file.isEmpty()) {
				throw new Exception("文件不存在！");
			}
			in = file.getInputStream();
			listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
			in.close();
			List<ClientManager> clientList = new ArrayList<ClientManager>();
			List<User> userList = new ArrayList<User>();
			Date today = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String time = format.format(today);
			// 该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
			System.out.println("size=============================="+listob.size()+"=====================");
			for (int i = 0; i < listob.size()-2; i++) {
				List<Object> lo = listob.get(i);
				//第一步封装user对象，添加完user后获得客户经理的编号再添加客户经理信息
				User user=new User();
				//添加用户的姓名
				user.setUsername(String.valueOf(lo.get(1)));
				//用户密码：666666
				user.setPassword("666666");
				//用户的性别
				user.setSex(String.valueOf(lo.get(2)));
				//用户的生日
				user.setBirthDay(String.valueOf(lo.get(4)));
				
				//其他属性
				user.setEmail("22222@qq.com");
				user.setRegisterTime(time);
				user.setAnswer("22222");
				user.setQuestion("myqq");
				user.setIsEnable("T");
				user.setRoleId(Constant.USER_ROLEID_MANAGER);
				user.setLastTime(time);
				userList.add(user);
				//添加用户
				userService.addUser(user);
				//获得用户的id
				int userId=userService.getUser(user).getUserId();
				//封装客户经理的信息
				ClientManager manager = new ClientManager();
				manager.setCmId(userId);
				manager.setCmName(String.valueOf(lo.get(2)));// 姓名
				manager.setCmSex(String.valueOf(lo.get(3)));// 性别
				manager.setCmSsn(String.valueOf(lo.get(4)));// 身份证号码
						
				manager.setCmBirthDay(String.valueOf(lo.get(5) == null ? "1991-01-01"
						: lo.get(4)));// 出生日期
				manager.setCmAge(Integer.parseInt(String.valueOf(lo.get(6) == null ? "0"
						: lo.get(5))));// 年龄
				manager.setCmNation(String.valueOf(lo.get(7)));// 民族
				manager.setCmPoli(String.valueOf(lo.get(8)));// 政治面貌
				manager.setCmHome(String.valueOf(lo.get(9)));// 籍贯
				manager.setCmEducation(String.valueOf(lo.get(10)));// 学历
				manager.setCmDegree(String.valueOf(lo.get(11)));// 学位
				manager.setCmGraduated(String.valueOf(lo.get(12)));// 毕业院校
				//manager.setCmProTitles(String.valueOf(lo.get(12)));// 专业职称
				
				manager.setCmHireDate(String.valueOf(lo.get(13) == null ? "1991-01-01"
						: lo.get(13))); // 参加工作时间
				
				manager.setCmEntryDate(String
						.valueOf(lo.get(13) == null ? "1991-01-01" : lo.get(14))); // 入行参加工作时间
				/*
				 manager.setCmFiYear(Integer.parseInt(String.valueOf(lo
						.get(15) == null ? "0" : lo.get(15))));// 从事金融工作年限
				manager.setCmWorkYear(Integer.parseInt(String
						.valueOf(lo.get(16) == null ? "0" : lo.get(16))));// 工作年限
				 */
				
				manager.setCmTel(String.valueOf(lo.get(15)));// 办公电话
				manager.setCmMobile(String.valueOf(lo.get(16)));// 移动电话
				manager.setCmLevel(String.valueOf(lo.get(17)));// 客户经理等级
				manager.setCmUnit(String.valueOf(lo.get(18)));// 机构
				manager.setCmDept(String.valueOf(lo.get(19)));// 部门
				

				System.out.println("客户经理信息-->" + manager.toString());
               //将封装的客户经理信息添加到list中
				clientList.add(manager);
				}
			clientMgrService.importClientMgrList(clientList);// 批量插入

			PrintWriter out = null;
			response.setCharacterEncoding("utf-8"); // 防止ajax接受到的中文信息乱码
			out = response.getWriter();
			out.print("文件导入成功！");
			out.flush();
			out.close();
		}
}

