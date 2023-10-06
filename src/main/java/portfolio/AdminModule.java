package portfolio;

import java.util.ArrayList;
import java.util.List;

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

	public AdminDTO idCheck(String aid) {
		AdminDTO ad = sqlsession.selectOne("pfDB.login", aid);
		return ad;
	}
	public List<AdminDTO> findAdminByDep(String dep){
		List<AdminDTO> list = new ArrayList<>();
		list = sqlsession.selectList("pfDB.findAdminByDep",dep);
		return list;
	}
	public List<AdminDTO> selectAll(){
		List<AdminDTO> list = sqlsession.selectList("pfDB.selectAll");
		return list;
	}
	public List<AdminDTO> selectByDep(String depSelect){
		List<AdminDTO> list = sqlsession.selectList("pfDB.findAdminByDep",depSelect);
		return list;
	}
	public List<AdminDTO> selectByName(String search_part2){
		List<AdminDTO> list = sqlsession.selectList("pfDB.selectByName",search_part2);
		return list;
	}
	
}
