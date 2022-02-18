package com.pp.boot.common;

public class PageFactoryBoardLike {

	public static String getPageBar(int totalData, int cPage, int numPerpage, int pageBarSize) {
		
		String pageBar = "";
		
		int totalPage = (int)Math.ceil((double)totalData / numPerpage);
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo == 1) {
			pageBar += "<li class='page-item disabled'>";
	        pageBar += "<a class='page-link' href='#' tabindex='-1'> < </a>";
	        pageBar += "</li>";
		} else {
	        pageBar += "<li class='page-item'>";
	        pageBar += "<a class='page-link' href='javascript:likesort("+(pageNo-1)+")'> < </a>";
	        pageBar += "</li>";

		}
		
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(cPage == pageNo) {
	           pageBar += "<li class='page-item active'>";
	           pageBar += "<a class='page-link' href='#'>"+pageNo+"</a>";
	           pageBar += "</li>";
			}else {
	           pageBar += "<li class='page-item'>";
	           pageBar += "<a class='page-link' href='javascript:likesort("+(pageNo)+")'>"+pageNo+"</a>";
	           pageBar += "</li>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
	        pageBar += "<li class='page-item'>";
	        pageBar += "<a class='page-link' href='#'> > </a>";
	        pageBar += "</li>";
		}else {
	        pageBar += "<li class='page-item'>";
	        pageBar += "<a class='page-link' href='javascript:likesort("+(pageNo)+")'> > </a>";
	        pageBar += "</li>";
		}
		pageBar += "</ul>";
		/*
		 * pageBar += "<script>"; pageBar += "function fn_paging(cPage){"; pageBar +=
		 * "location.assign('" + url + "?cPage='+cPage);"; pageBar += "}"; pageBar +=
		 * "</script>";
		 */
		
		return pageBar;
	}
	
}