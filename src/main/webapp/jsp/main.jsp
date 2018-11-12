<%--
  Created by IntelliJ IDEA.
  User: saget
  Date: 10.11.2018
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/amplitudejs@v3.3.1/dist/amplitude.js"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<head>
    <%--<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">--%>
    <title>Magic Music</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="/css/mdb.min.css">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<script>
    function updatePlaylist() {
        let songs = Amplitude.getSongs();
        let listHtml = "";
        for (let i = 0; i < songs.length; i++) {
            listHtml += '<a onclick="playSong(';
            listHtml += i;
            listHtml += ')" class="list-group-item list-group-item-action list-group-item-danger bg-secondary white-text">';
            listHtml += songs[i].artist;
            listHtml += ' - ';
            listHtml += songs[i].name;
            listHtml += '<button onclick="removeSong(';
            listHtml += i;
            listHtml += ')" class="btn btn-secondary waves-effect px-1 py-1 float-right"><i class="fas fa-minus rgba-purple-light" aria-hidden="true"></i></button></a>';
            listHtml += '</a>';
        }
        $("#playlist").html(listHtml);
    }

    function logOut() {
        $.ajax({
            type: 'post',
            url: '/logout',     // URL - сервлет
            data: {                // передаваемые сервлету данные
            }
        }).done(function () {
            window.location.href = "/home"
        }).fail(function () {
            alert("НЕ ОЧ");
        });
    }

    $(document).ready(function () {
        // вызов функции после потери полем 'userName' фокуса
        $.ajax({
            type: 'post',
            url: '/main',     // URL - сервлет
            data: {                 // передаваемые сервлету данные
            }
        }).done(function (data) {
            var songs = [];
            for (let i = 0; i < data.length; i++) {
                let song = {};
                song.id = data[i].id;
                song.text = data[i].text;
                song.name = data[i].name;
                song.artist = data[i].singer.name;
                song.url = data[i].url;
                songs.push(song)
            }
            Amplitude.init({
                "songs": songs,
                "volume": 35
            });
            updatePlaylist()
        }).fail(function () {
            alert("НЕ ОЧ");
        });
    });

    function addSong(id) {
        $.ajax({
            type: 'post',
            url: '/addsong',     // URL - сервлет
            data: {
                songId: id               // передаваемые сервлету данные
            }
        }).done(function (data) {
            let song = {};
            song.id = data.id;
            song.name = data.name;
            song.artist = data.singer.name;
            song.url = data.url;
            Amplitude.addSong(song);
            updatePlaylist()
        }).fail(function () {
            alert("НЕ ОЧ");
        });
    }

    function removeSong(index) {
        let songs = Amplitude.getSongs();
        let currentSong = songs[index];
        $.ajax({
            type: 'post',
            url: '/removesong',     // URL - сервлет
            data: {
                songId: currentSong.id               // передаваемые сервлету данные
            }
        }).done(function () {
            Amplitude.removeSong(index);
            updatePlaylist()
        }).fail(function () {
            alert("НЕ ОЧ");
        });
    }
    function updateLyrics() {

    }

    function profile() {
        window.location.href = "/profile"
    }

    function playSong(index) {
        Amplitude.playSongAtIndex(index)
    }

</script>

<body>

<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar">
        <a href="home" class="navbar-brand badge badge-pill badge-secondary mt-2 mr-auto"><strong
                class="white-text px-3">MAGIC MUSIC <i class="fas fa-music"></i></strong></a>
        <button type="button" id="profile" onclick="profile()" class="btn btn-pink"><i class="fas fa-user-alt"
                                                                                       aria-hidden="true"></i> Профиль
        </button>
        <button type="button" id="logOut" onclick="logOut()" class="btn btn-pink"><i class="fas fa-share-square"
                                                                                     aria-hidden="true"></i> Выйти
        </button>
    </nav>
    <!-- Navbar -->
    <!-- Full Page Intro -->
    <div class="view  jarallax" data-jarallax='{"speed": 0.2}'
         style="background-image: url('https://mdbootstrap.com/img/Photos/Others/gradient2.png'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <!-- Mask & flexbox options-->
        <div class="mask rgba-purple-slight d-flex justify-content-center align-items-center">
            <!-- Content -->
            <div class="container">
                <!--Grid row-->
                <div class="row d-flex justify-content-center">
                    <h1 class="text-secondary font-weight-bold">TOP CHARTS</h1>
                </div>
                <div class="row wow fadeIn">
                    <div class="col-lg-4 col-md-12">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay zoom">
                                <img src="img/origins.jpeg" class="card-img-top"
                                     alt="zoom">
                                <a>
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!--Card content-->
                            <div class="card-body rgba-deep-purple-strong">
                                <!--Title-->
                                <h4 class="card-title text-center">Origins</h4>
                                <!--Text-->
                                <div class="list-group">
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Imagine
                                        Dragons - Bad Liar
                                        <button onclick="addSong(17)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Imagine
                                        Dragons - Machine
                                        <button onclick="addSong(18)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Imagine
                                        Dragons - Natural
                                        <button onclick="addSong(19)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->
                    <div class="col-lg-4 col-md-12">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay zoom">
                                <img src="img/lp.jpg" class="card-img-top"
                                     alt="zoom">
                                <a>
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!--Card content-->
                            <div class="card-body rgba-deep-purple-strong ">
                                <!--Title-->
                                <h4 class="card-title text-center">One more light</h4>
                                <!--Text-->
                                <div class="list-group">
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Linkin
                                        Park - Good goodbye
                                        <button onclick="addSong(20)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Linkin
                                        Park - One More Light
                                        <button onclick="addSong(21)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Linkin
                                        Park - Sorry for Now
                                        <button onclick="addSong(22)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->
                    <div class="col-lg-4 col-md-12">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay zoom">
                                <img src="img/rap.jpg" class="card-img-top"
                                     alt="zoom">
                                <a>
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!--Card content-->
                            <div class="card-body rgba-deep-purple-strong">
                                <!--Title-->
                                <h4 class="card-title text-center">Rap</h4>
                                <div class="list-group">
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Хаски
                                        - Иуда
                                        <button onclick="addSong(15)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">XXXTENTACION
                                        - Moonlight
                                        <button onclick="addSong(13)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                    <a href="#!" class="list-group-item list-group-item-action bg-secondary text-white">Pharaoh
                                        - Не по пути
                                        <button onclick="addSong(11)"
                                                class="btn btn-secondary waves-effect px-1 py-1 float-right"><i
                                                class="fas fa-plus rgba-purple-light" aria-hidden="true"></i></button>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                </div>
                <!-- Content -->
            </div>
            <!-- Mask & flexbox options-->
        </div>
    </div>
    <!-- Full Page Intro -->
