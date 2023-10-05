package portfolio;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@Resource(name = "adminsubmit")
	private AdminModule adminModule;

	@PostMapping("/adminMain")
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
	public String idCheck(@RequestParam(required=false) String aid,AdminDTO ad) {
		System.out.println(aid);
		String idck = adminModule.idCheck(aid,ad);
		return idck;
	}
}
