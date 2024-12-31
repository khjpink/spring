package kr.spring.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

@Controller
public class BoardController {

/* 동기방식
 * 
 *  
 *  */
	
	
	@Autowired
	private BoardMapper mapper; 

	@RequestMapping("/")
	public String home() {
		System.out.println("홈 기능수행");
		return "redirect:/boardList.do";
	}

	@RequestMapping("/boardList.do")
	public String boardList(Model model) {  
		System.out.println("게시판 목록 보기 기능수행");
		List<Board> list = mapper.getLists(); 
		model.addAttribute("list", list);
 		return "boardList";
	}//boardList.do 메소드 끝

	@RequestMapping("/boardForm.do")
	public String boardForm() {  
		System.out.println("글쓰기페이지 이동");
 		return "boardForm";
	}//boardForm.do 메소드 끝
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board board) { 
		System.out.println("게시글 등록 기능수행");
		mapper.boardInsert(board); 
 		return "redirect:/boardList.do";
	}//boardInsert.do 메소드 끝

	@RequestMapping("/boardContent.do/{idx}")
	public String boardContent(@PathVariable("idx") int idx, Model model) {
		System.out.println("게시글 상세보기 기능수행");
		
		mapper.boardCount(idx); //게시글 조회수 증가
		
		Board vo = mapper.boardContent(idx);  
		model.addAttribute("vo", vo);
 		return "boardContent";
	}//boardContent.do 메소드 끝

	@RequestMapping("/boardDelete.do/{idx}") //<a href="boardDelete.do/${vo.idx}" 이걸 썼기때문에 {idx}작성
	public String boardDelete(@PathVariable("idx") int idx, Model model) {
		System.out.println("게시글 삭제 기능수행");
		mapper.boardDelete(idx);
 		return "redirect:/boardList.do"; 
	}//boardDelete.do 메소드 끝

	//게시글 수정화면 이동 
	@RequestMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdateForm(@PathVariable("idx") int idx, Model model) {
		System.out.println("게시글 수정화면이동 기능수행");
		Board vo = mapper.boardContent(idx);  
		model.addAttribute("vo", vo);
 		return "boardUpdateForm";
	}//boardUpdateForm.do 메소드 끝

	//게시글 수정 
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		System.out.println("게시글 수정 기능수행");
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}//boardUpdate 메소드 끝 

}
