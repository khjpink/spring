package kr.spring.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.spring.entity.Board;

@Mapper 
public interface BoardMapper {
	
	//게시글 전체 보기 기능	
	public List<Board> getLists(); 
	 
	//게시글 등록
	public void boardInsert(Board board);

	//게시글 상세보기 
	public Board boardContent(int idx);

	//게시글 삭제
	public void boardDelete(int idx);

	//게시글 수정
	public void boardUpdate(Board vo);
	
	//게시글 조회수 증가 
	public void boardCount(int idx);
}




