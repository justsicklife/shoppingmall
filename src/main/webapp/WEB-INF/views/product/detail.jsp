<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
				crossorigin="anonymous">

			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
				integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />

			<!-- important mandatory libraries -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

			<link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/css/star-rating.min.css"
				media="all" rel="stylesheet" type="text/css" />

			<link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/themes/krajee-svg/theme.css"
				media="all" rel="stylesheet" type="text/css" />

			<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/js/star-rating.min.js"
				type="text/javascript"></script>

			<!-- with v4.1.0 Krajee SVG theme is used as default (and must be loaded as below) - include any of the other theme JS files as mentioned below (and change the theme property of the plugin) -->
			<script
				src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/themes/krajee-svg/theme.js"></script>

			<!-- optionally if you need translation for your language then include locale file as mentioned below (replace LANG.js with your own locale file) -->
			<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/js/locales/LANG.js"></script>


			<link rel="stylesheet" href="/resources/css/product/detail/detail.css">

			<!-- chart.js -->
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


		</head>

		<body>


			<%@ include file="/WEB-INF/views/common/navbar.jsp" %>


				<c:forEach var="score" items="${scores }" varStatus="status">
					<input type="hidden" id="score-${status.count}" value="${score}" />
				</c:forEach>
				<input type="hidden" id="product_id" value="${product.product_id }" />
				<!-- Product section-->
				<section class="py-5">
					<div class="container px-4 px-lg-5 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-6">
								<div class="image_list">
									<c:forTokens var="image" items="${product.product_image_group }" delims=",">
										<img src="${image}" />
									</c:forTokens>
								</div>
							</div>
							<div class="col-md-5">
								<h1 class="fw-bolder pb-2 division">${product.product_name }</h1>

								<h5 class="pb-2 division my-1 product_content">${product.product_content }</h5>

								<div class="fs-5 pb-2 mb-3 division">
									<span>가격 : </span> <span class="product_price">${product.product_price} 원</span>
								</div>

								<div class="mb-1 ">
									<select class="w-100" id="color">
										<c:forTokens var="color" items="${ product.product_color_group}" delims=",">
											<option value="${color}">${color}</option>
										</c:forTokens>
									</select>
								</div>
								<div class="mb-3 division pb-3">
									<select class="w-100" id="size">
										<c:forTokens var="size" items="${ product.product_size_group}" delims=",">
											<option value="${size}">${size }</option>
										</c:forTokens>
									</select>
								</div>

								<div class="mb-3 button_group">
									<button class="btn sale col-6 py-2" type="button">구매</button>
									<button class="btn wish col-3 py-2" type="button">찜</button>
									<button class="btn cart col-3 py-2" type="button">
										<i class="bi-cart-fill me-1"></i> 장바구니
									</button>
								</div>
							</div>
						</div>
					</div>
				</section>

				<section class="py-5">
					<div class="container px-4 px-lg-5 my-5">
						<ul class="d-flex list-link">
							<li class="li-link"><a class="link" href="#info"> info </a></li>
							<li class="li-link"><a href="#review" class="link"> reviews
								</a></li>
							<li class="li-link"><a class="link" href="#qna"> q&a </a></li>
						</ul>
					</div>
				</section>

				<section class="py-5" id="info">
					<h1 class="d-flex justify-content-center text-uppercase">Info</h1>
					<div class="container px-4 px-lg-5 my-5 d-flex justify-content-center flex-wrap gap-5">
						${product.product_info }</div>
				</section>

				<div class="py-5 container">
					<div class="score-box ">
						<div class="score-box-2 d-flex align-items-center">
							<div>
								<h1 class="px-5 score_sum">${sumScore}</h1>
								<div class="text-center">
									<span class="review_title">리뷰</span> <span
										class="review_count">${reviewListCount}</span>
								</div>
							</div>
							<canvas style="width: 100%; height: 100%;" class="score-chart" id="myChart"></canvas>
						</div>
						<div class="review-button-box text-end d-flex justify-content-end">
							<button class="review-button">후기게시판</button>
							<c:if test="${empty reviewCurUser}">
								<a class="d-block"
									href="/review/create?member_id=${member_id}&product_id=${product.product_id}">
									<button class="review-save">후기작성</button>
								</a>
							</c:if>
						</div>
					</div>
				</div>

				<script>
					let scores = []

					for (let i = 1; i <= 5; i++) {
						const score = document.getElementById("score-" + i);
						scores.push(parseInt(score.value));
					}

					const ctx = document.getElementById('myChart').getContext('2d');
					const myChart = new Chart(ctx,
						{
							type: 'bar',
							plugins: {
								legend: {
									position: 'right',
								},
								title: {
									display: true,
									text: 'Chart.js Horizontal Bar Chart'
								}
							},
							data: {
								labels: ['1 Starts', '2 Starts', '3 Starts',
									'4 Starts', '5 Starts'],
								datasets: [{
									data: scores,
									backgroundColor: ['rgba(113, 113, 113, 1)',
										'rgba(113, 113, 113, 1)',
										'rgba(113, 113, 113, 1)',
										'rgba(113, 113, 113, 1)',
										'rgba(113, 113, 113, 1)'],
									borderWidth: 1
								}]
							},
							options: {
								indexAxis: 'y',
								responsive: false,
								plugins: {
									legend: {
										display: false
									}
								}
							}
						});
				</script>



				<div id="review" class="container mt-5">

					<div class="review-box">

						<div class="col-md-12">
							<c:if test="${not empty reviewCurUser}">
								<div class="headings d-flex justify-content-between align-items-center mb-1">
									<h5>내가 작성한 댓글</h5>
								</div>
								<div class="card p-1">
									<div class="d-flex justify-content-between align-items-center">
										<div class="user d-flex flex-row align-items-center">
											<input name="review_score" id="input-id" type="text" class="rating" readonly
												data-size="sm" value="${reviewCurUser.review_score }"
												data-show-caption="false" data-show-clear="false">
										</div>
										<small class="review_date">
											${reviewCurUser.review_open_date} </small>
									</div>
									<div class="review-conetent-box mb-2">
										<div class="review_content">${reviewCurUser.review_content }</div>
										<div>
											<span>작성자 : </span>
											<span class="review_member_id">
												${reviewCurUser.member_id }
											</span>
										</div>
									</div>
									<div class="d-flex justify-content-end">
										<a class="d-block" href="/review/update?review_id=${reviewCurUser.review_id}">
											<button class="btn edit">수정</button>
										</a>
										<form action="/review/delete" method="post">
											<input type="hidden" name="review_id" value="${reviewCurUser.review_id }" />
											<input type="hidden" name="product_id"
												value="${reviewCurUser.product_id }" />
											<button class="btn delete">삭제</button>
										</form>
									</div>
								</div>
							</c:if>

							<hr>

							<div class="headings d-flex justify-content-between align-items-center mb-1">
								<h5>작성된 리뷰 ( ${reviewListCount} 개 )</h5>
							</div>
							<c:forEach var="review" items="${reviewList}">
								<div class="card py-1 my-3">
									<div class="d-flex justify-content-between align-items-center">
										<div class="user d-flex flex-row align-items-center">
											<input name="review_score" id="input-id" type="text" class="rating" readonly
												data-size="sm" value="${review.review_score }" data-show-caption="false"
												data-show-clear="false">
										</div>
										<small class="review_date"> ${review.review_open_date} </small>
									</div>
									<div class="review-conetent-box">
										<div class=" review_content">${review.review_content }</div>
										<div>
											<span>작성자 : </span>
											<span class="review_member_id">
												${review.member_id }
											</span>
										</div>
									</div>

								</div>
							</c:forEach>

						</div>
						<ul>
							<c:choose>
								<c:when test="${reviewPi.currentPage eq 1 }">
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Previous">
											<span aria-hidden="true"><i class="fa-solid fa-angles-left"
													style="color: gray;"></i></span>
										</a></li>
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Previous">
											<span aria-hidden="true"><i class="fa-solid fa-angle-left"
													style="color: gray;"></i></span>
										</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
											href="detail?rpage=${ 1}&product_id=${product.product_id}&ipage=${inquiryPi.currentPage}"
											aria-label="Previous"> <i class="fa-solid fa-angles-left"
												style="color: gray;"></i>
										</a></li>
									<li class="page-item"><a class="page-link"
											href="detail?rpage=${reviewPi.currentPage-1 }&product_id=${product.product_id}&ipage=${inquiryPi.currentPage}"
											aria-label="Previous"> <span aria-hidden="true"><i
													class="fa-solid fa-angle-left" style="color: gray;"></i></span>
										</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${reviewPi.startPage}" end="${reviewPi.endPage}">
								<c:choose>
									<c:when test="${p eq reviewPi.currentPage}">
										<li class="page-item"><a class="active-page page-link"
												href="detail?rpage=${p }&product_id=${product.product_id}&ipage=${inquiryPi.currentPage}">${
												p}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
												href="detail?rpage=${p }&product_id=${product.product_id}&ipage=${inquiryPi.currentPage}">${
												p}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${reviewPi.currentPage eq reviewPi.maxPage }">
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Next">
											<span aria-hidden="true"><i class="fa-solid fa-angle-right"
													style="color: gray;"></i></span>
										</a></li>
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Next">
											<span aria-hidden="true"><i class="fa-solid fa-angles-right"
													style="color: gray;"></i></span>
										</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
											href="/product/detail?rpage=${reviewPi.currentPage + 1}&product_id=${product.product_id}&ipage=${inquiryPi.currentPage}"
											aria-label="Next"> <span aria-hidden="true"><i
													class="fa-solid fa-angle-right" style="color: gray;"></i></span>
										</a></li>
									<li class="page-item">
										<!-- 10, 20, 30, 40, .... --> <a class="page-link"
											href="/product/detail?rpage=${reviewPi.maxPage }&product_id=${product.product_id}&ipage=${inquiryPi.currentPage}"
											aria-label="Next"> <span aria-hidden="true"><i
													class="fa-solid fa-angles-right" style="color: gray;"></i></span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>


				<!-- q&a 게시판 -->
				<section id="qna" class="container py-5">
					<div class="table-container text-end">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" style="width: 5%; text-align: center;">번호</th>
									<th scope="col" style="width: 10%; text-align: center;">답변여부</th>
									<th scope="col" style="width: 15%; text-align: center;">구분</th>
									<th scope="col" style="width: 40%; text-align: center;">제목</th>
									<th scope="col" style="width: 15%; text-align: center;">작성자</th>
									<th scope="col" style="width: 15%; text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty boardList}">
										<tr>
											<td colspan="6">
												<h3 class="text-center">등록된 문의가 없습니다.</h3>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${boardList}">
											<c:if test="${item.boardAnswerNum == 0}">
												<tr id="question-${item.boardQuestionNum}"
													onclick="toggleRow('${item.boardQuestionNum}','${item.boardSecret}', '${item.boardMemberId}', '${memberId}')">
													<input type="hidden" name="memberId" value="${memberName}">
													<td class="td-num" style="width: 5%; text-align: center;">
														${boardRow}</td>
													<td class="td-AnswerNum" style="width: 10%; text-align: center;">
														<c:choose>
															<c:when test="${item.boardAnswer_Y == 1}">
																답변 완료
															</c:when>
															<c:otherwise>
																답변 대기중
															</c:otherwise>
														</c:choose>
													</td>
													<td class="td-boardCategory"
														style="width: 15%; text-align: center;">${item.boardCategory}
													</td>
													<td class="td-boardTitle" style="width: 40%; text-align: center;">
														${item.boardTitle}</td>
													<td class="td-memberId" style="width: 15%; text-align: center;">
														${item.boardMemberId}</td>
													<td class="td-indate" style="width: 15%; text-align: center;">
														${item.boardIndate}</td>
												</tr>
												<tr id="hidden-${item.boardQuestionNum}"
													class="hidden-content-row1-user"
													style="display: none; text-align: left;">
													<td colspan="6">
														<div class="hidden-content">
															<p style="font-weight: bolder; font-size: 1.2em;">
																${item.boardTitle}</p>
															${item.boardContent}
															<c:if test="${item.boardMemberId eq memberId}">
																<div style="text-align: right; margin-top: 10px;"
																	class="d-flex justify-content-end">
																	<!-- 답변이 있을 경우 수정 못함 -->
																	<c:if test="${item.boardAnswer_Y == 0}">
																		<button class="btn edit"
																			onclick="openEdit('${item.boardQuestionNum}')">수정</button>
																	</c:if>
																	<button class="btn delete"
																		onclick="deleteInquiry('${item.boardQuestionNum}','${product.product_id }')">삭제</button>
																</div>
															</c:if>
															<c:if
																test="${memberId eq 'admin' and item.boardAnswer_Y == 0}">
																<div style="text-align: right; margin-top: 10px;">
																	<button class="as-button btn edit"
																		onclick="openAnswer('${item.boardQuestionNum}','${ memberId}','${ product.product_id}')">답변</button>
																</div>
															</c:if>
														</div>
													</td>
												</tr>
											</c:if>
											<c:set var="boardRow" value="${boardRow-1}" />
											<c:forEach var="answerItem" items="${answerList}">
												<c:if
													test="${item.boardQuestionNum == answerItem.boardQuestionNum && answerItem.boardAnswerNum == 1}">
													<tr id="answer-${item.boardQuestionNum}"
														class="hidden-content-row-admin"
														style="display: none; text-align: left; background-color: lightgray">
														<td colspan="5">
															<div>
																<p style="font-weight: bolder; font-size: 1.2em;">[답변]
																	관리자</p>
																${answerItem.boardContent}
															</div>
														</td>
														<td colspan="1">
															<div style="text-align: center;">
																${answerItem.boardIndate}</div>
															<c:if test="${memberId eq 'admin'}">
																<div style="text-align: right; margin-top: 10px;">
																	<button class="btn edit"
																		onclick="openAnswerEdit('${item.boardQuestionNum}', '${memberId}','${ product.product_id}')">수정</button>
																</div>
															</c:if>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<c:if test="${memberId ne 'admin' and not empty memberId}">
							<button class="qa-button" onclick="openWrite('${product_id}')">문의
								하기</button>
						</c:if>
					</div>
					<!-- 페이징 버튼 -->
					<nav class="mt-3 mb-5">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${ inquiryPi.currentPage eq 1 }">
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Previous">
											<span aria-hidden="true"><i class="fa-solid fa-angles-left"
													style="color: gray;"></i></span>
										</a></li>
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Previous">
											<span aria-hidden="true"><i class="fa-solid fa-angle-left"
													style="color: gray;"></i></span>
										</a></li>

								</c:when>
								<c:otherwise>
									<li class="page-item">
										<!-- 1, 11, 21, 31, 41, .......... --> <a class="page-link"
											href="/product/detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${inquiryPi.startPage -1}"
											aria-label="Previous"> <span aria-hidden="true"><i
													class="fa-solid fa-angles-left" style="color: gray;"></i></span>
										</a>
									</li>
									<li class="page-item"><a class="page-link"
											href="detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${ inquiryPi.currentPage -1 }"
											aria-label="Previous"> <span aria-hidden="true"><i
													class="fa-solid fa-angle-left" style="color: gray;"></i></span>
										</a></li>
								</c:otherwise>
							</c:choose>


							<c:forEach var="page" begin="${inquiryPi.startPage}" end="${inquiryPi.endPage}">
								<c:choose>
									<c:when test="${inquiryPi.currentPage eq page }">
										<li class="page-item"><a style="color: gray;" class="page-link active-page"
												href="/product/detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${page}">${page}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a style="color: gray;" class="page-link"
												href="/product/detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${page}">${page}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>


							<c:choose>
								<c:when test="${inquiryPi.currentPage eq inquiryPi.maxPage}">
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Next">
											<span aria-hidden="true"><i class="fa-solid fa-angle-right"
													style="color: gray;"></i></span>
										</a></li>
									<li class="page-item"><a class="page-link" href="javascript:" aria-label="Next">
											<span aria-hidden="true"><i class="fa-solid fa-angles-right"
													style="color: gray;"></i></span>
										</a></li>
								</c:when>
								<c:when test="${inquiryPi.endPage eq inquiryPi.maxPage}">
									<li class="page-item"><a class="page-link"
											href="/product/detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${inquiryPi.maxPage}"
											aria-label="Next"> <span aria-hidden="true"><i
													class="fa-solid fa-angles-right" style="color: gray;"></i></span>
										</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
											href="/product/detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${inquiryPi.currentPage + 1}"
											aria-label="Next"> <span aria-hidden="true"><i
													class="fa-solid fa-angle-right" style="color: gray;"></i></span>
										</a></li>
									<li class="page-item">
										<!-- 10, 20, 30, 40, .... --> <a class="page-link"
											href="/product/detail?rpage=${reviewPi.currentPage }&product_id=${product.product_id}&ipage=${inquiryPi.endPage + 1}"
											aria-label="Next"> <span aria-hidden="true"><i
													class="fa-solid fa-angles-right" style="color: gray;"></i></span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</section>

				<%@ include file="/WEB-INF/views/common/chat-button.jsp" %>
					<%@ include file="/WEB-INF/views/common/footer.jsp" %>


		</body>

		<script src="/resources/js/board/inquiry.js"></script>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
			integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
			crossorigin="anonymous"></script>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
			integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
			crossorigin="anonymous"></script>

		<script>
			//initialize with defaults
			$("#input-id").rating({
				'size': 'lg',
				'step': "1"

			});
		</script>

		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
			integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
			integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
			crossorigin="anonymous"></script>

		<script src="/resources/js/board/inquiry.js"></script>



		</html>