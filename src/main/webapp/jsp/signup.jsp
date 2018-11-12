<%--
  Created by IntelliJ IDEA.
  User: saget
  Date: 10.11.2018
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Material Design Bootstrap</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

<!-- Main navigation -->
<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar">
        <a href="home" class="navbar-brand badge badge-pill badge-secondary mt-2 mr-auto"><strong class="white-text px-3">MAGIC MUSIC <i class="fas fa-music"></i></strong></a>
    </nav>
    <!-- Navbar -->
    <!-- Full Page Intro -->
    <div class="view  jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('https://mdbootstrap.com/img/Photos/Others/gradient2.png'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <!-- Mask & flexbox options-->
        <div class="mask rgba-purple-slight d-flex justify-content-center align-items-center">
            <!-- Content -->
            <div class="container">
                <!--Grid row-->
                <div class="row wow fadeIn d-flex justify-content-center">
                    <div class="col-lg-10">
                        <div class="card wow fadeInUp">

                            <!--Card content-->
                            <div class="card-body wow fadeInUp">

                                <!-- Form -->
                                <form method="post" name="">
                                    <!-- Heading -->
                                    <h3 class="card-header rgba-purple-strong text-white text-center">
                                        <strong>Sign Up</strong>
                                    </h3>
                                    <hr>

                                    <div class="md-form">
                                        <i class="fa fa-user prefix grey-text"></i>
                                        <input type="text" name="firstName" id="form1" class="form-control">
                                        <label for="form1">First name</label>
                                    </div>
                                    <div class="md-form">
                                        <i class="fa fa-user prefix grey-text"></i>
                                        <input type="text" name="lastName" id="form2" class="form-control">
                                        <label for="form2">Last name</label>
                                    </div>
                                    <div class="md-form">
                                        <i class="fas fa-key prefix grey-text"></i>
                                        <input type="password" name="password" id="form3" class="form-control">
                                        <label for="form3">Password</label>
                                    </div>
                                    <div class="md-form">
                                        <i class="fa fa-envelope prefix grey-text"></i>
                                        <input type="email" name="email" id="form4" class="form-control">
                                        <label for="form4">Your email</label>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-secondary">Send</button>
                                        <hr>
                                    </div>

                                </form>
                                <!-- Form -->

                            </div>
                        </div>
                    </div>
                    <!--Grid row-->
                </div>
                <!-- Content -->
            </div>
            <!-- Mask & flexbox options-->
        </div>
    </div><!-- Full Page Intro -->
</header>

<!-- Footer -->
<footer class="page-footer font-small purple-gradient darken-3">

    <!-- Footer Elements -->
    <div class="container">
        <!-- Grid row-->
        <div class="row">

            <!-- Grid column -->
            <div class="col-md-12 py-5">
                <div class="mb-5 flex-center">

                    <!-- Facebook -->
                    <a class="fb-ic">
                        <i class="fab fa-facebook fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic">
                        <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic">
                        <i class="fab fa-google-plus fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic">
                        <i class="fab fa-linkedin fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic">
                        <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Pinterest-->
                    <a class="pin-ic">
                        <i class="fab fa-pinterest fa-lg white-text fa-2x"> </i>
                    </a>
                </div>
            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row-->

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
        <a href="https://mdbootstrap.com/education/bootstrap/"> Magicmusic.com</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->

<!--Section: Testimonials v.1-->

<!-- Grid row -->
<!-- Main navigation -->
<!-- /Start your project here-->

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
</body>
<script type="text/javascript">
    new WOW().init();
</script>

</html>
