package kr.ac.kopo.ctc.spring.board.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity // Entity를 사용하기 위해 해당 클래스가 Entity라는 것을 Spring에게 알려줌
// JPA 는 entity 라는 컴포넌트를 확인하여 해당entity를 토대로 데이터 생성 및 처리, 가공 
// Entity = DB의 Table 명
public class BoardItem {

	@Id
	// 기본키를 자동으로 생성할 때 @GeneratedValue 어노테이션이 함께 사용됨
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Long id;

	@Column
	private int no;

	@Column
	private String title;

	@Column
	private String author;

	@Column
	private Date created;

	@Column
	private int view;
	
	//getter, setter 자동생성
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {

	}

}
