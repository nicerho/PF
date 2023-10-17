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

	public Map<String, String> login(String loginId, String loginPw) {
		Map<String, String> result = new HashMap<>();
		MemberDTO md = sqlsession.selectOne("pfDB.memberCheck", loginId);
		if (md == null) {
			result.put("error", "noid");
		} else {
			if (bp.matches(loginPw, md.getMpw()) == false) {
				result.put("error", "loginfail");
			} else if (bp.matches(loginPw, md.getMpw()) == true) {
				result.put("error", "noerr");
				result.put("loginId", md.getMid());
			}
		}

		return result;
	}

	public void addDummy(MemberDTO md) {
		for (int i = 0; i < 100; i++) {
			md.setMname("Dummy");
			md.setMid("dummy" + String.valueOf(i));
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
			sqlsession.insert("pfDB.memberSubmit2",md);
		}
	}
}
