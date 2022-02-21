package com.pp.boot.board.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.board.model.dao.BoardDao;
import com.pp.boot.board.model.vo.Board;
import com.pp.boot.board.model.vo.BoardTotal;
import com.pp.boot.board.model.vo.Comment;
import com.pp.boot.board.model.vo.Like;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<BoardTotal> boardList(Map<String, Object> param) {
		List<BoardTotal> list=dao.boardList(session,param);
		return list;
	}
	@Override
	public int boardListCount() {
		int count=dao.boardListCount(session);
		return count;
	}
	@Override
	public List<BoardTotal> freeList() {
		List<BoardTotal> free=dao.freeList(session);
		return free;
	}
	@Override
	public List<BoardTotal> leaveList() {
		List<BoardTotal> leave=dao.leaveList(session);
		return leave;
	}
	@Override
	public List<BoardTotal> qaList() {
		List<BoardTotal> qa=dao.qaList(session);
		return qa;
	}
	@Override
	public List<BoardTotal> readyList() {
		List<BoardTotal> ready=dao.readyList(session);
		return ready;
	}
	@Override
	public List<BoardTotal> turnoverList() {
		List<BoardTotal> turnover=dao.turnoverList(session);
		return turnover;
	}
	@Override
	public Board selectBoard(int boardNo) {
		Board b=dao.selectBoard(session,boardNo);
		return b;
	}
	@Override
	public List<Comment> commentList(int boardNo) {
		List<Comment> commentList=dao.commentList(session,boardNo);
		return commentList;
	}
	@Override
	public int insertComment(Comment c) {
		int result=dao.insertComment(session, c);
		return result;
	}
	@Override
	public int countComment(int boardNo) {
		int countComment=dao.countComment(session,boardNo);
		return countComment;
	}
	@Override
	public List<Board> boardCategory(String category) {
		List<Board> list=dao.boardCategory(session,category);
		return list;
	}
	@Override
	public int categoryListCount(String category) {
		int count=dao.categoryListCount(session,category);
		return count;
	}
	@Override
	public int enrollBoard(Board b) {
		int result=dao.enrollBoard(session,b);
		return result;
	}
	@Override
	public int boardLike(Like l) {
		int result=dao.boardLike(session,l);
		return result;
	}
	@Override
	public int boardLikeCount(Like l) {
		int count=dao.boardLikeCount(session,l);
		return count;
	}
	@Override
	public List<BoardTotal> hotList() {
		List<BoardTotal> list=dao.hotList(session);
		return list;
	}
	@Override
	public int insertReply(Comment c) {
		int result=dao.insertReply(session,c);
		
		return result;
	}
	@Override
	public List<Comment> replyList(int boardNo) {
		List<Comment> list=dao.replyList(session,boardNo);
		return list;
	}
	@Override
	public int commentDelete(int commentNo) {
		int count=dao.commentDelete(session,commentNo);
		return count;
	}
	@Override
	public int boardDelete(int boardNo) {
		int count=dao.boardDelete(session,boardNo);
		return count;
	}
	@Override
	public Board updateBoardView(int boardNo) {
		Board b=dao.updateBoardView(session,boardNo);
		return b;
	}
	@Override
	public int updateBoard(Board b) {
		int count=dao.updateBoard(session,b);
		return count;
	}
	@Override
	public List<BoardTotal> newSort(Map<String, Object> param) {
		List<BoardTotal> list=dao.newSort(session,param);
		
		return list;
	}
	@Override
	public List<BoardTotal> viewSort(Map<String, Object> param) {
		List<BoardTotal> list=dao.viewSort(session,param);
		
		return list;
	}
	@Override
	public void updateViewCount(int boardNo) {
		dao.updateViewCount(session,boardNo);
	}
	@Override
	public List<BoardTotal> likeSort(Map<String, Object> param) {
		// TODO Auto-generated method stub
		List<BoardTotal> list=dao.likeSort(session,param);
		
		return list;
	}
	@Override
	public List<BoardTotal> commentSort(Map<String, Object> param) {
		List<BoardTotal> list=dao.commentSort(session,param);
		
		return list;
	}
	@Override
	public int replyDelete(int commentNo) {
		int count=dao.replyDelete(session,commentNo);
		return count;
	}
	@Override
	public List<BoardTotal> totalviewSort(Map<String, Object> param) {
		List<BoardTotal> list=dao.totalviewSort(session,param);
		return list;
	}
	@Override
	public List<BoardTotal> totalLikeSort(Map<String, Object> param) {
		List<BoardTotal> list=dao.totalLikeSort(session,param);
		return list;
	}
	@Override
	public List<BoardTotal> totalCommentSort(Map<String, Object> param) {
		List<BoardTotal> list=dao.totalCommentSort(session,param);
		return list;
	}
	@Override
	public List<Board> newboardList() {
		List<Board> list=dao.newboardList(session);
		return list;
	}
	@Override
	public List<BoardTotal> totalBoardList() {
		// TODO Auto-generated method stub
		List<BoardTotal> list=dao.totalBoardList(session);
		return list;
	}
	@Override
	public List<BoardTotal> myInfoBoard(Map<String, Integer> param, String memberId) {
		// TODO Auto-generated method stub
		List<BoardTotal> list=dao.myInfoBoard(session,param,memberId);
		return list;
	}
	@Override
	public int myInfoBoardCount(String memberId) {
		// TODO Auto-generated method stub
		int count=dao.myInfoBoardCount(session,memberId);
		return count;
	}
	
}
