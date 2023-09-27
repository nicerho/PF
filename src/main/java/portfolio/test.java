package portfolio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {
	@Autowired
	private BCryptPasswordEncoder bp;

	@GetMapping("/test123.do")
	public void testtt() {
		String a = bp.encode("testPW");
		System.out.println(bp.matches("testPW", a));
		System.out.println(a);
	}
}
