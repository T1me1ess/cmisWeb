package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.varia.LevelMatchFilter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.constant.Constant;
import com.inspur.cmis.pojo.Assess;
import com.inspur.cmis.pojo.AssessExt;
import com.inspur.cmis.pojo.Certificate;
import com.inspur.cmis.pojo.CertificateExt;
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.ClientExt;
import com.inspur.cmis.pojo.ClientManager;
import com.inspur.cmis.pojo.ClientMgrResult;
import com.inspur.cmis.pojo.ClientMgrResultExt;
import com.inspur.cmis.pojo.LearnTranRecord;
import com.inspur.cmis.pojo.LearnTranRecordExt;
import com.inspur.cmis.pojo.Level;
import com.inspur.cmis.pojo.LevelExt;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.pojo.RPR;
import com.inspur.cmis.pojo.RPRExt;
import com.inspur.cmis.pojo.StudyManager;
import com.inspur.cmis.pojo.Work;
import com.inspur.cmis.pojo.WorkExt;
import com.inspur.cmis.service.ClientMgrOtherService;
import com.inspur.cmis.service.ParamService;

import oracle.net.aso.p;
import oracle.net.aso.s;

@Controller
public class ClientMgrOtherController {
	
	@Autowired
	private ClientMgrOtherService clientMgrOtherService;
	@Autowired
	private ParamService paramService;
	
	
	
