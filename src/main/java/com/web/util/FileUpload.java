package com.web.util;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class FileUpload {

	
	public static String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		Date date=new Date();
		
		String str=sdf.format(date);
		
		return str.replace("-", File.separator);
		
	}
	
	public static String getFileName(MultipartFile imageFile) {
		String realName=imageFile.getOriginalFilename();
		realName=realName.substring(realName.lastIndexOf("\\")+1);
		return realName;
	}
	
	public static String uploadPost(MultipartFile imageFile,String uploadFolder,HttpServletRequest request) {
		
		
		/********make Folder**********/
		ServletContext context = request.getServletContext();
		uploadFolder=context.getRealPath(uploadFolder);  
		
		/* File uploadPath=new File(uploadFolder,getFolder()); */
		File uploadPath=new File(uploadFolder);
//		log.info("upload path"+uploadPath);
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		/******************/
//		log.info("upload File Name:"+imageFile.getOriginalFilename());
		
		String uploadFileName=null;
		uploadFileName=imageFile.getOriginalFilename();
		
		//오직파일네임만 
		uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		
		
//		log.info("실제파일이름만:"+uploadFileName);
		
		UUID uuid=UUID.randomUUID();
		
		if(!uploadFileName.equals("") && uploadFileName!=null) {
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
//			log.info("실제파일이름만:"+uploadFileName);
				
				try {
					
					File saveFile=new File(uploadPath,uploadFileName);
					imageFile.transferTo(saveFile);
					
					FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					
					Thumbnailator.createThumbnail(imageFile.getInputStream(),thumbnail,500,700);
					
					thumbnail.close();
					
					
				}catch(Exception e){
					e.printStackTrace();
				}
					
			return uploadFileName;
		}else {
		
			return uploadFileName;
		}
	}
}
