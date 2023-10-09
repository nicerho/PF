package portfolio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int page() {
		int x = sqlsession.selectOne("pfDB.adminCount");

		return x;
	}

	public AdminDTO idCheck(String aid) {
		AdminDTO ad = sqlsession.selectOne("pfDB.login", aid);

		return ad;
	}

	public List<AdminDTO> findAdminByDep(String dep) {
		List<AdminDTO> list = new ArrayList<>();
		list = sqlsession.selectList("pfDB.findAdminByDep", dep);

		return list;
	}

	public List<AdminDTO> selectAll() {
		List<AdminDTO> list = sqlsession.selectList("pfDB.selectAll");

		return list;
	}

	public List<AdminDTO> selectByDep(String depSelect) {
		List<AdminDTO> list = sqlsession.selectList("pfDB.findAdminByDep", depSelect);

		return list;
	}

	public List<AdminDTO> selectByName(String searchPart) {
		List<AdminDTO> list = sqlsession.selectList("pfDB.selectByname", searchPart);

		return list;
	}

	public List<AdminDTO> selectByTel(String searchPart) {
		List<AdminDTO> list = sqlsession.selectList("pfDB.selectByTel", searchPart);

		return list;
	}

	public List<AdminDTO> selectById(String searchPart) {
		List<AdminDTO> list = sqlsession.selectList("pfDB.selectById", searchPart);

		return list;
	}

	public void changeAdminConfigToY(String adminNumber) {
		sqlsession.update("pfDB.changeAdminConfigToY", adminNumber);

	}

	public void changeAdminConfigToN(String adminNumber) {
		sqlsession.update("pfDB.changeAdminConfigToN", adminNumber);
	}

	public List<AdminDTO> getUsersByPage(int pageNumber, int pageSize) {
		int start = (pageNumber - 1) * pageSize;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlsession.selectList("pfDB.countAdmin", params);
	}

	public int getTotalRecordCount() {
		return sqlsession.selectOne("pfDB.countAdmins");
	}
}
