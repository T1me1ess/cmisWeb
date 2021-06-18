package com.inspur.cmis.pojo;

public class Client {
	
	private int ckey;//主键
	private int cmId;//客户经理编号
	private String cSsn;
	private String cName;
	private String cTel;
	private double cSalary;//年收入
	private double cBalance;//资产
	private double cDebt;//负债
	private String cBusiness;//业务关联
	private String  cUnit;//工作单位
	private String  cAdd;//家庭住址
	

	public int getCkey() {
		return ckey;
	}
	public void setCkey(int ckey) {
		this.ckey = ckey;
	}
	public int getCmId() {
		return cmId;
	}
	public void setCmId(int cmId) {
		this.cmId = cmId;
	}
	public String getcSsn() {
		return cSsn;
	}
	public void setcSsn(String cSsn) {
		this.cSsn = cSsn;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcTel() {
		return cTel;
	}
	public void setcTel(String cTel) {
		this.cTel = cTel;
	}
	public double getcSalary() {
		return cSalary;
	}
	public void setcSalary(double cSalary) {
		this.cSalary = cSalary;
	}
	public double getcBalance() {
		return cBalance;
	}
	public void setcBalance(double cBalance) {
		this.cBalance = cBalance;
	}
	public double getcDebt() {
		return cDebt;
	}
	public void setcDebt(double cDebt) {
		this.cDebt = cDebt;
	}
	public String getcBusiness() {
		return cBusiness;
	}
	public void setcBusiness(String cBusiness) {
		this.cBusiness = cBusiness;
	}
	public String getcUnit() {
		return cUnit;
	}
	public void setcUnit(String cUnit) {
		this.cUnit = cUnit;
	}
	public String getcAdd() {
		return cAdd;
	}
	public void setcAdd(String cAdd) {
		this.cAdd = cAdd;
	}
	
	
	

}
