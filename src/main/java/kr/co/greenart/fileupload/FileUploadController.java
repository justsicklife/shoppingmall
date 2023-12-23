package kr.co.greenart.fileupload;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.greenart.common.FileUpload;

@Controller
public class FileUploadController {
	
	@PostMapping("/fileUpload")
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request)
			throws IOException {

		MultipartFile imgfile = multipartRequest.getFile("Filedata"); // write.jsp 부분에서 input file의 name 입니다.

		System.out.println(imgfile);
		
		Calendar cal = Calendar.getInstance();

		String fileName = imgfile.getOriginalFilename();

		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());

		String replaceName = cal.getTimeInMillis() + fileType;

		String path = request.getSession().getServletContext().getRealPath("/") + File.separator + "resources/upload"; // 파일이
		
		System.out.println("img : " +imgfile);
		System.out.println("path : " + path);
		System.out.println("replaceName : " + replaceName);
		

		FileUpload.fileUpload(imgfile, path, replaceName);

		model.addAttribute("path", path); // 파일업로드를 하는 창에 경로와

		model.addAttribute("filename", replaceName); // 저장된 이름을 전달합니다.​

		return "/common/file_upload";

	}
}
