
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    <!-- Map Begin -->
    <style>
        #map03 > #map {
            width : 1120px;
            height : 400px;
            border : 2px solid greenyellow;
        }
    </style>
    <script>
        let map03 = {
            map:null,
            init: function () {
                //다양한 초기화를 해주는 init
                //여기서는 버튼에 대한 초기 값을 설정해주는 역할
                //map이라는 변수가 선언된 이유는 전역적으로 사용하기 위함이므로 밖에서 선언

                this.display();
                // $('#s_btn').click(function () {
                //     map03.go(37.5857825,126.9828019,'s' );
                // });
                // $('#b_btn').click(function () {
                //     map03.go(35.1883491,129.2233197,'b');
                // });
                // $('#j_btn').click(function () {
                //     map03.go(33.2501708,126.5636786,'j');
                // });

            },
            display: function () {
                //**********************Map(지도)*********************
                var mapContainer = document.querySelector('#map03 > #map'); //지도를 표시할 div
                var mapOption = {
                    center: new kakao.maps.LatLng(37.5456385, 127.0534575), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
                };
                //map 생성
                map = new kakao.maps.Map(mapContainer, mapOption);

                //*********************Controller(컨트롤러)*********************
                // 지도종류컨트롤 : 일반지도 or 스카이뷰지도
                var mapTypeControl = new kakao.maps.MapTypeControl();
                // 아래는 지도 + 컨트롤 --> 지도위에 컨트롤 표시
                // kakao.maps.ControlPosition은 컨트롤이 표시될 위치 = topright
                map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
                // 줌컨트롤 : 확대 or 축소
                var zoomControl = new kakao.maps.ZoomControl();
                map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

                //*********************Marker(마커)*********************
                //map marker
                var markerPosition  = new kakao.maps.LatLng(37.5456385, 127.0534575);
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });
                marker.setMap(map);

            },
            go: function (lat,lng,loc) {
                // 지역을 클릭 시
                // 그 지역의 맛집만 나온다?

                var mapContainer = document.querySelector('#map03 > #map');
                var mapOption = {
                    center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
                };
                // map변수 최초 생성
                map = new kakao.maps.Map(mapContainer, mapOption);

                // map controller ( 지도 확대, 축소 )
                var mapTypeControl = new kakao.maps.MapTypeControl();
                map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
                var zoomControl = new kakao.maps.ZoomControl();
                map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

                //panTo라는 함수를 활용해서 지도가 이동
                // var moveLatLon = new kakao.maps.LatLng(lat, lng);
                // map.panTo(moveLatLon);

                //marker 표시하는 함수
                var markerPosition  = new kakao.maps.LatLng(lat, lng);
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });
                marker.setMap(map);
                //지도에 loc를 넣고 s,b,j 별 데이터 줘 !
                map03.markers(loc); // loc 정보로 -> marker를 받고자 요청
            },

            markers:function (loc){
                // $.ajax({
                //     url:'/markers',
                //     data:{'loc': loc}, // 서버에 s,b,j를 날리는 중
                //     success: function (data) {
                //         map03.displaymarkers(data);
                //     },
                // });
            },
            displaymarkers:function (positions) {
                // 그 데이터를 지도에 뿌려라! 함수
                // var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                // for (var i = 0; i < positions.length; i++) {
                //     var imageSize = new kakao.maps.Size(20, 30);
                //     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                //     var markerPosition = new kakao.maps.LatLng( positions[i].lat, positions[i].lng);
                //
                //     var marker = new kakao.maps.Marker({
                //         map: map,
                //         position : markerPosition,
                //         title : positions[i].title,
                //         image : markerImage
                //     });
                //     // infoWindow
                //     var iwContent = '<h2>'+positions[i].title+'</h2>';
                //     iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';
                //
                //     var infowindow = new kakao.maps.InfoWindow({
                //         // position : positions[i].latlng,
                //         position : markerPosition,
                //         content : iwContent
                //     });
                //
                //     kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                //     kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                //     kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].id));
                //
                //
                //     function mouseoverListener(marker, infowindow) {
                //         return function(){
                //             infowindow.open(map, marker);
                //         };
                //     }
                //     function mouseoutListener(marker, infowindow) {
                //         return function(){
                //             infowindow.close();
                //         };
                //     }
                //     function mouseclickListener(target) {
                //         return function(){
                //             location.href = '/map/detail?id='+target;
                //         };
                //     }
                // } // end for
            }

        };
        $(function(){
            map03.init();
        });
    </script>


<!-- Categories Section Begin -->
<section class="categories spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="categories__text">
                    <h2>Clothings Hot <br /> <span>Shoe Collection</span> <br /> Accessories</h2>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="categories__hot__deal">
                    <img src="/img/product-sale.png" alt="">
                    <div class="hot__deal__sticker">
                        <span>Sale Of</span>
                        <h5>$29.99</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 offset-lg-1">
                <div class="categories__deal__countdown">
                    <span>Deal Of The Week</span>
                    <h2>Multi-pocket Chest Bag Black</h2>
                    <div class="categories__deal__countdown__timer" id="countdown">
                        <div class="cd-item">
                            <span>3</span>
                            <p>Days</p>
                        </div>
                        <div class="cd-item">
                            <span>1</span>
                            <p>Hours</p>
                        </div>
                        <div class="cd-item">
                            <span>50</span>
                            <p>Minutes</p>
                        </div>
                        <div class="cd-item">
                            <span>18</span>
                            <p>Seconds</p>
                        </div>
                    </div>
                    <a href="#" class="primary-btn">Shop now</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="container" id="map03">
                        <div class="section-title">
                            <span>Location</span>
                            <h2>Location</h2>
                        </div>
                        <div id="map"></div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Information</span>
                            <h2>Contact Us</h2>
                            <p>As you might expect of a company that began as a high-end interiors contractor, we pay
                                strict attention.</p>
                        </div>
                        <ul>
                            <li>
                                <h4>Republic of Korea</h4>
                                <p>111, Achasan-ro, Seongdong-gu, Seoul <br />+82 982-314-0958</p>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Name">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Email">
                                </div>
                                <div class="col-lg-12">
                                    <textarea placeholder="Message"></textarea>
                                    <button type="submit" class="site-btn">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

