package com.cherry.login.repository;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cherry.login.domain.MasterDto;


public class ExcelDownloadView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> ModelMap, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("--------------- ExcelDownloadView.buildExcelDocument() ----------------");

		String userAgent = request.getHeader("User-Agent");
		String fileName = "test.xls";

		if (userAgent.indexOf("MSIE") > -1) {
			fileName = URLEncoder.encode(fileName, "utf-8");
		} else {
			fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
		}

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		List<MasterDto> yamanList = (List<MasterDto>) ModelMap.get("yamanList");
		HSSFSheet worksheet = workbook.createSheet();
		HSSFRow row = null;

		row = worksheet.createRow(0);
		row.createCell(0).setCellValue("야만번호");
		row.createCell(1).setCellValue("야만이메일");
		row.createCell(2).setCellValue("야만퇴출");
		row.createCell(3).setCellValue("야만이름");
		row.createCell(4).setCellValue("야만가입날짜");

		for (int i = 1; i < yamanList.size() + 1; i++) {
			row = worksheet.createRow(i);
			row.createCell(0).setCellValue(yamanList.get(i - 1).getYaman_id());
			row.createCell(1).setCellValue(yamanList.get(i - 1).getYemail());
			row.createCell(2).setCellValue(yamanList.get(i - 1).getYexit());
			row.createCell(3).setCellValue(yamanList.get(i - 1).getYname());
			row.createCell(4).setCellValue(yamanList.get(i - 1).getYreg());

		}
		System.out.println(yamanList);
	}
}