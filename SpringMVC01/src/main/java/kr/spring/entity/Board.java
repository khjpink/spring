package kr.spring.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
public class Board {

	public Board(int i, String string, String string2, String string3, String string4, int j) {
		// TODO Auto-generated constructor stub
	}
	private int idx; //번호
	private String title; //제목
	private String content; //내용
	private String writer; //작성자
	private String indate; //작성일
	private int count; //조회수	
}

//Data 게터세터 
//AllArgsConstructor : 생성자
//NoArgsConstructor : 기본 생성자
//ToString : 출력

