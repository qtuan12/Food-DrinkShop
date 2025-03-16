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

        <title>Fast Food Shop By Tuan</title>

        <!-- Bootstrap core css -->
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

        <style>
            body {
                background-color: #f4f4f4;
                font-family: 'Arial', sans-serif;
            }

            .hero_area {
                position: relative;
                overflow: hidden;
                text-align: center;
                color: white;
            }

            .hero_area img {
                width: 100%;
                height: auto;
                filter: brightness(0.6);
            }

            .food_section {
                background-color: white;
                padding: 60px 0;
            }

            .food_section .heading_container h2 {
                font-size: 2.5rem;
                margin-bottom: 30px;
                color: #333;
            }

            .filters_menu {
                display: flex;
                justify-content: center;
                list-style: none;
                padding: 0;
                margin-bottom: 30px;
            }

            .filters_menu li {
                margin-right: 15px;
            }

            .filters_menu li a {
                color: #333;
                text-decoration: none;
                padding: 10px 20px;
                border: 2px solid transparent;
                border-radius: 5px;
                transition: border-color 0.3s;
            }

            .filters_menu li a:hover {
                border-color: #ff6f61;
            }

            .box {
                border-radius: 8px;
                overflow: hidden;
                transition: transform 0.3s;
                background-color: #fff;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            }

            .box:hover {
                transform: translateY(-5px);
            }

            .detail-box h5 {
                font-weight: bold;
                margin: 15px 0;
            }

            .about_section {
                padding: 60px 0;
                background-color: #e9ecef;
            }

            .about_section .heading_container h2 {
                color: #007bff;
            }

            .book_section {
                background-color: #fff;
                padding: 60px 0;
            }

            .book_section .form-control {
                border-radius: 5px;
            }

            .btn_box button {
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                transition: background-color 0.3s;
            }

            .btn_box button:hover {
                background-color: #0056b3;
            }

            /* Responsive styles */
            @media (max-width: 768px) {
                .filters_menu {
                    flex-direction: column;
                    align-items: center;
                }

                .filters_menu li {
                    margin-bottom: 10px;
                }

                .food_section .heading_container h2 {
                    font-size: 2rem;
                }

                .about_section .detail-box p {
                    font-size: 0.9rem;
                }
            }
            .btn-rect {
                display: inline-block; /* Make it an inline block */
                padding: 10px 20px; /* Add padding for size */
                background-color: #007bff; /* Background color */
                color: white; /* Text color */
                border: none; /* No border */
                border-radius: 5px; /* Slightly rounded corners */
                text-align: center; /* Center the text */
                text-decoration: none; /* Remove underline */
                transition: background-color 0.3s; /* Smooth background transition */
            }

            .btn-rect:hover {
                background-color: #0056b3; /* Darker shade on hover */
            }
         


        </style>
    </head>

    <body>
        <div class="hero_area">
            <div class="bg-box">
                <img src="images/x.jpg" alt="Background Image">
            </div>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="slider.jsp"></jsp:include>
            </div>



            <!-- Food section -->
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


        </section>

        <!-- End food section -->

        <!-- About section -->
        
        </section>
        <!-- End about section -->

        <!-- Book section -->
        <section class="book_section layout_padding">
            <div class="container">
                <div class="heading_container">
                    <h2>Book A Table</h2>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form_container">
                            <form action="home" method="post" onsubmit="return checkLogin();">
                                <div>
                                    <input type="text" class="form-control" placeholder="Your Name" required />
                                </div>
                                <div>
                                    <input type="text" class="form-control" placeholder="Phone Number" required />
                                </div>
                                <div>
                                    <input type="email" class="form-control" placeholder="Your Email" required />
                                </div>
                                <div>
                                    <select class="form-control nice-select wide" required>
                                        <option value="" disabled selected>How many persons?</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                                <div>
                                    <input type="date" class="form-control" required>
                                </div>
                                <div class="btn_box">
                                    <button type="submit">Book Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="map_container">
                            <div id="googleMap"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End book section -->

        <script>
            function checkLogin() {
                var user = '<c:out value="${sessionScope.acc}" />';
                if (!user || user.trim() === '') {
                    alert('Please log in to book a table.');
                    window.location.href = 'login'; // Redirect to login page
                    return false; // Prevent form submission
                }
                alert('Your booking is being processed...');
                return true; // Allow form submission if logged in
            }
        </script>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- Popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- Owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <!-- Isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- Nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- Custom js -->
        <script src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>

    </body>

</html>
