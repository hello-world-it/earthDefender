package egovframework.let.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.notice.service.NoticeService;
import egovframework.let.notice.service.NoticeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {
	
	@Resource(name= "noticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name = "egovNoticeIdGnrService")
	private EgovIdGnrService idgenService;

	//게시물 목록 가져오기
//	@Override 생략 가능
	public List<EgovMap> selectNoticeList(NoticeVO vo) throws Exception {
		return noticeMapper.selectNoticeList(vo);
	}

	//게시물 목록 수
	@Override
	public int selectNoticeListCnt(NoticeVO vo) throws Exception {
		return noticeMapper.selectNoticeListCnt(vo);
	}

	//게시물 상세정보 (게시물 가져오기)
	@Override
	public NoticeVO selectNotice(NoticeVO vo) throws Exception {//트리거 (selectBoard가 실행 되면 안의 두 문장 모두 실행. 에러 시 모두 롤백)
		// 조회수 업 
		// Impl에 넣은건 트랜잭션 처리를 위한 것. Controller에 적었을 경우 둘 중 작동 중간에 에러가 나면, 하나만 실행되고 에러 시 종료 되는 상황을 방지하기 위해 Impl에 작성. 예)쇼핑몰 주문, 통계
		noticeMapper.updateViewCnt(vo);
		
		return noticeMapper.selectNotice(vo);
	}

	//게시물 등록
	@Override
	public String insertNotice(NoticeVO vo) throws Exception {
		
		String id = idgenService.getNextStringId();
		vo.setBoardId(id);
		noticeMapper.insertNotice(vo);
		
		return id;
	}

	//게시물 수정하기
	@Override
	public void updateNotice(NoticeVO vo) throws Exception {
		noticeMapper.updateNotice(vo);
	}

	//게시물 삭제하기
	@Override
	public void deleteNotice(NoticeVO vo) throws Exception {
		noticeMapper.deleteNotice(vo);
	}


}
