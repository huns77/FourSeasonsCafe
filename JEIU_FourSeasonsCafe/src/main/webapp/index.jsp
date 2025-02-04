<%@page import="com.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

  <head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Main Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css" />
    <link rel="stylesheet" type="text/css" href="./css/index.css" />
  </head>

  <body>

    <jsp:include page="./templates/header.jsp"/>


    <main class="container-fluid">
      <section class="container">
        <div id="carouselExampleIndicators" class="carousel slide">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
              aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
              aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
              aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="./images/slider/slider-1.png" class="d-block w-100 slider-img" alt="slide-1">
            </div>
            <div class="carousel-item">
              <img src="./images/slider/slider-2.png" class="d-block w-100 slider-img" alt="slide-2">
            </div>
            <div class="carousel-item">
              <img src="./images/slider/slider-3.jpg" class="d-block w-100 slider-img" alt="slide-3">
            </div>
          </div>
        </div>
      </section>

      <section class="container py-5">
        <div class="row justify-content-around text-center">
          <div class="card" style="width: 18rem;">
            <div><img src="./images/card/card_coffee.png" class="card-img-top" alt="coffee"></div>
            <div class="card-body">
              <h5 class="card-title">Coffee</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              <a href="#" class="btn link-btn">Explore more → </a>
            </div>
          </div>

          <div class="card text-center" style="width: 18rem;">
            <div><img src="./images/card/card_nonCoffee.png" class="card-img-top" alt="non_coffee"></div>
            <div class="card-body">
              <h5 class="card-title">Non Coffee</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              <a href="#" class="btn link-btn">Explore more → </a>
            </div>
          </div>

          <div class="card" style="width: 18rem;">
            <div><img src="./images/card/card_tea.png" class="card-img-top" alt="tea"></div>
            <div class="card-body">
              <h5 class="card-title">Tea</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              <a href="###" class="btn link-btn">Explore more → </a>
            </div>
          </div>

          <div class="card align-text-center" style="width: 18rem;">
            <div><img src="./images/card/card_blender.png" class="card-img-top" alt="blender"></div>
            <div class="card-body">
              <h5 class="card-title">Blender</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              <a href="#" class="btn link-btn">Explore more → </a>
            </div>
          </div>
        </div>
      </section>

      <section class="container mb-4">
        <div class="row p-4 justify-content-between text-center">
          <div class="col-2"><a href="https://g-sa.kcookart.com/2022/edu/barista.asp"><img src="./images/banner/banner-1.png" alt="코리아 요리아트 아카데미" class="banner"></a></div>
          <div class="col-2"><a href="https://www.hscook.com/product/productOffline.do?categoryCode=C0103001"><img src="./images/banner/banner-2.png" alt="한솔요리학원" class="banner"></a></div>
          <div class="col-2"><a href="http://www.eduadd.co.kr/goods/detail.php?Num=104&page=2&Section=100200&Category=100200304"><img src="./images/banner/banner-3.png" alt="교육더하기" class="banner"></a></div>
          <div class="col-2"><a href="http://www.happinessoop.com/product/%EB%B0%94%EB%A6%AC%EC%8A%A4%ED%83%80-%EC%B2%B4%ED%97%98"><img src="	http://happinessoop.com/wp-content/uploads/2018/03/logo.png" alt="행복한 체험" class="banner"></a></div>
        </div>
      </section>
    </main>

	<jsp:include page="./templates/footer.jsp"/>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
  </body>
  

</html>