package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("info")
public class InfoModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate sqlsession;
	
	public int insertInfo(InfoDTO id) {
		return sqlsession.insert("pfDB.infoInsert", id);
	}
	public List<InfoDTO> getInfoByPage(int currentPage, int pageSize, String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("start", (currentPage - 1) * pageSize);
		parameters.put("pageSize", pageSize);
		parameters.put("search", search);
		List<InfoDTO> lists = sqlsession.selectList("pfDB.selectInfoByPage", parameters);
		return lists;
	}
	public int countInfo(String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("search", search);
		return sqlsession.selectOne("pfDB.countInfo", parameters);
	}
	public void deleteInfo(String ino) {
		sqlsession.delete("pfDB.deleteInfo",ino);
	}
}
