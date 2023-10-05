package portfolio;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository("adminsubmit")
public class AdminModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate sqlsession;
	@Autowired
	private BCryptPasswordEncoder bp;

	public int adminSubmit(String apw, AdminDTO ad) {
		String pw = bp.encode(apw);
		ad.setApw(pw);
		int a = sqlsession.insert("pfDB.adminInsert", ad);
		if (a > 0) {
			System.out.println("성공");
		} else {
			System.out.println("error");
		}
		return a;
	}

	public AdminDTO adminLogin(String login_id, String login_pass, AdminDTO ad) {
		ad = sqlsession.selectOne("pfDB.login", login_id);
		String pw = ad.getApw();
		if (bp.matches(login_pass, pw)) {
			System.out.println("good");
		} else {
			System.out.println("hmm");
		}
		return ad;
	}

	public String idCheck(String aid) {
		AdminDTO ad = null;
		try {
			ad = sqlsession.selectOne("pfDB.login", aid);
		} catch (Exception e) {
			if(ad.getAid()==null) {
				return "Y";
			}
		}
		return "N";
	}
}
