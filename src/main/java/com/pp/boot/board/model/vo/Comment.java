package com.pp.boot.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.pp.boot.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Comment {

	private int commentNo;
	private int boardNo;
	private String memberId;
	private int commentRef;
	private String commentContent;
	private Date commentDate;
	private int commentLevel;
}
