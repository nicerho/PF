package portfolio;

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
//		if(md.getMmarket1().equals("")||md.getMmarket1().equals("NULL")||md.getMmarket1().equals(null)) {
//			md.setMmarket1("N");
//			System.out.println(md.getMmarket1());
//		}
//				
		int a = sqlsession.insert("pfDB.memberSubmit", md);
		return a;
	}
}
