package egovframework.let.notice.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface NoticeService {

	//게시물 목록 가져오기
	public List<EgovMap> selectNoticeList(NoticeVO vo) throws Exception;

	//게시물 목록 수
	public int selectNoticeListCnt(NoticeVO vo) throws Exception;

	//게시물 가져오기 
	public NoticeVO selectNotice(NoticeVO vo) throws Exception;

	//게시물 등록하기
	public String insertNotice(NoticeVO vo) throws Exception;

	//게시물 수정하기
	public void updateNotice(NoticeVO vo) throws Exception;

	//게시물 삭제하기
	public void deleteNotice(NoticeVO vo) throws Exception;

}
