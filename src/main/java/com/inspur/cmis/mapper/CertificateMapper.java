
package com.inspur.cmis.mapper;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.Certificate;
import com.inspur.cmis.pojo.CertificateExt;


public interface CertificateMapper {
	
	public List<CertificateExt> getCertificateList(Map map);
	public void addCertificate(Certificate certificate);
	public void modifyCertificate(Certificate certificate);
	public void deleteCertificate(int[] cetKey);
	

}
