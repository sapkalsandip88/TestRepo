package com.example.demo.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.example.demo.model.BookingMaster;
import com.example.demo.model.TestDetails;
import com.fasterxml.jackson.databind.deser.Deserializers.Base;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.collection.PdfCollectionField;
import com.itextpdf.text.pdf.collection.PdfTargetDictionary;

@Service
public class PdfGenerateService {
	
	public boolean createInvoice(BookingMaster bookingmaster, Set<TestDetails> tdet, ServletContext context, HttpServletRequest req, HttpServletResponse resp)
	{
		System.out.println("*******PdfGenerateService******");
		Document document =new Document(PageSize.A4, 15, 15, 45, 30);
		try {
			
			String filePath=context.getRealPath("/resources/");
			File file=new File(filePath);
			System.out.println(""+filePath);
			boolean exists=new File(filePath).exists();
			if(!exists)
			{
				new File(filePath).mkdirs();
			}
			System.out.println(exists);
			PdfWriter writer =PdfWriter.getInstance(document, new FileOutputStream(file+"/Invoice_"+bookingmaster.getBookingno()+".pdf"));
			document.open();
			Font mainFont=FontFactory.getFont("Arial",10,BaseColor.BLACK);
			Font mainFontTitle=FontFactory.getFont("Arial",14,BaseColor.BLACK);
			
			PdfPTable tableT=new PdfPTable(3);
			tableT.setWidthPercentage(100);
			tableT.setSpacingBefore(10f);
			tableT.setSpacingAfter(10f);
		
			
			
			float[] columWidthT= {2f,3f,2f};
			tableT.setWidths(columWidthT);
			Image img;
			
				img= Image.getInstance("C:\\Users\\sapka\\eclipse-workspace\\Ecommerce\\src\\main\\webapp\\images\\dgenvoy.png");
				img.scaleAbsolute(50f, 50f);
				PdfPCell imgcell=new PdfPCell(img);
				imgcell.setBorderColor(BaseColor.WHITE);
				imgcell.setPaddingLeft(10);
				imgcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				imgcell.setVerticalAlignment(Element.ALIGN_CENTER);
				imgcell.setBackgroundColor(BaseColor.WHITE);
				imgcell.setExtraParagraphSpace(5f);
				tableT.addCell(imgcell);
			
				PdfPCell companyname=new PdfPCell(new Paragraph("Avani Pathalogy Lab"
					+ "\n1803/A, Business Complex,"
					+ "\n Pune,400012"
					+ "\n +91 9082063964, \n www.avnipathalogy.com", mainFont));
				companyname.setBorderColor(BaseColor.WHITE);
				companyname.setPaddingLeft(10);
				companyname.setHorizontalAlignment(Element.ALIGN_CENTER);
				companyname.setVerticalAlignment(Element.ALIGN_CENTER);
				companyname.setBackgroundColor(BaseColor.WHITE);
				companyname.setExtraParagraphSpace(5f);
				tableT.addCell(companyname);
			
				PdfPCell inv=new PdfPCell(new Paragraph("Date:" +bookingmaster.getBookedat()
					+ "\nInvoice No:"+bookingmaster.getBookingno(), mainFont));
				inv.setBorderColor(BaseColor.WHITE);
				inv.setPaddingLeft(10);
				inv.setHorizontalAlignment(Element.ALIGN_LEFT);
				inv.setVerticalAlignment(Element.ALIGN_BOTTOM);
				inv.setBackgroundColor(BaseColor.WHITE);
				inv.setExtraParagraphSpace(5f);
				tableT.addCell(inv);
			
			document.add(tableT);
			 document.add( Chunk.NEWLINE );
			
			 Paragraph paragraph=new Paragraph("Bill To : "+bookingmaster.getFname(), mainFont);
				paragraph.setAlignment(Element.ALIGN_LEFT);
				paragraph.setIndentationLeft(50);
				paragraph.setIndentationRight(50);
				paragraph.setSpacingAfter(10);
				document.add(paragraph);
				
				paragraph=new Paragraph("Address : "+bookingmaster.getHousestreet()+","+bookingmaster.getLandmark()+",\n"+bookingmaster.getTowncity()+","+bookingmaster.getPincode(), mainFont);
				paragraph.setAlignment(Element.ALIGN_LEFT);
				paragraph.setIndentationLeft(50);
				paragraph.setIndentationRight(50);
				paragraph.setSpacingAfter(10);
				document.add(paragraph);
				
			 paragraph=new Paragraph("Test Details", mainFont);
			paragraph.setAlignment(Element.ALIGN_CENTER);
			paragraph.setIndentationLeft(50);
			paragraph.setIndentationRight(50);
			paragraph.setSpacingAfter(10);
			document.add(paragraph);
			
			PdfPTable table=new PdfPTable(3);
			table.setWidthPercentage(100);
			table.setSpacingBefore(10f);
			table.setSpacingAfter(10f);
			
		
			Font tableHeader=FontFactory.getFont("Arial",10,BaseColor.BLACK);
			Font tablebody=FontFactory.getFont("Arial",8,BaseColor.BLACK);
			
			float[] columWidth= {1f,3f,2f};
			table.setWidths(columWidth);
			
			
			PdfPCell srno=new PdfPCell(new Paragraph("Sr No",tableHeader));
			srno.setBorderColor(BaseColor.BLACK);
			srno.setPaddingLeft(10);
			srno.setHorizontalAlignment(Element.ALIGN_CENTER);
			srno.setVerticalAlignment(Element.ALIGN_CENTER);
			srno.setBackgroundColor(BaseColor.GRAY);
			srno.setExtraParagraphSpace(5f);
			table.addCell(srno);

			PdfPCell testname=new PdfPCell(new Paragraph("Test Name",tableHeader));
			testname.setBorderColor(BaseColor.BLACK);
			testname.setPaddingLeft(10);
			testname.setHorizontalAlignment(Element.ALIGN_CENTER);
			testname.setVerticalAlignment(Element.ALIGN_CENTER);
			testname.setBackgroundColor(BaseColor.GRAY);
			testname.setExtraParagraphSpace(5f);
			table.addCell(testname);
			
			PdfPCell price=new PdfPCell(new Paragraph("Price",tableHeader));
			price.setBorderColor(BaseColor.BLACK);
			price.setPaddingLeft(10);
			price.setHorizontalAlignment(Element.ALIGN_CENTER);
			price.setVerticalAlignment(Element.ALIGN_CENTER);
			price.setBackgroundColor(BaseColor.GRAY);
			price.setExtraParagraphSpace(5f);
			table.addCell(price);
			int sr_no=0;
			System.out.println(sr_no);
			for(TestDetails testdetails:tdet)
			{
				System.out.println(sr_no+"=="+testdetails.getTestanme());
				sr_no++;
				PdfPCell srnovalue=new PdfPCell(new Paragraph(""+sr_no,tablebody));
				srnovalue.setBorderColor(BaseColor.BLACK);
				srnovalue.setPaddingLeft(10);
				srnovalue.setHorizontalAlignment(Element.ALIGN_CENTER);
				srnovalue.setVerticalAlignment(Element.ALIGN_CENTER);
				srnovalue.setBackgroundColor(BaseColor.WHITE);
				srnovalue.setExtraParagraphSpace(5f);
				table.addCell(srnovalue);
				
				PdfPCell testnamevalue=new PdfPCell(new Paragraph(""+testdetails.getTestanme(),tablebody));
				testnamevalue.setBorderColor(BaseColor.BLACK);
				testnamevalue.setPaddingLeft(10);
				testnamevalue.setHorizontalAlignment(Element.ALIGN_CENTER);
				testnamevalue.setVerticalAlignment(Element.ALIGN_CENTER);
				testnamevalue.setBackgroundColor(BaseColor.WHITE);
				testnamevalue.setExtraParagraphSpace(5f);
				table.addCell(testnamevalue);
				
				PdfPCell pricevalue=new PdfPCell(new Paragraph(""+testdetails.getPrice(),tablebody));
				pricevalue.setBorderColor(BaseColor.BLACK);
				pricevalue.setPaddingLeft(10);
				pricevalue.setHorizontalAlignment(Element.ALIGN_CENTER);
				pricevalue.setVerticalAlignment(Element.ALIGN_CENTER);
				pricevalue.setBackgroundColor(BaseColor.WHITE);
				pricevalue.setExtraParagraphSpace(5f);
				table.addCell(pricevalue);
				
			}
			PdfPCell srnovalue=new PdfPCell(new Paragraph("",tablebody));
			srnovalue.setBorderColor(BaseColor.BLACK);
			srnovalue.setPaddingLeft(10);
			srnovalue.setHorizontalAlignment(Element.ALIGN_CENTER);
			srnovalue.setVerticalAlignment(Element.ALIGN_CENTER);
			srnovalue.setBackgroundColor(BaseColor.WHITE);
			srnovalue.setExtraParagraphSpace(5f);
			table.addCell(srnovalue);
			
			PdfPCell testnamevalue=new PdfPCell(new Paragraph("Total Amout",tablebody));
			testnamevalue.setBorderColor(BaseColor.BLACK);
			testnamevalue.setPaddingLeft(10);
			testnamevalue.setHorizontalAlignment(Element.ALIGN_CENTER);
			testnamevalue.setVerticalAlignment(Element.ALIGN_CENTER);
			testnamevalue.setBackgroundColor(BaseColor.GRAY);
			testnamevalue.setExtraParagraphSpace(5f);
			table.addCell(testnamevalue);
			
			PdfPCell pricevalue=new PdfPCell(new Paragraph(""+bookingmaster.getTotalamount(),tablebody));
			pricevalue.setBorderColor(BaseColor.BLACK);
			pricevalue.setPaddingLeft(10);
			pricevalue.setHorizontalAlignment(Element.ALIGN_CENTER);
			pricevalue.setVerticalAlignment(Element.ALIGN_CENTER);
			pricevalue.setBackgroundColor(BaseColor.WHITE);
			pricevalue.setExtraParagraphSpace(5f);
			table.addCell(pricevalue);
		
			document.add(table);
			document.close();
			writer.close();
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}

	private PdfPCell PdfPCell(Paragraph paragraph) {
		// TODO Auto-generated method stub
		return null;
	}

}
