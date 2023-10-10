package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("faq")
public class FaqModule {
	
	@Resource(name = "sqlsession")
	private SqlSessionTemplate sqlsession;
	public List<FaqDTO> getFaqByPage(int currentPage, int pageSize, String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("start", (currentPage - 1) * pageSize);
		parameters.put("pageSize", pageSize);
		parameters.put("search", search);
		List<FaqDTO> lists = sqlsession.selectList("pfDB.selectFaqByPage", parameters);
		return lists;
	}
	public int countFaq(String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("search", search);
		return sqlsession.selectOne("pfDB.countFaq", parameters);
	}
	public void deleteNotice(String fno) {
		int a = sqlsession.delete("pfDB.deleteFaq",fno);
		System.out.println(a);
	}
}
