package com.cherry.promise.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cherry.promise.domain.PromiseDto;

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

		List<PromiseDto> promiselist = (List<PromiseDto>) ModelMap.get("promiselist");
		HSSFSheet worksheet = workbook.createSheet();
		HSSFRow row = null;

		row = worksheet.createRow(0);
		row.createCell(0).setCellValue("약속번호");
		row.createCell(1).setCellValue("약속이름");
		row.createCell(2).setCellValue("약속날짜");
		row.createCell(3).setCellValue("약속시작시간");
		row.createCell(4).setCellValue("약속종료시간");
		row.createCell(5).setCellValue("약속장소");
		row.createCell(6).setCellValue("약속이행여부");
		// row.createCell(7).setCellValue("약속삭제여부");

		for (int i = 1; i < promiselist.size() + 1; i++) {
			row = worksheet.createRow(i);
			// row.createCell(0).setCellValue(promiselist.get(i -
			// 1).getYpromise_id());
			row.createCell(0).setCellValue(i);
			row.createCell(1).setCellValue(promiselist.get(i - 1).getYproname());
			row.createCell(2).setCellValue(promiselist.get(i - 1).getYprodate());
			row.createCell(3).setCellValue(promiselist.get(i - 1).getYprostart());
			row.createCell(4).setCellValue(promiselist.get(i - 1).getYproend());
			row.createCell(5).setCellValue(promiselist.get(i - 1).getYproloc());
			row.createCell(6).setCellValue(promiselist.get(i - 1).getYprodone());
			// row.createCell(7).setCellValue(promiselist.get(i -
			// 1).getYprodel());

		}
	}
}
