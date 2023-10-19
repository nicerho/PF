package portfolio;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class AdminController {

	@Resource(name = "adminsubmit")
	private AdminModule adminModule;
	@Resource(name = "member")
	private MemberModule memberModule;

	@GetMapping("/index")
	public String adminIndex(@SessionAttribute(name = "loginAdmin", required = false) AdminDTO ad) {
		
		if (ad != null) {
			return "redirect:adminMain";
		}
		
		return "index";
	}
	@RequestMapping("/adminMain")
	public String adminMain(Model model) {
		List<MemberDTO> memberList = adminModule.getMemberByDate();
		List<ReserveDTO> reserveList = memberModule.getReserveLimit();
		model.addAttribute("members",memberList);
		model.addAttribute("reserve",reserveList);
		
		return "admin_main";
	}
	@RequestMapping("/adminLogin")
	public String adminLogin(@RequestParam String login_id, @RequestParam String login_pass, Model model,
			HttpServletRequest req) {
		Map<String, Object> map = adminModule.adminLogin(login_id, login_pass);
		if (map.containsKey("loginMember") == true) {
			HttpSession session = req.getSession();
			session.setAttribute("loginAdmin", map.get("loginMember"));
			model.addAttribute("loginAdmin", map.get("loginMember"));
		}
		model.addAttribute("result", map);
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

	@GetMapping("/adminMember")
	public String memberPage(Model model, @RequestParam(name = "pageNumber", defaultValue = "1") int pageNumber,
			String search, String searchpart) {
		int pageSize = 20;
		int totalCount = adminModule.countMember(searchpart, search);
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		List<MemberDTO> list = adminModule.getMemberByPage(pageNumber, pageSize, searchpart, search);
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = simpleDateFormat.format(nowDate);
		model.addAttribute("date", date);
		model.addAttribute("memberList", list);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("selected", searchpart);
		return "/adminMember";
	}

	@PostMapping("/deleteMember")
	public void deleteMember(String memberNumber) {
		adminModule.deleteMember(memberNumber);
	}

	@RequestMapping("/addDummys")
	public void addDummy(MemberDTO md) {
		memberModule.addDummy(md);
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/index";
	}
	@RequestMapping("/reserveCheck")
	public String reserveCheck(Model model, AdminDTO ad, @RequestParam(required = false) String adep,
			@RequestParam(name = "pageNumber", defaultValue = "1") int pageNumber, String search, String searchpart) {
		int pageSize = 30;
		int totalCount = memberModule.countReserve(searchpart, search);
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		List<ReserveDTO> list = memberModule.getReserveByPage(pageNumber, pageSize, searchpart, search);
		model.addAttribute("reserveList", list);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("selected", searchpart);
		return "reserveCheck";
	}

}
