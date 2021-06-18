package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import com.inspur.cmis.pojo.ClientExt;
import com.inspur.cmis.pojo.MarketRecord;
import com.inspur.cmis.pojo.RegularMeet;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.ClientService;
import com.inspur.cmis.service.MarketRecordService;

@Controller
public class MarketRecordController {

	@Autowired
	private MarketRecordService marketRecordService;
	@Autowired
	private ClientService clientService;
	
	@RequestMapping("/marketRecordInfoList")
	public String marketRecordInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数,通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1
		String cmId=request.getParameter("cmId");
		String cName=request.getParameter("cName");
		Map map=new HashMap<String,String>();
		map.put("cmId", cmId);
		map.put("cName", cName);
		
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 3);
		
		//进行数据查询（或根据id、name查询，或查询全部）
		List<MarketRecord> mrList=marketRecordService.getMarketRecordList(map);
		System.out.println("======================size==================="+mrList.size()+"========================");
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<MarketRecord> pageInfo=new PageInfo(mrList,mrList.size());
		
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("cmId", cmId);
		model.addAttribute("cName",cName);
		
		return "/manager/marketRecord.jsp";
		
	}
	//增加营销信息
			@RequestMapping(value="/addMarketRecord")
			public String addMarketRecord(MarketRecord marketRecord,Model model,
					MultipartFile report,MultipartFile tes, MultipartFile evalue,HttpServletRequest req) throws UnsupportedEncodingException {
				System.out.print("======================进入添加方法============================");
				req.setCharacterEncoding("UTF-8");
				//report客户拜访报告表
				//tes客户推荐表
				//evalue客户综合评价表
				String report_fileName = "";
				String test_fileName = "";
				String evalue_fileName = "";
				try {// 上传客户拜访报告表名称
					if (report != null) {
						report_fileName = report.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/marketRecord");
						System.out.print("=================url==================="+url);
						File reportfile = new java.io.File(url + "/" + report_fileName);
						if (!reportfile.exists()) {
							reportfile.mkdirs();
						}
						report.transferTo(reportfile);
					}
					//上传客户推荐表
					if (tes != null) {
						test_fileName = tes.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/marketRecord");
						System.out.print("=================url==================="+url);
						File testfile = new java.io.File(url + "/" + test_fileName);
						if (!testfile.exists()) {
							testfile.mkdirs();
						}
						tes.transferTo(testfile);
					}
					//上传客户综合评价表
					if (evalue!= null) {
						evalue_fileName = evalue.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/marketRecord");
						System.out.print("=================url==================="+url);
						File evaluefile = new java.io.File(url + "/" + evalue_fileName);
						if (!evaluefile.exists()) {
							evaluefile.mkdirs();
						}
						evalue.transferTo(evaluefile);
					}

				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//在数据库只保存上传文件的名称
				marketRecord.setMrReport(report_fileName);
				marketRecord.setMrTes(test_fileName);
				marketRecord.setMrEvalue(evalue_fileName);
				//根据客户的名字查出客户的id
				Map map=new HashMap<>();
				map.put("cName", marketRecord.getcName());
				List<ClientExt> a=clientService.getClientList(map);
						if (a!=null && a.size()>0) {
							int cid=a.get(0).getCkey();
							String cId=String.valueOf(cid);
							marketRecord.setcId(cId);
							 marketRecordService.addMarketRecord(marketRecord);
						}else {
							model.addAttribute("message","GG");
							return "/manager/marketRecordAdd.jsp";
						}
						
				
				
              
				System.out.print("=============================方法3====================================");

				model.addAttribute("message", "添加成功");
				model.addAttribute("addMR", marketRecord);
				model.addAttribute("flag", "1");
				
				return "/manager/marketRecordAdd.jsp";
			}
	
	
	//点击文件名下载文件
	@RequestMapping("/downLoadMRFile")
	public ResponseEntity<byte[]> downFile(String fileName,
			HttpServletRequest req) throws IOException {
		String url = req.getSession().getServletContext()
				.getRealPath("/upload/marketRecord");
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
	
	//修改营销记录
	 @RequestMapping("/updateMarketRecord")
	    public String updateMarketRecord(Model model,MarketRecord marketRecord,HttpServletRequest req,
	    		MultipartFile report,MultipartFile tes, MultipartFile evalue) {

	    	//展示选择营销记录的原信息
	    	Map map=new HashMap();
	    	map.put("mrKey",marketRecord.getMrKey());
	    	List<MarketRecord> old_mrs=marketRecordService.getMarketRecordList(map);
	    	MarketRecord old_mr=old_mrs.get(0);
	    	model.addAttribute("updateMR", old_mr);
	    	System.out.println("key====================================================="+marketRecord.getMrKey()+"===================================");
	    	
	    	if(marketRecord.getcName()!=null) {
	    	/*对提交的会议记录进行修改
	    	 * 1.将修改的文件上传
	    	 */			
	    		System.out.println("=========cname======================="+marketRecord.getcName()+"===================");
	    		System.out.println("=========managerment======================="+marketRecord.getMrManagrment()+"===================");

	    		String report_fileName = "";
				String test_fileName = "";
				String evalue_fileName = "";
				try {// 上传客户拜访报告表名称
					if (report != null) {
						report_fileName = report.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/marketRecord");
						System.out.print("=================url==================="+url);
						File reportfile = new java.io.File(url + "/" + report_fileName);
						if (!reportfile.exists()) {
							reportfile.mkdirs();
						}
						report.transferTo(reportfile);
					}
					//上传客户推荐表
					if (tes != null) {
						test_fileName = tes.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/marketRecord");
						System.out.print("=================url==================="+url);
						File testfile = new java.io.File(url + "/" + test_fileName);
						if (!testfile.exists()) {
							testfile.mkdirs();
						}
						tes.transferTo(testfile);
					}
					//上传客户综合评价表
					if (evalue!= null) {
						evalue_fileName = evalue.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/marketRecord");
						System.out.print("=================url==================="+url);
						File evaluefile = new java.io.File(url + "/" + evalue_fileName);
						if (!evaluefile.exists()) {
							evaluefile.mkdirs();
						}
						evalue.transferTo(evaluefile);
					}

				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//在数据库只保存上传文件的名称
				marketRecord.setMrReport(report_fileName);
				marketRecord.setMrTes(test_fileName);
				marketRecord.setMrEvalue(evalue_fileName);
				//2.修改数据库里的信息
            marketRecordService.updateMarketRecord(marketRecord);
		    model.addAttribute("message", "修改成功");
	    	List<MarketRecord> new_mrs=marketRecordService.getMarketRecordList(map);
	    	MarketRecord new_mr=new_mrs.get(0);
	    	model.addAttribute("flag", "1");
	    	model.addAttribute("updateMR", new_mr);
	    	
	    	}
			return "/manager/marketRecordUpdate.jsp";
	    	}
	
	 //删除营销记录
	 @RequestMapping("/deleteMarketRecord")
	 public String deleteMarketRecord(String mrKeys) {
		 String mrKey[]=mrKeys.split(",");
		 int[] keys=new int[mrKey.length];
		 for(int i=0;i<mrKey.length;i++) {
			 keys[i]=Integer.parseInt(mrKey[i]);
		 }
		 marketRecordService.deleteMarketRecord(keys);
		 return "redirect:marketRecordInfoList";
	 }
	
}
