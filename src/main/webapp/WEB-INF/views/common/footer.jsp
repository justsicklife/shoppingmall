<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    .footer {
        width: 100%;
        height: 300px;
        background: lightgray;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .email_box{
        
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 2rem;
        font-weight: 500;
        color: #323232;
		text-decoration: none;

    }
	.email_box:hover {
		color: #323232;
	}
    .email {
        margin-left: .5rem;

    }

</style>
<body>
    <footer class="footer">
        <a class="email_box">
            <i class="fa-solid fa-envelope"></i>  
            <span class="email">
                910527ksj@gmail.com
            </span>
        </a>
        <a class="email_box">
            <i class="fa-solid fa-envelope"></i> 
            <span class="email">
                justsicklife@gmail.com
            </span>
        </a>
    </footer>
</body>
</html>