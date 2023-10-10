package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("notice")
public class NoticeModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate sqlsession;

	public int noticeWrite(NoticeDTO nd, String url, String filename) {
		System.out.println("url = "+url);
		nd.setCfiledir(url);
		nd.setCfilename(filename);
		return sqlsession.insert("pfDB.noticeInsert", nd);
	}

	public List<NoticeDTO> getNoticesByPage(int currentPage, int pageSize, String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("start", (currentPage - 1) * pageSize);
		parameters.put("pageSize", pageSize);
		parameters.put("search", search);
		List<NoticeDTO> lists = sqlsession.selectList("pfDB.selectNoticeByPage", parameters);
		for(NoticeDTO list:lists) {
			String date = list.getCdate().substring(0,10);
			list.setCdate(date);
		}
		return lists;
	}

	public int countNotices(String search) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("search", search);
		return sqlsession.selectOne("pfDB.countNotices", parameters);
	}
	public void deleteNotice(String cno) {
		int a = sqlsession.delete("pfDB.deleteNotice",cno);
		System.out.println(a);
	}
	public NoticeDTO selectNoticeByCno(String cno,NoticeDTO nt) {
		nt = sqlsession.selectOne("pfDB.selectNoticeByCno",cno);
		return nt;
	}
	public void noticeClicked(String cno) {
		sqlsession.update("pfDB.chnageClicked",cno);
	}
	
	
}
