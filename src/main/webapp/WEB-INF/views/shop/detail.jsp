<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <style>

            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

            body {
                font-family: "Poppins", sans-serif;
                color: #444444;
            }

            a,
            a:hover {
                text-decoration: none;
                color: inherit;
            }

            .section-products {
                padding: 80px 0 54px;
            }

            .section-products .header {
                margin-bottom: 50px;
            }

            .section-products .header h3 {
                font-size: 1rem;
                color: #fe302f;
                font-weight: 500;
            }

            .section-products .header h2 {
                font-size: 2.2rem;
                font-weight: 400;
                color: #444444;
            }

            .section-products .single-product {
                margin-bottom: 26px;
            }

            .section-products .single-product .part-1 {
                position: relative;
                height: 290px;
                max-height: 290px;
                margin-bottom: 20px;
                overflow: hidden;
            }

            .section-products .single-product .part-1::before {
                position: absolute;
                content: "";
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: -1;
                transition: all 0.3s;
            }

            .section-products .single-product:hover .part-1::before {
                transform: scale(1.2, 1.2) rotate(5deg);
            }

            .section-products .single-product .part-1 .discount,
            .section-products .single-product .part-1 .new {
                position: absolute;
                top: 15px;
                left: 20px;
                color: #ffffff;
                background-color: #fe302f;
                padding: 2px 8px;
                text-transform: uppercase;
                font-size: 0.85rem;
            }

            .section-products .single-product .part-1 .new {
                left: 0;
                background-color: #444444;
            }

            .section-products .single-product .part-1 ul {
                position: absolute;
                bottom: -41px;
                left: 20px;
                margin: 0;
                padding: 0;
                list-style: none;
                opacity: 0;
                transition: bottom 0.5s, opacity 0.5s;
            }

            .section-products .single-product:hover .part-1 ul {
                bottom: 30px;
                opacity: 1;
            }

            .section-products .single-product .part-1 ul li {
                display: inline-block;
                margin-right: 4px;
            }

            .section-products .single-product .part-1 ul li a {
                display: inline-block;
                width: 40px;
                height: 40px;
                line-height: 40px;
                background-color: #ffffff;
                color: #444444;
                text-align: center;
                box-shadow: 0 2px 20px rgb(50 50 50 / 10%);
                transition: color 0.2s;
            }

            .section-products .single-product .part-1 ul li a:hover {
                color: #fe302f;
            }

            .section-products .single-product .part-2 .product-title {
                font-size: 1rem;
            }

            .section-products .single-product .part-2 h4 {
                display: inline-block;
                font-size: 1rem;
            }

            .section-products .single-product .part-2 .product-old-price {
                position: relative;
                padding: 0 7px;
                margin-right: 2px;
                opacity: 0.6;
            }

            .section-products .single-product .part-2 .product-old-price::after {
                position: absolute;
                content: "";
                top: 50%;
                left: 0;
                width: 100%;
                height: 1px;
                background-color: #444444;
                transform: translateY(-50%);
            }

            .list-link {
                margin: 0;
                padding: 0;
                list-style: none;
                gap: 30px;
            }

            .link {
                font-size: 1.2rem;
                font-weight: bold;
                text-transform: uppercase;
                color: #d8d8d8;
            }

            .link:hover {
                color: #afafaf;
                padding-bottom: 5px;
                border-bottom: 3px solid;
            }


            .info-img {
                width: 640px;
                height: 640px;
            }


            /* review */
            .review-box {
                width: 80%;
                margin: 0 auto;
            }

            .score-box {
                width: 80%;
                margin: 0 auto;
                height: 150px;
            }

            .score-chart {
                width: inherit;
                height: inherit;
            }

            .score-box-2 {
                width: 100%;
                height: 100%;
                border: 1px solid #bfbfbf;
            }

            .review-save {
                width: 233px;
                height: 36px;
                border: 0px;
                background-color: rgba(113, 113, 113, 1);
                color: white;
                cursor: pointer;
                border: 1px solid #bfbfbf;
                border-top: none;
                border-bottom: none;
                border-left: none;
            }

            .review-button {
                width: 236px;
                height: 36px;
                border: 0;
                color: #575757;
                cursor: pointer;
                background: white;
                border: 1px solid #bfbfbf;
                border-top: none;
                border-bottom: none;
                border-right: none;
            }

            .review-button-box {
                border: 1px solid #bfbfbf;
                border-top: none;
            }
            .qa-button{
                width: 233px;
                height: 36px;
                border: none;
                background-color: rgba(113, 113, 113, 1);
                color: white;
            }
        </style>

    </head>

    <body>

		
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>
		


        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0 product-img"
                            src="https://cheat-key.com/web/product/big/202310/d56ff276a3d90dc9da74dc2220dfc37a.jpg"
                            alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">Shop item template</h1>
                        <p class="lead">
                            토톰한 두께감에 슈퍼스판까지😍
                        </p>
                        <div class="fs-5">
                            <span>가격 : </span>
                            <span>3500원</span>
                        </div>
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">찜하기</button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">장바구니</button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <ul class="d-flex list-link">
                    <li class="li-link">
                        <a class="link" href="#info">
                            info
                        </a>
                    </li>
                    <li class="li-link">
                        <a class="link">
                            guide
                        </a>
                    </li>
                    <li class="li-link">
                        <a href="#review" class="link">
                            reviews
                        </a>
                    </li>
                    <li class="li-link">
                        <a class="link">
                            q&a
                        </a>
                    </li>
                </ul>
            </div>
        </section>

        <section class="py-5" id="info">
            <h1 class="d-flex justify-content-center text-uppercase">
                Info
            </h1>
            <div class="container px-4 px-lg-5 my-5 d-flex justify-content-center flex-wrap gap-5">
                <img class="info-img"
                    src="https://cheat-key.com/web/product/big/202310/d56ff276a3d90dc9da74dc2220dfc37a.jpg" />
                <img class="info-img"
                    src="https://cheat-key.com/web/product/big/202310/d56ff276a3d90dc9da74dc2220dfc37a.jpg" />
                <img class="info-img"
                    src="https://cheat-key.com/web/product/big/202310/d56ff276a3d90dc9da74dc2220dfc37a.jpg" />
                <img class="info-img"
                    src="https://cheat-key.com/web/product/big/202310/d56ff276a3d90dc9da74dc2220dfc37a.jpg" />
            </div>
        </section>

        <div class="py-5 container">

            <div class="score-box ">
                <div class="score-box-2 d-flex align-items-center">
                    <div>
                        <h1>45</h1>
                    </div>
                    <canvas style="width: 100%; height: 100%;" class="score-chart" id="myChart"></canvas>
                </div>
                <div class="review-button-box text-end d-flex justify-content-end">
                    <button class="review-button">후기게시판</button>
                    <button class="review-save">리뷰 등록하기</button>
                </div>
            </div>
        </div>

        <script>
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
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
                    labels: ['5 Starts', '4 Starts', '3 Starts', '2 Starts', '1 Starts'],
                    datasets: [{
                        data: [12, 100, 3, 5, 2, 3],
                        backgroundColor: [
                            'rgba(113, 113, 113, 1)',
                            'rgba(113, 113, 113, 1)',
                            'rgba(113, 113, 113, 1)',
                            'rgba(113, 113, 113, 1)',
                            'rgba(113, 113, 113, 1)'
                        ],
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

            <div class="row review-box">

                <div class="col-md-12">

                    <div class="headings d-flex justify-content-between align-items-center mb-3">
                        <h5>Unread Review(6)</h5>
                    </div>
                    <div class="card p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="user d-flex flex-row align-items-center">
                                <img src="https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png"
                                    width="30" class="user-img rounded-circle mr-2">
                                <span>
                                    <small class="font-weight-bold text-primary">닉네임</small>
                                    <small class="font-weight-bold">상품명</small>
                                </span>
                            </div>
                            <small>
                                작성날짜
                            </small>
                        </div>
                        <div class="mt-2 px-4">
                            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Hic sunt nam maxime provident
                            nesciunt voluptatum sapiente aperiam perferendis non doloribus autem accusantium, quaerat,
                            quas illum enim deleniti nulla error alias.
                        </div>

                        <div class="action d-flex justify-content-between mt-2 align-items-center">

                            <div class="reply px-4">
                                <small>리뷰 삭제(작성자 한테만 보이게)</small>
                                <span class="dots"></span>
                                <small>추천</small>
                                <span class="dots"></span>
                                <small>비추천</small>

                            </div>

                            <div class="icons align-items-center">

                                <div>이리뷰를 0명이 좋아요 합니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- q&a 게시판 -->

        <section class="container py-5">
            <div class="table-container text-end">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>배송 문의</td>
                            <td>정**</td>
                            <td>2023-10-11</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
                <button class="qa-button">문의 하기</button>
            </div>
        </section>

        <%@ include file="/WEB-INF/views/common/chat-button.jsp" %>


    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>


    </html>