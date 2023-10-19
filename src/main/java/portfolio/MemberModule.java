package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository("member")
public class MemberModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate sqlsession;
	@Autowired
	private BCryptPasswordEncoder bp;

	public MemberDTO memberIdCheck(String mid) {
		return sqlsession.selectOne("pfDB.memberCheck", mid);
	}

	public int memberSubmit(String mpw, MemberDTO md) {
		md.setMpw(bp.encode(mpw));
		int a = 2;
		try {
			a = sqlsession.insert("pfDB.memberSubmit", md);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	public List<InfoDTO> indexInfo() {
		return sqlsession.selectList("pfDB.selectAllInfo");
	}

	public Map<String, Object> login(String loginId, String loginPw) {
		Map<String, Object> result = new HashMap<>();
		MemberDTO md = sqlsession.selectOne("pfDB.memberCheck", loginId);
		if (md == null) {
			result.put("error", "noid");
		} else {
			if (bp.matches(loginPw, md.getMpw()) == false) {
				result.put("error", "loginfail");
			} else if (bp.matches(loginPw, md.getMpw()) == true) {
				result.put("error", "noerr");
				result.put("loginMember", md);
			}
		}

		return result;
	}

	public void addDummy(MemberDTO md) {
		for (int i = 0; i < 100; i++) {
			md.setMname("Dummy");
			md.setMid(String.valueOf(i) + "dummy" + String.valueOf(i));
			md.setMpw("123");
			md.setMtel("01012341234");
			md.setMemail("dummy@dummy.com");
			md.setMadd1("41520");
			md.setMadd2("대구 북구 검단로 3");
			md.setMadd3("더미데이터");
			md.setMmarket1("Y");
			md.setMmarket2("N");
			md.setMmarket3("N");
			md.setMmarket4("Y");
			sqlsession.insert("pfDB.memberSubmit2", md);
		}
	}

	public void insertReserve(ReserveDTO rd) {
		sqlsession.insert("pfDB.reserveInsert", rd);
	}

	public ReserveDTO reserveCheck(ReserveDTO rd, String mid) {
		rd = sqlsession.selectOne("pfDB.selectReserve", mid);
		return rd;
	}

	public void changeReserve(ReserveDTO rd) {
		rd = sqlsession.selectOne("pfDB.changeReserve", rd);
	}

	public void deleteReserve(String rid) {
		sqlsession.delete("pfDB.deleteReserve", rid);
	}

	public int countReserve(String searchpart, String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("searchpart", searchpart);
		parameters.put("search", search);
		return sqlsession.selectOne("pfDB.countReserve", parameters);
	}

	public List<ReserveDTO> getReserveByPage(int currentPage, int pageSize, String searchpart, String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("start", (currentPage - 1) * pageSize);
		parameters.put("pageSize", pageSize);
		parameters.put("searchpart", searchpart);
		parameters.put("search", search);
		List<ReserveDTO> lists = sqlsession.selectList("pfDB.selectReserveByPage", parameters);
		return lists;
	}

	public List<ReserveDTO> getReserveLimit() {
		return sqlsession.selectList("pfDB.selectReserve20");
	}
	public List<FaqDTO> memberFaq(){
		//10faq
		return sqlsession.selectList("pfDB.10faq");
	}
}
