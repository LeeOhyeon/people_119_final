package com.pp.boot.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pp.boot.board.model.vo.Board;
import com.pp.boot.board.model.vo.BoardTotal;
import com.pp.boot.board.model.vo.Comment;
import com.pp.boot.board.model.vo.Like;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Override
	public List<BoardTotal> boardList(SqlSessionTemplate session,Map<String,Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("board.selectBoardList",null,rb); 
	}

	@Override
	public int boardListCount(SqlSessionTemplate session) {
		
		return session.selectOne("board.boardListCount");
	}

	@Override
	public List<BoardTotal> freeList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectfreeList");
	}

	@Override
	public List<BoardTotal> leaveList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectleaveList");
	}

	@Override
	public List<BoardTotal> qaList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectqaList");
	}

	@Override
	public List<BoardTotal> readyList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectreadyList");
	}

	@Override
	public List<BoardTotal> turnoverList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectturnoverList");
	}

	@Override
	public Board selectBoard(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectBoard",boardNo);
	}
	@Override
	public List<Comment> commentList(SqlSessionTemplate session,int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.commentList",boardNo);
	}
	@Override
	public int insertComment(SqlSessionTemplate session, Comment c) {
		// TODO Auto-generated method stub
		return session.insert("board.insertComment",c);
	}

	@Override
	public int countComment(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.countComment",boardNo);
	}
	@Override
	public List<Board> boardCategory(SqlSessionTemplate session, String category) {
		// TODO Auto-generated method stub
		return session.selectList("board.boardCategory",category);
	}

	@Override
	public int categoryListCount(SqlSessionTemplate session, String category) {
		// TODO Auto-generated method stub
		return session.selectOne("board.categoryListCount",category);
	}

	@Override
	public int enrollBoard(SqlSessionTemplate session, Board b) {
		// TODO Auto-generated method stub
		session.insert("board.enrollBoard",b);
		
		int boardNo=b.getBoardNo();
		
		return boardNo;
	}

	@Override
	public int boardLike(SqlSessionTemplate session, Like l) {
		// TODO Auto-generated method stub
		return session.insert("board.boardLike",l);				
	}

	@Override
	public int boardLikeCount(SqlSessionTemplate session, Like l) {
		// TODO Auto-generated method stub
		return session.selectOne("board.boardLikeCount",l);
	}

	@Override
	public List<BoardTotal> hotList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.hotList");
	}

	@Override
	public int insertReply(SqlSessionTemplate session, Comment c) {
		// TODO Auto-generated method stub
		return session.insert("board.insertReply",c);
	}

	@Override
	public List<Comment> replyList(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.replyList",boardNo);
	}

	@Override
	public int commentDelete(SqlSessionTemplate session, int commentNo) {
		// TODO Auto-generated method stub
		return session.delete("board.commentDelete",commentNo);
	}

	@Override
	public int boardDelete(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.delete("board.boardDelete",boardNo);
	}

	@Override
	public Board updateBoardView(SqlSessionTemplate session, int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.updateBoardView",boardNo);
	}

	@Override
	public int updateBoard(SqlSessionTemplate session, Board b) {
		// TODO Auto-generated method stub
		return session.update("board.updateBoard",b);
	}

	@Override
	public List<BoardTotal> newSort(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("board.newSort",param,rb);
	}

	@Override
	public List<BoardTotal> viewSort(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("board.viewSort",param,rb);
	}

	@Override
	public void updateViewCount(SqlSessionTemplate session, int boardNo) {
		session.update("board.updateViewCount",boardNo);
	}

	@Override
	public List<BoardTotal> likeSort(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);		
		
		return session.selectList("board.likeSort",param,rb);
	}

	@Override
	public List<BoardTotal> commentSort(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);		
		
		return session.selectList("board.commentSort",param,rb);
	}

	@Override
	public int replyDelete(SqlSessionTemplate session, int commentNo) {
		// TODO Auto-generated method stub
		return session.delete("board.replyDelete",commentNo);
	}

	@Override
	public List<BoardTotal> totalviewSort(SqlSessionTemplate session,Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return session.selectList("board.totalviewSort",null,rb);
	}

	@Override
	public List<BoardTotal> totalLikeSort(SqlSessionTemplate session,Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("board.totalLikeSort",null,rb);
	}

	@Override
	public List<BoardTotal> totalCommentSort(SqlSessionTemplate session,Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("board.totalCommentSort",null,rb);
	}

	@Override
	public List<Board> newboardList(SqlSessionTemplate session) {
		return session.selectList("board.newboardList");
	}

	@Override
	public List<BoardTotal> totalBoardList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.totalBoardList");
	}
		
}
