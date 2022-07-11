package kr.ac.kopo.ctc.spring.board.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import kr.ac.kopo.ctc.spring.board.domain.BoardItem;

@SpringBootTest // 스프링부트에서 테스트를 작성하기 위한 어노테이션
public class BoardItemRepositoryTest {

	@Autowired //스프링에서 빈 인스턴스가 생성된 이후 @Autowired를 설정한 메서드가 자동 호출되고 인스턴스가 자동으로 주입됨
	//즉, 해당 변수 및 메서드에서 스프링이 관리하는 Bean 을 자동으로 매핑해줌
	BoardItemRepository boardItemRepository;

	// 1.create
	@Test
	void createContent() {
		BoardItem boardItem = new BoardItem();
		boardItem.setAuthor("주재영");
		boardItem.setTitle("재영");
		boardItem.setNo(1);
		boardItem.setView(0);
		boardItem.setCreated(new Date());
		boardItemRepository.save(boardItem);
	}
	// 2.update
	@Test
	void update() {
		Optional<BoardItem> boardItem = boardItemRepository.findById(1L); //Optional 객체 생성
		//Optional 클래스는 null값일 수도 있는 어떤 변수를 감싸주는 Wrapper 클래스이다.
		//여러가지 메서드를 통해 value 값에 접근하기 때문에 바로 NPE(Null Pointer Exception) 발생하지 않고, null일수 있는 값을 다루기 위해 다양한 메서드 제공
		
		//값이 존재하는 경우에 안에 있는 내용 실행한다.
		boardItem.ifPresent(selectBoardItem -> { //null을 확인하는 if문 대신 ifPresent 함수 호출
			selectBoardItem.setAuthor("업뎃사람");
			selectBoardItem.setCreated(new Date());
			selectBoardItem.setNo(2);
			selectBoardItem.setTitle("업뎃제목");

			boardItemRepository.save(selectBoardItem); //DB에 insert 한다.
		});
	}
	// 3.selectOne
	@Test
	void selectOne() {
		Optional<BoardItem> boardItem = boardItemRepository.findOneById(1L); //id 중 Long 타입의 1 선택
	}
	// 4.selectAll
	@Test
	void selectAll() {
		List<BoardItem> boardItems = boardItemRepository.findAll(); //테이블의 모든 데이터를 가져오기
	}
	// 5.selectAll(search)
	@Test
	void search() { //지정된 문자열 검색
		List<BoardItem> boardItems = boardItemRepository.findByAuthor("업뎃사람"); // 칼럼 'author' 중에 '업뎃사람'이 들어간 문자열 검색
	}
	// 6.selectAll(page)
	@Test
	void page() {
		PageRequest pageRequest = PageRequest.of(2, 1);//(요청된 페이지 숫자, 페이지 사이즈), *페이지는 0부터 시작
		Page<BoardItem> boardItem = boardItemRepository.findAll(pageRequest); //findAll() 메서드는 기본적으로 Page 객체를 리턴함
	}
	// 7.selectAll(search + page)
	@Test
	void searchPage() { //검색 페이징 처리
		PageRequest pageRequest = PageRequest.of(2, 1); //(요청된 페이지 숫자, 페이지 사이즈)
		boardItemRepository.findByTitleContaining("업뎃제목", pageRequest); //칼럼 title에 해당 문자열이 포함된 것을 검색한 후 가져오기
	}
	// 8.delete
	@Test
	void delete() {
		boardItemRepository.deleteByNo(1); //칼럼 'no'의 1을 삭제
	}

}


