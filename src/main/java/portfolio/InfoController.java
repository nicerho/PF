package portfolio;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InfoController {
	@Resource(name = "info")
	private InfoModule infoModule;

	@RequestMapping("infoPage")
	public String infoPage(@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "search", required = false) String search, Model model) {
		int pageSize = 10;
		List<InfoDTO> info = infoModule.getInfoByPage(pageNumber, pageSize, search);
		int totalNotices = infoModule.countInfo(search);
		int totalPages = (int) Math.ceil((double) totalNotices / pageSize);
		model.addAttribute("infos", info);
		model.addAttribute("currentPage", pageNumber);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("search", search);
		return "InfoMain";
	}
	@PostMapping("/infoDelete")
	public void deleteNotice(String infoNumber) {
		infoModule.deleteInfo(infoNumber);
	}

	@PostMapping("infoWrite")
	public String infoWrite(InfoDTO id) {
		infoModule.insertInfo(id);
		
		return "redirect:infoPage";
	}
}
