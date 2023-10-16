package portfolio;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
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
		return "";
	}
}
