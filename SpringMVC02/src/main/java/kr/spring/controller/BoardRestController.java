package kr.spring.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

@RequestMapping("/board")
@RestController
public class BoardRestController {
	
	@Autowired
	private BoardMapper mapper; 
	
	@GetMapping("/all")  
	public List<Board> boardList(Board board) {
		System.out.println("게시글 전체 조회 성공");
		List<Board> list =  mapper.getLists();  
		return list; 
	} //boardList끝

	@PostMapping("/new")  
	public void boardInsert(Board board) {  
		System.out.println("게시글 작성 완료");
		mapper.boardInsert(board);
	} //boardInsert끝

	@GetMapping("/{idx}")  
	public Board boardContent(@PathVariable("idx") int idx) {
		System.out.println("게시글 상세보기");
		Board vo =  mapper.boardContent(idx);  
		return vo; 
	} // boardContent끝
	
	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {  
		System.out.println("게시글 삭제 완료");
		mapper.boardDelete(idx);
	} //boardDelete끝

	@PutMapping("/update")
	public void boardUpdate(@RequestBody Board vo) {   
		System.out.println("게시글 수정 완료");
		mapper.boardUpdate(vo); 
	} //boardUpdate끝
	
	//조회수 증가
	@PutMapping("/count/{idx}")
	public void boardCount(@PathVariable("idx") int idx) {  
		System.out.println("조회수 증가 성공");
		mapper.boardCount(idx);
	} //boardCount끝
	

}
