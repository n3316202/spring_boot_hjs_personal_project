package edu.human.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.human.prj.page.Criteria;
import edu.human.prj.page.PageVO;
import edu.human.prj.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController  {

	@Autowired
	private BoardService boardService;
	
	
//	@GetMapping("/list")
//	public String list(Model model) {
//
//		log.info("list()...");
//		model.addAttribute("boards", boardService.getList());
//		
//		return "board/list";
//	}
	
	//http://localhost:8282/list2
	//list2?pageNum=5&amount=10">1</a>
	@GetMapping("/list")
	public String list2(Criteria cri, Model model) {
		log.info("list2() ..");
		log.info("list2() Criteria " + cri);		
		
		model.addAttribute("boards",boardService.getListWithPaging(cri));
		
		int total = boardService.getTotal();
		log.info("total" + total);			
		
		model.addAttribute("pageMaker", new PageVO(cri, total));	
		
		System.out.println();
		return "board/list";
	}
	
}
