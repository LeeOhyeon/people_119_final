package com.pp.boot.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompanyReview {
	
	private int companyReviewNo;
	private String memberId;
	private String companyName;
	
	private int meetingCount; // 회의 얼마나 자주함?
	private int drinkingCycle; // 회식 얼마나 자주함?
	private int wayOfDringking; // 회식 방식은?
	private int wayOfVacation; // 연차 쓸때 눈치줌?
	private int numberOfAvgVacation; // 연차 얼마나?
	private int genderRatio; // 성별비율
	private int freeAttendance; // 자유로운 출근시간
	private int avarageOfAge; // 평균연령
	private int clothes; // 출근복장
	private int workLifeBalance; // 워라밸 ㄱㄴ?
	private int nightShift; // 야근??
	private int salaryIncreaseratio; // 월급 잘 올려줌?
	private int incentive; // 성과금 ??
	private int babyVacation; // 육아휴직?
	private int selfDev; // 자기개발비 지원?
	private int growUp; // 성장할 수 있는 회사?
	private int carrer; // 내 커리어에 도움 ?
	private int mento; // 멘토 있음?
	private int avarageOfYears; // 직원 평균 근속 연수는?
	private int leadershipStyle; // 회사 리더십 스타일은?
	private String advantages; // 회사 좋은점?
	private double avgScore; // 별점
	
	

}
