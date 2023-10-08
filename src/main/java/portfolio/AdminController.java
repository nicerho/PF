package portfolio;

import java.util.List;

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
	public String adminLogin(@RequestParam String login_id, @RequestParam String login_pass, AdminDTO ad) {
		adminModule.adminLogin(login_id, login_pass, ad);
		return "/admin_main";
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

	@RequestMapping("/config")
	public String configPage(Model model, AdminDTO ad, @RequestParam(required = false) String depSelect) {
		List<AdminDTO> list = null;
		if (depSelect == null || depSelect == "") {
			list = adminModule.selectAll();
			model.addAttribute("adminList", list);
			model.addAttribute("dep", "");
		} else {
			list = adminModule.selectByDep(depSelect);
			if (list.isEmpty() != true) {
				model.addAttribute("adminList", list);
				model.addAttribute("dep", depSelect);
			} else {
				model.addAttribute("dep", depSelect);
			}
		}
		return "/config_main";
	}

	@RequestMapping("/adminSearch")
	public String configSearch(Model model, String searchPart, String search_part) {
		List<AdminDTO> list = null;
		if (search_part.equals("이름")) {
			list = adminModule.selectByName(searchPart);
			model.addAttribute("adminList", list);
			model.addAttribute("selected", search_part);
		} else if (search_part.equals("아이디")) {
			list = adminModule.selectById(searchPart);
			model.addAttribute("adminList", list);
			model.addAttribute("selected", search_part);
		} else if (search_part.equals("연락처")) {
			list = adminModule.selectByTel(searchPart);
			model.addAttribute("adminList", list);
			model.addAttribute("selected", search_part);
		}
		return "/config_main";
	}
	@PostMapping("/adminConfigChange")
	public void configChange(String adminNumber,String adminUse) {
		
	}
}
