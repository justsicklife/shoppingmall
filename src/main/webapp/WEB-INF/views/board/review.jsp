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

        <style>
            /* comment */

            body {
                background-color: white
            }

            .card {

                border: none;
                /* box-shadow: 5px 6px 6px 2px #e9ecef; */
                border-radius: 4px;
                background: #f7f6f6;
            }


            .dots {

                height: 4px;
                width: 4px;
                margin-bottom: 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
            }

            .badge {

                padding: 7px;
                padding-right: 9px;
                padding-left: 16px;
                box-shadow: 5px 6px 6px 2px #e9ecef;
            }

            .user-img {

                margin-top: 4px;
            }

            .check-icon {

                font-size: 17px;
                color: #c3bfbf;
                top: 1px;
                position: relative;
                margin-left: 3px;
            }

            .form-check-input {
                margin-top: 6px;
                margin-left: -24px !important;
                cursor: pointer;
            }


            .form-check-input:focus {
                box-shadow: none;
            }


            .icons i {

                margin-left: 8px;
            }

            .reply {

                /* margin-left: 12px; */
            }

            .reply small {

                color: #b7b4b4;
            }

            .reply small:hover {
                color: green;
                cursor: pointer;
            }

            .baord {
                background: #f7f6f6;
            }

            .review-content {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }


            /* left-sidebar */

            .left-sidebar {
                position: fixed;
                width: 300px;
                height: 200px;
                left: 75px;
                top: 100px;
                background: #f7f6f6;
                display: flex;
                align-items: center;
            }

            .left-sidebar ul {
                padding-left: 50px;
                list-style: none;
                display: flex;
                gap: 5px;
                flex-direction: column;
            }

        </style>
    </head>

    <body>

	<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
        

        <div class="left-sidebar">
            <ul>
                <li>Notice</li>
                <li>q&a</li>
                <li>review</li>
            </ul>
        </div>

        <div id="review" class="container mt-5 pt-5">

            <div class="row  d-flex justify-content-center">

                <div class="col-md-8">

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
                        <div class="mt-2 px-4 review-content">
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