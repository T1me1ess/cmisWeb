package com.inspur.cmis.pojo;

public class MarketRecordExt {
	private String cName;
	private String mrManagrment;//客户生产经验情况
	private String mrDemend;//客户需求
	private String mrReport;//客户拜访报告表
	private String mrTes;//客户推荐表
	private String mrEvalue;//客户综合评价
	private String mrDate;
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getMrManagrment() {
		return mrManagrment;
	}
	public void setMrManagrment(String mrManagrment) {
		this.mrManagrment = mrManagrment;
	}
	public String getMrDemend() {
		return mrDemend;
	}
	public void setMrDemend(String mrDemend) {
		this.mrDemend = mrDemend;
	}
	public String getMrReport() {
		return mrReport;
	}
	public void setMrReport(String mrReport) {
		this.mrReport = mrReport;
	}
	public String getMrTes() {
		return mrTes;
	}
	public void setMrTes(String mrTes) {
		this.mrTes = mrTes;
	}
	public String getMrEvalue() {
		return mrEvalue;
	}
	public void setMrEvalue(String mrEvalue) {
		this.mrEvalue = mrEvalue;
	}
	public String getMrDate() {
		return mrDate;
	}
	@Override
	public String toString() {
		return "MarketRecordExt [cName=" + cName + ", mrManagrment=" + mrManagrment + ", mrDemend=" + mrDemend
				+ ", mrReport=" + mrReport + ", mrTes=" + mrTes + ", mrEvalue=" + mrEvalue + ", mrDate=" + mrDate + "]";
	}
	public void setMrDate(String mrDate) {
		this.mrDate = mrDate;
	}
}
