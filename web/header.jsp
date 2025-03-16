<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="css/font-awesome.min.css" rel="stylesheet" />

    <style>
        .header_section {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background: #202731; /* Màu nền của header */
            margin-bottom: 20px; /* Khoảng cách dưới header */
        }

        body {
            padding-top: 60px; /* Khoảng trống cho header */
            padding-bottom: 20px; /* Đảm bảo nội dung không bị đè lên */
        }

        .navbar-brand {
            display: flex;
            align-items: center; /* Căn giữa nội dung theo chiều dọc */
            background-image: url('https://cdn-icons-png.flaticon.com/512/2819/2819194.png');
            background-size: cover; /* Đảm bảo ảnh phủ kín */
            background-position: center; /* Căn giữa ảnh */
            width: 150px; /* Kích thước logo elip ngang */
            height: 80px; /* Chiều cao của logo */
            border-radius: 50px; /* Bo tròn logo thành hình elip */
            margin-right: 10px; /* Khoảng cách giữa logo và tên */
        }

        .navbar-brand span {
            color: black; /* Màu chữ của tên thương hiệu */
            font-size: 24px; /* Kích thước chữ */
            font-weight: bold; /* Chữ đậm */
            margin-left: 10px; /* Khoảng cách giữa logo và chữ */
        }

        .nav-link {
            color: white; /* Màu chữ cho các liên kết */
            margin-right: 15px; /* Khoảng cách giữa các liên kết */
        }

        .user_link {
            color: white;
            margin-right: 15px; /* Khoảng cách giữa các biểu tượng người dùng */
        }

        .order_online {
            color: white; /* Màu chữ cho liên kết giỏ hàng */
        }

        .cart-count {
            font-size: 0.8em; /* Kích thước nhỏ hơn */
            position: relative; /* Để có thể sử dụng top */
            top: -10px; /* Đẩy lên trên */
            left: 5px; /* Đẩy sang phải một chút */
            background-color: red; /* Màu nền đỏ cho số lượng */
            color: white; /* Màu chữ trắng */
            border-radius: 50%; /* Bo tròn */
            padding: 2px 5px; /* Khoảng cách xung quanh */
        }
    </style>
</head>
<body>

<!-- header section starts -->
<header class="header_section">
    <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
            <a class="navbar-brand" href="home"></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto">
                    <c:if test="${sessionScope.acc.isAdmin == 1 && sessionScope.acc.isSeller == 1}">
                        <li class="nav-item"><a href="managerFood" class="nav-link"><i class="fas fa-cog"></i> Manage</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isAdmin == 1 && sessionScope.acc.isSeller == 0}">
                        <li class="nav-item"><a href="managerFood" class="nav-link"><i class="fas fa-cog"></i> Manage</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isAdmin == 0 && sessionScope.acc.isSeller == 1}">
                        <li class="nav-item"><a href="managerOrder" class="nav-link"><i class="fas fa-cog"></i> Manage</a></li>
                    </c:if>
                    <li class="nav-item"><a class="nav-link" href="home"><i class="fas fa-home"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="category?cid=0&index=1"><i class="fas fa-utensils"></i> Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp"><i class="fas fa-info-circle"></i> About</a></li>
                    <c:if test="${sessionScope.acc != null}">
                        <li class="nav-item"><a class="nav-link" href="order?aid=${sessionScope.acc.id}"><i class="fas fa-shopping-cart"></i> Order</a></li>
                    </c:if>
                </ul>
            </div>
            <div style="justify-content: right">
                <div class="user_option">
                    <c:if test="${sessionScope.acc == null}">
                        <a href="login.jsp" class="user_link"><i class="fa fa-user" aria-hidden="true"></i></a>
                    </c:if>
                    <c:if test="${sessionScope.acc != null}">
                        <a href="profile?aid=${sessionScope.acc.id}" class="user_link"><i class="fa fa-user" aria-hidden="true"></i></a>
                        <a href="logout" class="user_link"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
                    </c:if>
                    <a class="cart_link order_online" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i> 
                        Cart 
                        <span class="cart-count">${size}</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
</header>
<!-- end header section -->

<!-- Thêm nội dung khác của trang ở đây -->

</body>
</html>
