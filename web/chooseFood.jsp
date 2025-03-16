<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="image/png">

        <title>Tcanh Shop</title>

        <!-- Bootstrap core CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- Nice select -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
        <<link rel="stylesheet" href="css/chooseFood.css"/>

    </head>

    <body class="sub_page">

        <div class="hero_area">
            <div class="bg-box">
                <img src="images/hero-bg.jpg" alt="Hero Background">
            </div>
            <jsp:include page="header.jsp"></jsp:include>
            </div>

            <!-- Food section -->
            <section class="food_section layout_padding-bottom">
                <div class="container">
                    <br>
                    <div class="heading_container heading_center">
                        <h2>Our Menu</h2>
                    </div>
                    <form action="search" method="post">
                        <input name="txt" type="text" placeholder="Search.." required value="${textSearch}">
                        <input type="hidden" name="index" value="1">
                        <button type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                    </form>

                    <!-- nếu không tìm thấy item by name --<!-- comment -->

                <c:if test="${not empty searchMessage}">
                    <div class="alert alert-warning">${searchMessage}</div>
                </c:if>


                <ul class="filters_menu">
                    <li class="${tag == 0 ? "active" : ""}"><a href="category?cid=0&index=1">All</a></li>
                        <c:forEach items="${listC}" var="o">
                        <li class="${tag == o.cid ? "active" : ""}"><a href="category?cid=${o.cid}&index=1">${o.cname}</a></li>
                        </c:forEach>
                </ul>

                <div class="filters-content">
                    <div class="row grid">
                        <c:forEach items="${listF}" var="o">
                            <div class="col-sm-6 col-lg-4 all pizza">
                                <div class="box">
                                    <div class="img-box">
                                        <a href="detail?fid=${o.id}"><img src="${o.image}" alt="${o.name}"></a>
                                    </div>
                                    <div class="detail-box">
                                        <h5><a href="detail?fid=${o.id}">${o.name}</a></h5>
                                        <p>${o.description}</p>
                                        <div class="options">
                                            <h6>Price: ${o.price}$</h6>

                                            <button onclick="location.href = 'detail?fid=${o.id}'" class="detail-btn btn-rect">Detail</button>


                                            <a href="addToCart?fid=${o.id}" onclick="alert('Item added to cart!'); return true;">
                                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 456.029 456.029" width="20" height="20">
                                                <g>
                                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                                </g>
                                                <g>
                                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                                </g>
                                                <g>
                                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                                </g>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
            <div class="pagination">

                <c:forEach begin="1" end="${endPage}" var="i">
                    <a href="category?cid=${tag}&index=${i}" class="page-link">
                        ${i}
                    </a>
                </c:forEach>
            </div>


            <div class="pagination">
                <c:forEach begin="1" end="${endPageSearch}" var="i">
                    <a href="search?txt=${txtSearch}&index=${i}" class="page-link">
                        ${i}
                    </a>
                </c:forEach>
            </div>


        </section>

        <!-- End food section -->

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.js"></script>
        <!-- Owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <!-- Isotope -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- Nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- Custom JS -->
        <script src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
    </body>

</html>
