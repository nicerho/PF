package portfolio;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FaqController {
	@Resource(name = "faq")
	private FaqModule faqModule;
	@RequestMapping("/faqPage")
	public String faqPage(@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "search", required = false) String search, Model model) {
		int pageSize = 10;
		List<FaqDTO> faq = faqModule.getFaqByPage(pageNumber, pageSize, search);
		int totalNotices = faqModule.countFaq(search);
		int totalPages = (int) Math.ceil((double) totalNotices / pageSize);
		model.addAttribute("faqs", faq);
		model.addAttribute("currentPage", pageNumber);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("search", search);
		return "FaqMain";
	}
	@PostMapping("/faqDelete")
	public void deleteNotice(String faqNumber) {
		faqModule.deleteNotice(faqNumber);
	}
}