	@RequestMapping("/getClientMgrOtherList")
	public String getClientMgrOtherList(String pageNum,Model model,HttpServletRequest request ) {
		String cmId=request.getParameter("cmId");
		String cmrYear=request.getParameter("cmrYear");
		String rprType=request.getParameter("rprType");
		String assTime=request.getParameter("assTime");
		String ltrDate=request.getParameter("ltrDate");
		String ltrSub=request.getParameter("ltrSub");
		String leDate=request.getParameter("leDate");
		String leLevel=request.getParameter("leLevel");
		String workPosition=request.getParameter("workPosition");
		Map map=new HashMap<String,String>();
		map.put("cmId", cmId);
		map.put("cmrYear", cmrYear);
		map.put("rprType",rprType);
		map.put("assTime", assTime);
		map.put("ltrDate", ltrDate);
		map.put("ltrSub", ltrSub);
		map.put("leDate", leDate);
		map.put("leLevel", leLevel);
		map.put("workPosition", workPosition);
		
		//进行工作年度业绩
		List<ClientMgrResultExt> cmResultExtList=clientMgrOtherService.getClientMgrResultList(map);
		model.addAttribute("ClientMgrResultExt",cmResultExtList);
		
		//进行证书的查询
		List<CertificateExt> certificateList=clientMgrOtherService.getCertificateList(map);
		model.addAttribute("CertificateExt", certificateList);
		
		//进行奖惩记录查询
		List<RPRExt> rprList=clientMgrOtherService.getRPRList(map);
		model.addAttribute("RPRExt", rprList);
		
		//进行考核记录查询
	    List<AssessExt> assList=clientMgrOtherService.getASSList(map);
		model.addAttribute("AssExt", assList);
		
		//进行学习培训记录的查询
		List<LearnTranRecordExt> ltrList=clientMgrOtherService.getLTRList(map);
		model.addAttribute("LTRExt", ltrList);
		
		//进行等级认定记录
		List<LevelExt> levelList=clientMgrOtherService.getLevelList(map);
		model.addAttribute("LevelExt", levelList);
		
		//进行工作经历的查询
		List<WorkExt> woekList=clientMgrOtherService.getWorkList(map);
		model.addAttribute("WorkExt", woekList);
		
		
		
	    model.addAttribute("cmId", cmId);
		model.addAttribute("cmrYear",cmrYear);
		model.addAttribute("rprType", rprType);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("assTime", assTime);
		model.addAttribute("ltrDate", ltrDate);
		model.addAttribute("ltrSub", ltrSub);
		model.addAttribute("leDate", leDate);
		model.addAttribute("leLevel", leLevel);
		model.addAttribute("workPosition", workPosition);
		
		return "/manager/clientMgrInfoOther.jsp";
		
	}
	

	
	//证书类型
	@ModelAttribute("certificateTypeParam")
	public Map<String, String> getTypeList() {
		Map<String, String> certificateTypeParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_CERTIFICATETYPE);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				certificateTypeParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return certificateTypeParam;
	}
	

	
	
	//在进入展示页面前，先进入controller中，绑定数据
			@RequestMapping("/toCertificateInfo")
			public String toCertificateInfo(Model model) {
				
				return "redirect:getClientMgrOtherList?pageNum=1";
			}
			
	
	//下载学习资料
		@RequestMapping("/downLoadClientMgrOtherFile")
		public ResponseEntity<byte[]> downLoadClientMgrOtherFile(String fileName,
				HttpServletRequest req) throws IOException {
			String url = req.getSession().getServletContext()
					.getRealPath("/upload/clientMgrOther");
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
	
	//添加工作年度业绩  
		@RequestMapping("/addClientMgrResult")
		public String addClientMgrResult(ClientMgrResult clientMgrResult, MultipartFile upload,
				HttpServletRequest req, Model model) {
			System.out.println("=====cmid========="+clientMgrResult.getCmId()+"==================");
			//维护日期
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			String cmrModiDate=df.format(date);
			clientMgrResult.setCmrModiDate(cmrModiDate);		
			//添加附件依据
			String fileName = "";
			try {// 原始⽂件名称
				if (upload != null) {
					fileName = upload.getOriginalFilename();
					// 上传图⽚物理路径
					String url = req.getSession().getServletContext()
							.getRealPath("/upload/clientMgrOther");
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
            clientMgrResult.setCmrAttachment(fileName);
            clientMgrOtherService.addClientMgrResult(clientMgrResult);
            System.out.print("====================添加方法执行===================================");
			model.addAttribute("message", "保存成功");
			//model.addAttribute("addCmrflag", "1");
			//model.addAttribute("addCmr", clientMgrResult);
			return "redirect:getClientMgrOtherList?pageNum=1";
		}
		//获得原来的工作业绩
		@RequestMapping("/modifyCmr")
		public @ResponseBody List<ClientMgrResultExt> getClientMgrResulr(String cmrKey) {
			Map map=new HashMap<>();
			map.put("cmrKey", cmrKey);
			List<ClientMgrResultExt> cmrList = clientMgrOtherService.getClientMgrResultList(map);
			return cmrList;
		}
		
		//修改工作业绩
		@RequestMapping("/modifyCmrResult")
		public String modifyCmrResult(ClientMgrResult clientMgrResult,Model model,MultipartFile upload,HttpServletRequest req) {
			System.out.println("cmrKey==========="+clientMgrResult.getCmrKey()+"================");
			String uploadFile_name = "";
			String newFileName = "";
			try {// 原始⽂件名称
					if (upload != null) {
						uploadFile_name = upload.getOriginalFilename();

						String url = req.getSession().getServletContext()
								.getRealPath("/upload/clientMgrOther");
						File uploadfile = new java.io.File(url + "/" + uploadFile_name);
						if (!uploadfile.exists()) {
							uploadfile.mkdirs();
						}
						upload.transferTo(uploadfile);
						clientMgrResult.setCmrAttachment(uploadFile_name);
					}
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				// 1.获取当前时间
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date date=new Date();
				String cmrModiDate=df.format(date);
				clientMgrResult.setCmrModiDate(cmrModiDate);
                clientMgrOtherService.modifyCmrResult(clientMgrResult);
				return "redirect:getClientMgrOtherList?pageNum=1";
			}
			
		//删除工作业绩
		@RequestMapping("/deleteClientMgrResult")
		public String deleteClientMgrResult(String cmrKeys) {
			System.out.println("=============进入删除方法==================");
			System.out.println("=============cmrkeys=================="+cmrKeys+"=============");

			String[] s_cmrKey=cmrKeys.split(",");
			int[] i_cmrKey=new int[s_cmrKey.length];
			for(int i=0;i<s_cmrKey.length;i++) {
				i_cmrKey[i]=Integer.parseInt(s_cmrKey[i]);
			}
			clientMgrOtherService.deleteClientMgrResult(i_cmrKey);
			return "redirect:getClientMgrOtherList?pageNum=1";
			
		}
	
		
		//添加证照记录
		@RequestMapping("/addCertificate")
		public String addCertificate(Certificate certificate,MultipartFile upload,HttpServletRequest req, Model model) {
				//维护日期
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date date=new Date();
				String cmrModiDate=df.format(date);
				certificate.setCetModiDate(cmrModiDate);		
				//添加附件依据
				String fileName = "";
				try {// 原始⽂件名称
					if (upload != null) {
						fileName = upload.getOriginalFilename();
						// 上传图⽚物理路径
						String url = req.getSession().getServletContext()
								.getRealPath("/upload/clientMgrOther");
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
	            certificate.setCetUrl(fileName);
                clientMgrOtherService.addCertificate(certificate);
	            System.out.print("====================添加方法执行===================================");
				return "redirect:getClientMgrOtherList?pageNum=2";
			
		}

		//获得原来的证照信息
		@RequestMapping("/modifyCet")
		public @ResponseBody List<CertificateExt> getCertificate(String cetKey) {
			System.out.println("============cetKey================"+cetKey+"===================");
			Map map=new HashMap();
			map.put("cetKey", cetKey);
			List<CertificateExt> cetList=clientMgrOtherService.getCertificateList(map);
			System.out.println("============cetList============="+cetList.get(0).getCmId()+"=================");
			return cetList;
		}
		
		
		
		//修改证照信息

		@RequestMapping("/modifyCertificate")
		public String modifyCertificate(Certificate certificate,Model model,MultipartFile upload,HttpServletRequest req) {
			System.out.println("cetKey==========="+certificate.getCetKey()+"================");
			String uploadFile_name = "";
			try {// 原始⽂件名称
					if (upload != null) {
						uploadFile_name = upload.getOriginalFilename();

						String url = req.getSession().getServletContext()
								.getRealPath("/upload/clientMgrOther");
						File uploadfile = new java.io.File(url + "/" + uploadFile_name);
						if (!uploadfile.exists()) {
							uploadfile.mkdirs();
						}
						upload.transferTo(uploadfile);
                        certificate.setCetUrl(uploadFile_name);
					}
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				// 1.获取当前时间
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date date=new Date();
				String cetModiDate=df.format(date);
				certificate.setCetModiDate(cetModiDate);
				clientMgrOtherService.modifyCertificate(certificate);
				return "redirect:getClientMgrOtherList?pageNum=2";
			}
		
		//删除证照记录
				@RequestMapping("/deleteCertificate")
				public String deleteCertificate(String cetKeys) {
					System.out.println("=============进入删除方法==================");
					System.out.println("=============cetkeys=================="+cetKeys+"=============");
					String[] s_cetKey=cetKeys.split(",");
					int[] i_cetKey=new int[s_cetKey.length];
					for(int i=0;i<i_cetKey.length;i++) {
						i_cetKey[i]=Integer.parseInt(s_cetKey[i]);
					}
					clientMgrOtherService.deleteCertificate(i_cetKey);
					return "redirect:getClientMgrOtherList?pageNum=2";
					
				}
				
				
				//增加奖惩记录
				@RequestMapping("/addRPR")
				public String addRPR(RPR rpr,MultipartFile upload,HttpServletRequest req, Model model) {
						//维护日期
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String rprModiDate=df.format(date);
					    rpr.setRprModiDate(rprModiDate);
						//添加附件依据
						String fileName = "";
						try {// 原始⽂件名称
							if (upload != null) {
								fileName = upload.getOriginalFilename();
								// 上传图⽚物理路径
								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
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
						rpr.setRprAttachment(fileName);
                        clientMgrOtherService.addRPR(rpr);
						System.out.println("====================添加方法执行===================================");
						return "redirect:getClientMgrOtherList?pageNum=3";
					
				}
				//获得原来的奖惩信息
				@RequestMapping("/modifyOldRPR")
				public @ResponseBody List<RPRExt> modifyOldRPR(String rprKey) {
					System.out.println("============OLD_rprKey================"+rprKey+"===================");
					Map map=new HashMap();
					map.put("rprKey", rprKey);
					List<RPRExt> rprList=clientMgrOtherService.getRPRList(map);
					return rprList;
				}
				
				//修改奖惩记录
				@RequestMapping("/modifyRPR")
				public String modifyRPR(RPR rpr,Model model,MultipartFile upload,HttpServletRequest req) {
					System.out.println("rprKey==========="+rpr.getRprKey()+"================");
					String uploadFile_name = "";
					try {// 原始⽂件名称
							if (upload != null) {
								uploadFile_name = upload.getOriginalFilename();

								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
								File uploadfile = new java.io.File(url + "/" + uploadFile_name);
								if (!uploadfile.exists()) {
									uploadfile.mkdirs();
								}
								upload.transferTo(uploadfile);
                                rpr.setRprAttachment(uploadFile_name);
							}
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						// 1.获取当前时间
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String rprModiDate=df.format(date);
						rpr.setRprModiDate(rprModiDate);
						clientMgrOtherService.modifyRPR(rpr);
						return "redirect:getClientMgrOtherList?pageNum=3";
					}
				//删除证照记录
				@RequestMapping("/deleteRPR")
				public String deleteRPR(String rprKeys) {
					System.out.println("=============进入删除方法==================");
					String[] s_rprKey=rprKeys.split(",");
					int[] i_rprKey=new int[s_rprKey.length];
					for(int i=0;i<i_rprKey.length;i++) {
						i_rprKey[i]=Integer.parseInt(s_rprKey[i]);
					}
					clientMgrOtherService.deleteRPR(i_rprKey);
					return "redirect:getClientMgrOtherList?pageNum=3";
					
				}
				
				
				//添加考核信息
				@RequestMapping("/addAssess")
				public String addAssess(Assess assess,MultipartFile upload,HttpServletRequest req, Model model) {
						//维护日期
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String assModiDate=df.format(date);
					    assess.setAssModiDate(assModiDate);
						//添加附件依据
						String fileName = "";
						try {// 原始⽂件名称
							if (upload != null) {
								fileName = upload.getOriginalFilename();
								// 上传图⽚物理路径
								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
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
						assess.setAssAttachment(fileName);
						clientMgrOtherService.addAssess(assess);
						System.out.println("====================添加方法执行===================================");
						return "redirect:getClientMgrOtherList?pageNum=4";
					
				}
				
				//展示原有的考核信息
				@RequestMapping("/modifyAss")
				public @ResponseBody List<AssessExt> modifyAss(String assKey) {
					System.out.println("============OLD_assKey================"+assKey+"===================");
					Map map=new HashMap();
					map.put("assKey", assKey);
					List<AssessExt> assList=clientMgrOtherService.getASSList(map);
					System.out.println("==================size==="+assList.size()+"====================");
					return assList;
				}
				
				//修改考核记录
				@RequestMapping("/modifyAssess")
				public String modifyAssess(Assess assess,Model model,MultipartFile upload,HttpServletRequest req) {
					System.out.println("assKey==========="+assess.getAssKey()+"================");
					String uploadFile_name = "";
					try {// 原始⽂件名称
							if (upload != null) {
								uploadFile_name = upload.getOriginalFilename();

								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
								File uploadfile = new java.io.File(url + "/" + uploadFile_name);
								if (!uploadfile.exists()) {
									uploadfile.mkdirs();
								}
								upload.transferTo(uploadfile);
                                assess.setAssAttachment(uploadFile_name);
							}
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						// 1.获取当前时间
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String assModiDate=df.format(date);
						assess.setAssModiDate(assModiDate);
						clientMgrOtherService.modifyAssess(assess);
						return "redirect:getClientMgrOtherList?pageNum=4";
					}
				//删除考核记录
				@RequestMapping("/deleteAssess")
				public String deleteAssess(String assKeys) {
					System.out.println("=============进入删除方法==================");
					String[] s_assKey=assKeys.split(",");
					int[] i_assKey=new int[s_assKey.length];
					for(int i=0;i<s_assKey.length;i++) {
						i_assKey[i]=Integer.parseInt(s_assKey[i]);
					}
					clientMgrOtherService.deleteAssess(i_assKey);
					return "redirect:getClientMgrOtherList?pageNum=4";
					
				}
				
				//添加学习培训记录 
				@RequestMapping("/addLTR")
				public String addLTR(LearnTranRecord ltr,MultipartFile upload,HttpServletRequest req, Model model) {
						//维护日期
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String ltrModiDate=df.format(date);
						ltr.setLtrModiDate(ltrModiDate);

						//添加附件依据
						String fileName = "";
						try {// 原始⽂件名称
							if (upload != null) {
								fileName = upload.getOriginalFilename();
								// 上传图⽚物理路径
								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
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
						ltr.setLtrAttachment(fileName);
						clientMgrOtherService.addLTR(ltr);
						System.out.println("====================添加方法执行===================================");
						return "redirect:getClientMgrOtherList?pageNum=5";
					
				}
				
				//展示原有学习培训记录
				@RequestMapping("/modifyLearnTranRecord")
				public @ResponseBody List<LearnTranRecordExt> modifyLTR(String ltrKey) {
					System.out.println("============OLD_ltrKey================"+ltrKey+"===================");
					Map map=new HashMap();
					map.put("ltrKey", ltrKey);
					List<LearnTranRecordExt> ltrList=clientMgrOtherService.getLTRList(map);
					System.out.println("==================size==="+ltrList.size()+"====================");
					return ltrList;
				}
				//修改学习培训记录
				@RequestMapping("/modifyLTR")
				public String modifyLTR(LearnTranRecord learnTranRecord,Model model,MultipartFile upload,HttpServletRequest req) {
					System.out.println("ltrKey==========="+learnTranRecord.getLtrKey()+"================");
					String uploadFile_name = "";
					try {// 原始⽂件名称
							if (upload != null) {
								uploadFile_name = upload.getOriginalFilename();

								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
								File uploadfile = new java.io.File(url + "/" + uploadFile_name);
								if (!uploadfile.exists()) {
									uploadfile.mkdirs();
								}
								upload.transferTo(uploadfile);
								learnTranRecord.setLtrAttachment(uploadFile_name);
							}
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						// 1.获取当前时间
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String ltrModiDate=df.format(date);
						learnTranRecord.setLtrModiDate(ltrModiDate);
						clientMgrOtherService.modifyLTR(learnTranRecord);
						return "redirect:getClientMgrOtherList?pageNum=5";
					}
				//删除学习培训记录
				@RequestMapping("/deleteLTR")
				public String deleteLTR(String ltrKeys) {
					System.out.println("=============进入删除方法==================");
					String[] s_ltrKey=ltrKeys.split(",");
					int[] i_ltrKey=new int[s_ltrKey.length];
					for(int i=0;i<s_ltrKey.length;i++) {
						i_ltrKey[i]=Integer.parseInt(s_ltrKey[i]);
					}
					clientMgrOtherService.deleteLTR(i_ltrKey);
					return "redirect:getClientMgrOtherList?pageNum=5";
					
				}
				
				//添加等级认定记录
				@RequestMapping("/addLevel")
				public String addLevel(Level level,MultipartFile upload,HttpServletRequest req, Model model) {
						//维护日期
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String leModiDate=df.format(date);
						level.setLeModiDate(leModiDate);
						//添加附件依据
						String fileName = "";
						try {// 原始⽂件名称
							if (upload != null) {
								fileName = upload.getOriginalFilename();
								// 上传图⽚物理路径
								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
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
						level.setLeAttachment(fileName);
						clientMgrOtherService.addLevel(level);
			            System.out.print("====================添加方法执行===================================");
						return "redirect:getClientMgrOtherList?pageNum=6";
					
				}

				
				//展示原有学习培训记录
				@RequestMapping("/modifyOldLevel")
				public @ResponseBody List<LevelExt> modifyOldLevel(String leKey) {
					System.out.println("============OLD_leKey================"+leKey+"===================");
					Map map=new HashMap();
					map.put("leKey", leKey);
					List<LevelExt> leList=clientMgrOtherService.getLevelList(map);
					System.out.println("==================size==="+leList.size()+"====================");
					return leList;
				}
				//修改等级认定记录
				@RequestMapping("/modifyLevel")
				public String modifyLevel(Level level,Model model,MultipartFile upload,HttpServletRequest req) {
					System.out.println("=====leKey===="+level.getLeKey()+"=======");
					String uploadFile_name = "";
					try {// 原始⽂件名称
							if (upload != null) {
								uploadFile_name = upload.getOriginalFilename();

								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
								File uploadfile = new java.io.File(url + "/" + uploadFile_name);
								if (!uploadfile.exists()) {
									uploadfile.mkdirs();
								}
								upload.transferTo(uploadfile);
								level.setLeAttachment(uploadFile_name);

							}
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						// 1.获取当前时间
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String leModiDate=df.format(date);
						level.setLeModiDate(leModiDate);
                        clientMgrOtherService.modifyLevel(level);
						return "redirect:getClientMgrOtherList?pageNum=6";
					}

				//删除等级认定记录
				@RequestMapping("/deleteLevel")
				public String deleteLevel(String leKeys) {
					System.out.println("=============进入删除方法==================");
					String[] s_leKey=leKeys.split(",");
					int[] i_leKey=new int[s_leKey.length];
					for(int i=0;i<s_leKey.length;i++) {
						i_leKey[i]=Integer.parseInt(s_leKey[i]);
					}
					clientMgrOtherService.deleteLevel(i_leKey);

					return "redirect:getClientMgrOtherList?pageNum=6";
					
				}
				
				
		     //添加工作记录
				@RequestMapping("/addWork")
				public String addWork(Work work,MultipartFile upload,HttpServletRequest req, Model model) {
						//维护日期
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String workModiDate=df.format(date);
						work.setWorkModiDate(workModiDate);

						//添加附件依据
						String fileName = "";
						try {// 原始⽂件名称
							if (upload != null) {
								fileName = upload.getOriginalFilename();
								// 上传图⽚物理路径
								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
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
						work.setWorkAttachment(fileName);
						clientMgrOtherService.addWork(work);

			            System.out.print("====================添加方法执行===================================");
						return "redirect:getClientMgrOtherList?pageNum=7";
					
				}
				
				//获取原来的工作经历
				@RequestMapping("/modifyOldWork")
				public @ResponseBody List<WorkExt> modifyOldWork(String workKey) {
					System.out.println("============OLD_workKey================"+workKey+"===================");
					Map map=new HashMap();
					map.put("workKey", workKey);
					List<WorkExt> workList=clientMgrOtherService.getWorkList(map);
					System.out.println("==================size==="+workList.size()+"====================");
					return workList;
				}
				
				//修改工作经历
				@RequestMapping("/modifyWork")
				public String modifyWork(Work work,Model model,MultipartFile upload,HttpServletRequest req) {
					System.out.println("=====workKey===="+work.getWorkKey()+"=======");
					String uploadFile_name = "";
					try {// 原始⽂件名称
							if (upload != null) {
								uploadFile_name = upload.getOriginalFilename();

								String url = req.getSession().getServletContext()
										.getRealPath("/upload/clientMgrOther");
								File uploadfile = new java.io.File(url + "/" + uploadFile_name);
								if (!uploadfile.exists()) {
									uploadfile.mkdirs();
								}
								upload.transferTo(uploadfile);
								work.setWorkAttachment(uploadFile_name);

								
							}
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						// 1.获取当前时间
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date date=new Date();
						String workModiDate=df.format(date);
						work.setWorkModiDate(workModiDate);
						clientMgrOtherService.modifyWork(work);
						return "redirect:getClientMgrOtherList?pageNum=7";
					}
				//删除工作经历
				@RequestMapping("/deleteWork")
				public String deleteWork(String workKeys) {
					System.out.println("=============进入删除方法==================");
					String[] s_workKey=workKeys.split(",");
					int[] i_workKey=new int[s_workKey.length];
					for(int i=0;i<s_workKey.length;i++) {
						i_workKey[i]=Integer.parseInt(s_workKey[i]);
					}
					clientMgrOtherService.deleteWork(i_workKey);

					return "redirect:getClientMgrOtherList?pageNum=7";
					
				}
				

}
