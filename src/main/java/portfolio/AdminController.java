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
	private AdminDTO ad = new AdminDTO();
	@Autowired 
	BasicDataSource datasource;
	@Inject 
	private SqlSessionFactory sqlsessionfactory;
	@Resource 
	private SqlSessionTemplate sqlsession;
	@Autowired 
	private BCryptPasswordEncoder bp;
	
	@PostMapping("/adminMain")
	public String adminLogin(@RequestParam String login_id, @RequestParam String login_pass,AdminDTO ad) {
		SqlSession se = sqlsessionfactory.openSession();
		ad = se.selectOne("pfDB.login",login_id);
		String pw = ad.getApw();
		if(bp.matches(login_pass, pw)) {
			System.out.println("good");
		}else {
			System.out.println("hmm");
		}
		return null;
	}
	@PostMapping("/adminSubmit")
	public String adminSubmmit(@ModelAttribute("admin") AdminDTO ad,@RequestParam String apw) throws Exception{
		SqlSession se = sqlsessionfactory.openSession();
		String pw = bp.encode(apw);
		ad.setApw(pw);
		int a = se.insert("pfDB.adminInsert", ad);
		if (a > 0) {
			System.out.println("성공");
		} else {
			System.out.println("error");
		}
		return null;
	}
}
