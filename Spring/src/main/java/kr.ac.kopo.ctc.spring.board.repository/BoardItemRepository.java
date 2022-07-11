package kr.ac.kopo.ctc.spring.board.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.spring.board.domain.BoardItem;

//----------to do-----------
//create
//update 
//delete
//selectOne
//selectAll
//selectAll(search)
//selectAll(page)
//selectAll(search, page)

@Repository
//BoardItemRepository 의 query method 기능을 사용한 repository
public interface BoardItemRepository extends JpaRepository<BoardItem, Long>, JpaSpecificationExecutor<BoardItem> {

	// selectOne
	Optional<BoardItem> findOneById(Long id); // id 반환

	// selectAll
	List<BoardItem> findAll();

	// search
	List<BoardItem> findByAuthor(String title);

	// page
	Optional<BoardItem> findById(Long id);

	// search + page
	List<BoardItem> findByTitle(String title, PageRequest pageRequest);

	// delete
	@Transactional //모든 작업들이 성공적으로 완료되어야 작업 묶음의 결과를 적용하고, 어떤 작업에서 오류 발생했을 시 이전의 작업들이 성공적이더라도
	//없었던 일처럼 되돌아가는것 -> 모든 작업들이 성공해야만 최종적으로 데이터베이스에 반영하도록 함
	void deleteByNo(Integer no);
	void findByTitleContaining(String string, PageRequest pageRequest);

}

