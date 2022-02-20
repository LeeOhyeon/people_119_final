package com.pp.boot.board.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.board.model.vo.Board;
import com.pp.boot.board.model.vo.BoardTotal;
import com.pp.boot.board.model.vo.Comment;
import com.pp.boot.board.model.vo.Like;

public interface BoardService {
	List<BoardTotal> boardList(Map<String,Object>param);
	
	List<BoardTotal> freeList();
	
	List<BoardTotal> leaveList();
	
	List<BoardTotal> qaList();
	
	List<BoardTotal> readyList();
	
	List<BoardTotal> turnoverList();
	
	int boardListCount();
	
	Board selectBoard(int boardNo);

	List<Comment> commentList(int boardNo);
	
	int insertComment(Comment c);

	int countComment(int boardNo);

	List<Board> boardCategory(String category);

	int categoryListCount(String category);

	int enrollBoard(Board b);

	int boardLike(Like l);

	int boardLikeCount(Like l);

	List<BoardTotal> hotList();

	int insertReply(Comment c);

	List<Comment> replyList(int boardNo);

	int commentDelete(int commentNo);

	int boardDelete(int boardNo);

	Board updateBoardView(int boardNo);

	int updateBoard(Board b);

	List<BoardTotal> newSort(Map<String, Object> param);

	List<BoardTotal> viewSort(Map<String, Object> param);

	void updateViewCount(int boardNo);

	List<BoardTotal> likeSort(Map<String, Object> param);

	List<BoardTotal> commentSort(Map<String, Object> param);

	int replyDelete(int commentNo);

	List<BoardTotal> totalviewSort(Map<String, Object> param);

	List<BoardTotal> totalLikeSort(Map<String, Object> param);

	List<BoardTotal> totalCommentSort(Map<String, Object> param);

	List<Board> newboardList();

	List<BoardTotal> totalBoardList();

	
}
