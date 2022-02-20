<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/companyHeader.jsp"/>
<link href="${path }/resources/assets/css/enrollOffer.css" rel="stylesheet">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>채용공고 등록</h2>
				<ol>
					<li><a href="${path }">Home</a></li>
					<li>채용공고 등록</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

	<section>
		<form name="offerFrm" action="${path }/offer/enrollOfferEnd.do" method="post" enctype="multipart/form-data">
			<div class="content">
			
				<input name="offerTitle" class="input title" type="text" placeholder="공고 제목을 입력해주세요.">
				<div class="favicon">
					<img alt="등록된 favicon이 없습니다." src="${path}/resources/upload/company/${loginCompany.favicon }">
				</div>
				<div class="companyName1">
					<input name="companyName" class="input company" type="text" value="${loginCompany.companyName }" readonly>
					<input name="companyId" hidden="hidden" type="text" value="${loginCompany.companyId }">
				</div>
				
				<hr>
				
				<div id="tech">
					<p class="title">기술스택</p><input type="button" value="추가" onclick="add_select_tech();">&nbsp;&nbsp;&nbsp;<p class="info">*기술스택은 최대 8개까지 등록이 가능합니다.</p>
					<ul class="techUl">
						<li>
							<select name="tech">
								<option value="java">JAVA</option>
								<option value="jsp">JSP</option>
								<option value="ajax">Ajax</option>
								<option value="jquery">JQuery</option>
								<option value="mysql">My-SQL</option>
								<option value="oracle">ORACLE</option>
								<option value="css">CSS</option>
								<option value="html">HTML</option>
								<option value="mybatis">MyBatis</option>
								<option value="spring">Spirng</option>
								<option value="javascript">JavaScript</option>
								<option value="springboot">Spring boot</option>
								<option value="react">React</option>
								<option value="angular">Angular</option>
								<option value="vue">Vue.js</option>
								<option value="nodejs">Node.js</option>
								<option value="python">Python</option>
								<option value="bootstrap">BootStrap</option>
								<option value="servlet">Servlet</option>
							</select>
						</li>
					</ul>
				</div>
				
				<div id="business">
					<p class="title">주요업무</p><input class="flex" type="button" value="추가" onclick="add_input_business();">&nbsp;&nbsp;&nbsp;<p class="info">*주요업무는 최대 5개까지 등록이 가능합니다.</p>
					<ul id="businessUl">
						<li><input name="business" type="text"></li>
					</ul>
				</div>
				
				<div id="qualification">
					<p class="title">자격요건</p><input class="flex" type="button" value="추가" onclick="add_input_qualification();">&nbsp;&nbsp;&nbsp;<p class="info">*자격요건은 최대 3개까지 등록이 가능합니다.</p>
					<ul id="qualificationUl">
						<li><input name="qualification" type="text"></li>
					</ul>
				</div>
				
				<div id="treatment">
					<p class="title">우대사항</p><input class="flex" type="button" value="추가" onclick="add_input_treatment();">&nbsp;&nbsp;&nbsp;<p class="info">*우대사항 최대 3개까지 등록이 가능합니다.</p>
					<ul id="treatmentUl">
						<li><input name="treatment" type="text"></li>
					</ul>
				</div>
				
				<div id="welfare">
					<p class="title">복지 및 혜택</p><input class="flex" type="button" value="추가" onclick="add_input_welfare();">&nbsp;&nbsp;&nbsp;<p class="info">*복지 및 혜택은 최대 5개까지 등록이 가능합니다.</p>
					<ul id="welfareUl">
						<li><input name="welfare" type="text"></li>
					</ul>
				</div>
				
				<div>
					<p class="title">기업 / 서비스 소개</p>&nbsp;&nbsp;&nbsp;<p class="info">*기업과 기업에서 유지하는 서비스에 대해 설명해주세요.</p>
					<div class="input-group mb-3 filebox">
	               		<input class="upload-name" value="" placeholder="해당 채용공고에 어울리는 사진을 등록해주세요." disabled>
					    <label for="offerImage">파일찾기</label> 
					    <input type="file" id="offerImage" name="file1">
                	</div>
					<textarea name="offerContent" placeholder="기업과 서비스에 대해 소개 해주세요."></textarea>
				</div>
				
				<table>
					<tr>
						<td>경력</td>
						<td><input name="carrer" type="text"></td>
					</tr>
					<tr>
						<td>학력</td>
						<td><input name="education" type="text"></td>
					</tr>
					<tr>
						<td>마감일</td>
						<td><input name="endDate" type="date"></td>
					</tr>
					<tr>
						<td>근무지역</td>
						<td><input name="location" type="text"></td>
					</tr>
				</table>
			</div>
			<div id="submit">
				<input type="submit" value="등록">
			</div>
		</form>
		
	</section>
	
	<script>
		// 추가버튼 누르면 select 생성(tech)
		const add_select_tech=()=>{
			const techUl = $("#techUl");
			const techLi = $("<li>");
			const techSelect = $("<select>").append("<option vlaue='java'>JAVA</option>");
			const techInputButton = $("<input type='button' value='삭제' onclick='tech_remove(this)'>");
			techLi.append(techSelect).append(techInputButton);
			techUl.append(techLi)
		}
		// 삭제버튼 누르면 input 삭제
		const tech_remove=(obj)=>{
			document.getElementById('techUl').removeChild(obj.parentNode);
		}
		
		// 추가버튼 누르면 input 생성(business)
		const add_input_business=()=>{
			const businessUl = $("#businessUl");
			const businessLi = $("<li>");
			const businessInput = $("<input type='text' name='business'>");
			const businessInputButton = $("<input type='button' value='삭제' onclick='business_remove(this)'>");
			businessLi.append(businessInput).append(businessInputButton);
			businessUl.append(businessLi)
		}
		// 삭제버튼 누르면 input 삭제
		const business_remove=(obj)=>{
			document.getElementById('businessUl').removeChild(obj.parentNode);
		}
		
		// 추가버튼 누르면 input 생성(qualification)
		const add_input_qualification=()=>{
			const qualificationUl = $("#qualificationUl");
			const li = $("<li>");
			const newInput = $("<input type='text' name='qualification'>");
			const newInputButton = $("<input type='button' value='삭제' onclick='qualification_remove(this)'>");
			li.append(newInput).append(newInputButton);
			qualificationUl.append(li)
		}
		// 삭제버튼 누르면 input 삭제
		const qualification_remove=(obj)=>{
			document.getElementById('qualificationUl').removeChild(obj.parentNode);
		}
		
		// 추가버튼 누르면 input 생성(treatment)
		const add_input_treatment=()=>{
			const treatmentUl = $("#treatmentUl");
			const treatmentLi = $("<li>");
			const treatmentInput = $("<input type='text' name='treatment'>");
			const treatmentInputButton = $("<input type='button' value='삭제' onclick='treatment_remove(this)'>");
			treatmentLi.append(treatmentInput).append(treatmentInputButton);
			treatmentUl.append(treatmentLi)
		}
		// 삭제버튼 누르면 input 삭제
		const treatment_remove=(obj)=>{
			document.getElementById('treatmentUl').removeChild(obj.parentNode);
		}
		
		// 추가버튼 누르면 input 생성(welfareUl)
		const add_input_welfare=()=>{
			const welfareUl = $("#welfareUl");
			const welfareLi = $("<li>");
			const welfareInput = $("<input type='text' name='welfare'>");
			const welfareInputButton = $("<input type='button' value='삭제' onclick='welfare_remove(this)'>");
			welfareLi.append(welfareInput).append(welfareInputButton);
			welfareUl.append(welfareLi)
		}
		// 삭제버튼 누르면 input 삭제
		const welfare_remove=(obj)=>{
			document.getElementById('welfareUl').removeChild(obj.parentNode);
		}
		
		// 파일올리면 올린파일 명 나오게
		$(()=>{
			$("[name=upFile]").change(e=>{
				const fileName = $(e.target).prop('files')[0].name;
				$(e.target).next(".custom-file-label").html(fileName);
			})
		})
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>