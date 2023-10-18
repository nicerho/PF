package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String memberLogin(@RequestParam String loginId, @RequestParam String loginPw, Model model,
			HttpServletRequest req) {
		Map<String, Object> map = memberModule.login(loginId, loginPw);
		if (map.containsKey("loginMember") == true) {
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(600);
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

	@GetMapping("/reserve")
	public String reservePage(String mid,ReserveDTO rd,Model model) {
		rd = memberModule.reserveCheck(rd, mid);
		model.addAttribute("reserve",rd);
		return "/mp/reservationIn";
	}

	@PostMapping("/reserves")
	public String reserve(ReserveDTO rd) {
		memberModule.insertReserve(rd);
		return "redirect:mainpage";
	}

	@RequestMapping("/reserveResult")
	public String reserveResult(ReserveDTO rd, Model model,String mid) {
		rd = memberModule.reserveCheck(rd, mid);
		model.addAttribute("reserve",rd);
		return "/mp/reserveCk";
	}

	@GetMapping("/reserveCheck")
	public void reserveCheck(ReserveDTO rd, String mid, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();		
		rd = memberModule.reserveCheck(rd, mid);
		if (rd == null) {
			pw.write("<script>alert('에약확인은 사전방문예약을 한 고객에 한해서만 가능합니다');location.href='./mainpage'</script>");
		} else {
			pw.write("<script>location.href='./reserveResult?mid="+mid+"'</script>");
		}
		pw.flush();
		pw.close();
	}
	@PostMapping("/changeReserve")
	public void changeReserve(ReserveDTO rd, String mid, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();		
	}
}
