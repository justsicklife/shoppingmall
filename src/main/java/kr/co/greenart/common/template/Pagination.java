package kr.co.greenart.common.template;

import kr.co.greenart.common.model.dto.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int listCount,int currentPage,int pageLimit,int boardLimit) {
		// pageLimit 5
		// boardLimit 4
		
		// listCount 21
		// currentPage 6
		
		
		// 21/4
		
		// maxPage 6
		int maxPage = (int)(Math.ceil((double)listCount/boardLimit));
		
		// (5 / 5 * 5) + 1
		// startPage 5 + 1
		int startPage = (currentPage - 1) /pageLimit * pageLimit + 1;
		
		// endPage 6 + 5 - 1 : 10
		
		int endPage = startPage + pageLimit -1;
		
		// 10 > 6
		if(endPage > maxPage) {
			// endPage = 6
			endPage = maxPage;
		}
		
		return new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
	}
}
