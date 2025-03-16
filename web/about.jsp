<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Fiancé</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <style>
        .about_section {
            padding: 60px 0;
            background-color: #f8f9fa;
        }
        .about_section .img-box img {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .about_section .detail-box h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
        .about_section .detail-box p {
            line-height: 1.6;
            color: #555;
        }
        .about_section .detail-box a {
            display: inline-block;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .about_section .detail-box a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body class="sub_page">
    <div class="hero_area">
        <div class="bg-box">
            <img src="images/bg.jpg" alt="">
        </div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <!-- About section -->
    <section class="about_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="img-box">
                        <img src="images/nha.jpg" alt="About Fiancé">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are Fiancé</h2>
                        </div>
                        <p>
                            Fiancé has gradually conquered many customers and is loved by many for its delicious fried chicken. 
                            Our exclusive marinating recipe, featuring a blend of spices, sets us apart. 
                            This brand's chicken dishes tend to be mildly sweet, less spicy, and rich, making them suitable for young customers.
                        </p>
                        <a class="btn btn-primary" data-toggle="collapse" href="#moreInfo" role="button" aria-expanded="false" aria-controls="moreInfo">
                            Read More
                        </a>
                        <div class="collapse" id="moreInfo">
                            <div class="card card-body mt-3">
                                <p>
                                    Our chicken dishes are crafted with love and care, ensuring that every bite is a delightful experience. 
                                    We believe in using only the freshest ingredients, sourced locally wherever possible. 
                                    Our commitment to quality and customer satisfaction is at the heart of everything we do. 
                                    Join us on our journey to redefine fast food, making it enjoyable for everyone!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End about section -->

    <jsp:include page="footer.jsp"></jsp:include>

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=myMap"></script>
</body>
</html>
