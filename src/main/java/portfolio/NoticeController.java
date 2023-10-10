package portfolio;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class NoticeController {
	@Resource(name = "notice")
	private NoticeModule noticeModule;

	@RequestMapping("/noticeConfig")
	public String noticeConfig(@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "search", required = false) String search, Model model) {
		int pageSize = 10; // 페이지당 표시할 게시물 수
		List<NoticeDTO> notices = noticeModule.getNoticesByPage(pageNumber, pageSize, search);
		int totalNotices = noticeModule.countNotices(search);
		int totalPages = (int) Math.ceil((double) totalNotices / pageSize);
		model.addAttribute("notices", notices);
		model.addAttribute("currentPage", pageNumber);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("search", search);
		return "/NoticeMain";
	}

	@RequestMapping("/noticeWritePage")
	public String noticeWritePage() {
		return "/NoticeWrite";
	}

	@RequestMapping("/noticeWrite")
	public String noticeWrite(NoticeDTO nd, @RequestParam(required = false) MultipartFile cfile,
			HttpServletRequest req) {
		FTPClient ftp = new FTPClient();
		String extension = StringUtils.getFilenameExtension(cfile.getOriginalFilename());
		String url = null;
		ftp.setControlEncoding("utf-8");
		String filename = cfile.getOriginalFilename();
		FTPClientConfig cf = new FTPClientConfig();
		UUID uuid = UUID.randomUUID();
		System.out.println(cfile.getSize());
		if (cfile.getSize() == 0) {
			noticeModule.noticeWrite(nd, null, null);
		} else {
			try {
				InetAddress inet = Inet4Address.getLocalHost();
				String ip = inet.getHostAddress();
				String host = "iup.cdn1.cafe24.com";
				String user = "wjswjdgh123";
				String pass = "qlalfqjsgh1@";
				int port = 21;
				ftp.configure(cf);
				ftp.connect(host, port);
				if (ftp.login(user, pass)) {
					ftp.setFileType(FTP.BINARY_FILE_TYPE);
					int rp = ftp.getReplyCode();
					boolean result = ftp.storeFile("/www/img/" + uuid + "." + extension, cfile.getInputStream());
					if (result == true) {
						url = "http://wjswjdgh123.cdn1.cafe24.com/img/" + uuid + "." + extension;

					}
				} else {
					System.out.println("error");
				}
				ftp.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
			noticeModule.noticeWrite(nd, url, filename);
		}

		return "redirect:/noticeConfig";
	}

	@PostMapping("/noticeDelete")
	public void deleteNotice(String noticeNumber) {
		noticeModule.deleteNotice(noticeNumber);
	}

	@GetMapping("/notice/{no}")
	public String noticeView(@PathVariable String no, Model model, NoticeDTO nt) {
		noticeModule.noticeClicked(no);
		nt = noticeModule.selectNoticeByCno(no, nt);
		model.addAttribute("notice", nt);
		return "Notice";
	}

	@GetMapping("/notice/download/{no}")
	public void fileDownload(@PathVariable String no, NoticeDTO nt, HttpServletResponse response) {
		nt = noticeModule.selectNoticeByCno(no, nt);
		String path = nt.getCfiledir();
		System.out.println("path = "+path);
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + nt.getCfilename());
			File file = new File(path);
			System.out.println("filePath = "+file.getPath());
			FileInputStream fileInputStream = new FileInputStream(path);
			OutputStream out = response.getOutputStream();
			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) {
				out.write(buffer, 0, read);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("nt.getCfiledir = "+nt.getCfiledir());
	}
}
