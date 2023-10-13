package portfolio;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	@Resource(name = "adminsubmit")
	private AdminModule adminModule;

	@RequestMapping("/adminMain")
	public String adminLogin(@RequestParam String login_id, @RequestParam String login_pass,  Model model) {
		Map<String,String> map = adminModule.adminLogin(login_id, login_pass);
		if(map.containsKey("loginId")==true) {
			
		}
		model.addAttribute("result",map);
		return "/AdminLogin";
	}

	@PostMapping("/adminSubmit")
	public String adminSubmmit(@ModelAttribute("admin") AdminDTO ad, @RequestParam String apw) {
		adminModule.adminSubmit(apw, ad);
		return "/index";
	}

	@PostMapping("/idCheck")
	public String idCheck(@RequestParam(required = false) String aid, AdminDTO ad, Model model) {
		ad = adminModule.idCheck(aid);
		try {
			if (ad == null) {
				model.addAttribute("mid", "no");
			} else {
				model.addAttribute("mid", "yes");
			}
		} catch (Exception e) {
			System.out.println("Module 접속 오류!");
			model.addAttribute("mid", "error");
		}
		return "/IdCheck";
	}

//	@RequestMapping("/config")
//	public String configPage(Model model, AdminDTO ad, @RequestParam(required = false) String depSelect,
//			@RequestParam(name = "pageNumber", defaultValue = "1") int pageNumber) {
//		List<AdminDTO> list = null;
//		int pageSize = 10; // 페이지 크기를 원하는 값으로 설정
//		list = adminModule.getUsersByPage(pageNumber, pageSize);
//		int totalCount = adminModule.getTotalRecordCount(); // 전체 레코드 수 조회
//		int totalPages = (totalCount + pageSize - 1) / pageSize;
//
//		if (depSelect == null || depSelect == "") {
//			list = adminModule.selectAll();
//			model.addAttribute("adminList", list);
//			model.addAttribute("dep", "");
//		} else {
//			list = adminModule.selectByDep(depSelect);
//			if (list.isEmpty() != true) {
//				model.addAttribute("adminList", list);
//				model.addAttribute("dep", depSelect);
//			} else {
//				model.addAttribute("dep", depSelect);
//			}
//		}
//		model.addAttribute("adminList", list);
//		model.addAttribute("pageNumber", pageNumber);
//		model.addAttribute("pageSize", pageSize);
//		model.addAttribute("totalCount", totalCount);
//		model.addAttribute("totalPages", totalPages);
//
//		return "/config_main";
//	}
	@RequestMapping("/config")
	public String configPage(Model model, AdminDTO ad, @RequestParam(required = false) String adep,
			@RequestParam(name = "pageNumber", defaultValue = "1") int pageNumber, String search, String searchpart) {
		List<AdminDTO> list = null;
		int pageSize = 10; // 페이지 크기를 원하는 값으로 설정
		list = adminModule.getAdminByPage(pageNumber, pageSize, searchpart, adep, search);
		int totalCount = adminModule.countAdmin(searchpart, adep, search); // 전체 레코드 수 조회
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = simpleDateFormat.format(nowDate);
		model.addAttribute("dep", adep);
		model.addAttribute("adminList", list);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("selected", searchpart);
		model.addAttribute("date", date);

		return "/config_main";
	}

	@PostMapping("/adminConfigChange")
	public void configChange(String adminNumber, String adminUse) {
		if (adminUse.equals("근무중")) {
			adminModule.changeAdminConfigToY(adminNumber);
		} else if (adminUse.equals("퇴직중")) {
			adminModule.changeAdminConfigToN(adminNumber);
		}
	}

}
