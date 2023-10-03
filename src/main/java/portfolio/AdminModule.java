package portfolio;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminsubmit")
public class AdminModule {
	@Resource(name = "sqlsession")
	private SqlSessionTemplate tm;
	
}