</header>

<hr class="my-3">

<nav class="nav navbar-expand-lg fixed-bottom purple-gradient py-4 mb-4 mb-md-0 font-weight-bold z-depth-1">
    <div class="container d-flex flex-row">
        <div class="col-lg-2">
            <span class="amplitude-prev">
                <a type="button" class="btn-floating btn-lg btn-purple px-1"><i class="fas fa-backward mx-2"
                                                                                aria-hidden="true"></i></a>
            </span>
            <span class="amplitude-play-pause" amplitude-main-play-pause="true">
                <a type="button" class="btn-floating btn-lg btn-purple px-1"><i class="fas fa-play-circle mx-2"
                                                                                aria-hidden="true"></i></a>
            </span>
            <span class="amplitude-next">
                <a type="button" class="btn-floating btn-lg btn-purple px-1"><i class="fas fa-forward mx-2"
                                                                                aria-hidden="true"></i></a>
            </span>
        </div>
        <div class="col-lg-2">
            <div class="d-flex justify-content-center">
                <i class="fas fa-volume-up white-text mt-2 mx-3"></i>
                <input type="range" class="custom-range amplitude-volume-slider mt-2" value="35" min="0" max="100"/>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="d-flex justify-content-center">
                <span class="amplitude-current-time whit-text mt-1 mr-1" amplitude-main-current-time="true"></span>
                <input type="range" class="custom-range amplitude-song-slider mt-2" amplitude-main-song-slider="true"
                       step=".1"/>
                <span class="amplitude-time-remaining white-text mt-1 ml-1"
                      amplitude-main-time-remaining="true"></span>
            </div>
        </div>
        <div class="col-lg-3">
            <a class="badge badge-secondary hoverable mt-2" data-toggle="modal"
               data-target="#infoSong">
                <span amplitude-song-info="artist" amplitude-main-song-info="true" class="white-text"></span>
                <span class="white-text">-</span>
                <span amplitude-song-info="name" amplitude-main-song-info="true" class="white-text"></span>
            </a>
        </div>
        <div class="col-lg">
            <a id="modalActivate" type="button" class="btn-floating btn-lg btn-purple px-1" data-toggle="modal"
               data-target="#exampleModalPreview">
                <i class="fas fa-outdent mx-2" aria-hidden="true"></i>
            </a>
        </div>
    </div>
</nav>
<!-- Modal -->
<div class="modal fade right" id="exampleModalPreview" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-height modal-right" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-secondary align-content-center" id="exampleModalPreviewLabel">Playlist</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="list-group" id="playlist">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->

<!-- Modal -->
<div class="modal fade left" id="infoSong" tabindex="-1" role="dialog"
     aria-labelledby="infoSongLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-height modal-left" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title purple-text text-center" id="infoSongLabel">
                    <span amplitude-song-info="artist" amplitude-main-song-info="true" class="text-secondary"></span>
                    <span class="text-secondary">-</span>
                    <span amplitude-song-info="name" amplitude-main-song-info="true" class="text-secondary"></span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h6 class="purple-text text-center"><span class="made-up-key" amplitude-song-info="text"
                                                         amplitude-main-song-info="true"></span></h6>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->


<!-- Footer -->
<footer class="page-footer font-small purple-gradient darken-3 mb-4">

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
        <a href="#"> Magicmusic.com</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->

</body>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/js/mdb.min.js"></script>
<script type="text/javascript">new WOW.init()</script>
</html>
