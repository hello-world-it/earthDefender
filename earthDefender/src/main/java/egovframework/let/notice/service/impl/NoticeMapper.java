package egovframework.let.notice.service.impl;

import java.util.List;

import egovframework.let.notice.service.NoticeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("noticeMapper")
public interface NoticeMapper {

	//게시물 목록 가져오기
	List<EgovMap> selectNoticeList(NoticeVO vo) throws Exception;

	//게시물 목록 수
	int selectNoticeListCnt(NoticeVO vo) throws Exception;

	//조회수 업데이트
	void updateViewCnt(NoticeVO vo) throws Exception;

	//게시물 상세 정보
	NoticeVO selectNotice(NoticeVO vo) throws Exception;

	//게시물 등록 / 등록,수정,삭제 시 db에서 받아오는 결과 값이 없어서 void 선언 (어떤 자료형으로 받는지 체크) 
	void insertNotice(NoticeVO vo) throws Exception;

	//게시물 수정하기
	void updateNotice(NoticeVO vo) throws Exception;

	//게시물 삭제하기
	void deleteNotice(NoticeVO vo) throws Exception;

}
