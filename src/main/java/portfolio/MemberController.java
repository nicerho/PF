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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mp")
public class MemberController {
	@Resource(name = "member")
	private MemberModule memberModule;

	@PostMapping("memberIdCheck")
	public String memberIdCheck(@RequestParam(required = false) String mid, MemberDTO md, Model model) {
		md = memberModule.memberIdCheck(mid);
		try {
			if (md == null) {
				model.addAttribute("mid", "no");
			} else {
				model.addAttribute("mid", "yes");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("mid", "error");
		}
		return "/mp/idCheckResult";
	}

	@PostMapping("/memberSubmit")
	public String adminSubmmit(@ModelAttribute("member") MemberDTO md, @RequestParam String mpw) {
		memberModule.memberSubmit(mpw, md);
		return "redirect:mainpage";
	}

	@RequestMapping("/mainpage")
	public String index(Model model) {
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = simpleDateFormat.format(nowDate);
		List<InfoDTO> info = memberModule.indexInfo();
		model.addAttribute("info", info);
		model.addAttribute("date", date);
		return "/mp/index";
	}

	@PostMapping("/memberLogin")
	public String memberLogin(@RequestParam String loginId, @RequestParam String loginPw, Model model,HttpServletRequest req) {
		Map<String, Object> map = memberModule.login(loginId, loginPw);
		if (map.containsKey("loginMember") == true) {
			HttpSession session = req.getSession();
			session.setAttribute("loginMember", map.get("loginMember"));
			model.addAttribute("loginMember", map.get("loginMember"));
		}
		model.addAttribute("map", map);
		return "/mp/loginResult";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:mainpage";
	}
}
