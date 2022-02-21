package com.pp.boot.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.pp.boot.board.model.vo.Board;
import com.pp.boot.board.model.vo.BoardTotal;
import com.pp.boot.board.model.vo.Comment;
import com.pp.boot.board.model.vo.Like;

public interface BoardDao {
	List<BoardTotal> boardList(SqlSessionTemplate session,Map<String, Object> param);
	
	int boardListCount(SqlSessionTemplate session);
	
	List<BoardTotal> freeList(SqlSessionTemplate session);
	
	List<BoardTotal> leaveList(SqlSessionTemplate session);

	List<BoardTotal> qaList(SqlSessionTemplate session);
	
	List<BoardTotal> readyList(SqlSessionTemplate session);
	
	List<BoardTotal> turnoverList(SqlSessionTemplate session);
	
	Board selectBoard(SqlSessionTemplate session,int boardNo);

	int insertComment(SqlSessionTemplate session, Comment c);

	List<Comment> commentList(SqlSessionTemplate session,int boardNo);

	int countComment(SqlSessionTemplate session, int boardNo);

	List<Board> boardCategory(SqlSessionTemplate session, String category);

	int categoryListCount(SqlSessionTemplate session, String category);

	int enrollBoard(SqlSessionTemplate session, Board b);

	int boardLike(SqlSessionTemplate session, Like l);

	int boardLikeCount(SqlSessionTemplate session, Like l);

	List<BoardTotal> hotList(SqlSessionTemplate session);

	int insertReply(SqlSessionTemplate session, Comment c);

	List<Comment> replyList(SqlSessionTemplate session, int boardNo);

	int commentDelete(SqlSessionTemplate session, int commentNo);

	int boardDelete(SqlSessionTemplate session, int boardNo);

	Board updateBoardView(SqlSessionTemplate session, int boardNo);

	int updateBoard(SqlSessionTemplate session, Board b);

	List<BoardTotal> newSort(SqlSessionTemplate session, Map<String, Object> param);

	List<BoardTotal> viewSort(SqlSessionTemplate session, Map<String, Object> param);

	void updateViewCount(SqlSessionTemplate session, int boardNo);

	List<BoardTotal> likeSort(SqlSessionTemplate session, Map<String, Object> param);

	List<BoardTotal> commentSort(SqlSessionTemplate session, Map<String, Object> param);

	int replyDelete(SqlSessionTemplate session, int commentNo);

	List<BoardTotal> totalviewSort(SqlSessionTemplate session, Map<String, Object> param);

	List<BoardTotal> totalLikeSort(SqlSessionTemplate session, Map<String, Object> param);

	List<BoardTotal> totalCommentSort(SqlSessionTemplate session, Map<String, Object> param);

	List<Board> newboardList(SqlSessionTemplate session);

	List<BoardTotal> totalBoardList(SqlSessionTemplate session);

	List<BoardTotal> myInfoBoard(SqlSessionTemplate session, Map<String, Integer> param, String memberId);

	int myInfoBoardCount(SqlSessionTemplate session,String memberId);

	List<BoardTotal> searchBoard(SqlSessionTemplate session, Map<String, Integer> param, Map<String, String> value);

	List<BoardTotal> searchBoardTitle(SqlSessionTemplate session, Map<String, Integer> param,
			Map<String, String> value);

	int searchBoardCount(SqlSessionTemplate session, Map<String, String> value);

	int searchBoardTitleCount(SqlSessionTemplate session, Map<String, String> value);

	List<BoardTotal> totalSearchBoard(SqlSessionTemplate session, Map<String, Integer> param,
			Map<String, String> value);

	int totalSearchBoardCount(SqlSessionTemplate session, Map<String, String> value);

	List<BoardTotal> totalSearchBoardTitle(SqlSessionTemplate session, Map<String, Integer> param,
			Map<String, String> value);

	int totalSearchBoardTitleCount(SqlSessionTemplate session, Map<String, String> value);
	
	
}
