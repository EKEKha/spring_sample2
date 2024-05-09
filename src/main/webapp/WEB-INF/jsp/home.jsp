<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-04-29
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="hero">
    <div class="hero-slide">
        <div class="img overlay"
             style="background-image: url('images/main1.jpg')"></div>
        <div class="img overlay"
             style="background-image: url('images/main2.jpg')"></div>
        <div class="img overlay"
             style="background-image: url('images/main4.jpg')"></div>
    </div>

    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-9 text-center">
                <h1 class="heading" data-aos="fade-up">Easiest way to find
                    your dream</h1>

            </div>
        </div>
    </div>
</div>





<div class="section">
    <div class="container">
        <div class="row mb-5 align-items-center">
            <div class="col-lg-6">
                <h2 class="font-weight-bold text-primary heading">신상품</h2>
            </div>
            <div class="col-lg-6 text-lg-end">
                <p>
                    <a href="/productList.do?prod_kind=racket"
                       class="btn btn-primary text-white py-3 px-4">View all
                        properties</a>
                </p>
            </div>
        </div>
        <div class="row">





            <div class="col-12">
                <div class="property-slider-wrap">
                    <div class="property-slider">
                        <c:forEach var="vo"  items="${main}" >
                            <div class="property-item">
                                <a href="prodcutDetail.do?prod_id=${vo.prod_id }" class="img">
<%--                                    <img src="upload/product/s_${vo.prod_image}" alt="Image" class="img-fluid" />--%>
                                    <img src="images/img_1.jpg" alt="Image" class="img-fluid" />
                                </a>


                                <div class="property-content">
                                    <div class="price mb-2">
                                        <span><fmt:formatNumber pattern="￦###,###,###원" value="${vo.prod_price}" /></span>
                                    </div>
                                    <div>
                  <span class="d-block mb-2 text-black-50"
                  ></span
                  >
                                        <span class="city d-block mb-3">${vo.prod_name}</span>

                                        <div class="specs d-flex mb-4">
                    <span class="d-block d-flex align-items-center me-3">

                      <span class="caption">&nbsp;</span>
                    </span>
                                            <span class="d-block d-flex align-items-center">

                      <span class="caption">&nbsp;</span>
                    </span>
                                        </div>

                                        <a
                                                href="/prodcutDetail.do?prod_id=${vo.prod_id }"
                                                class="btn btn-primary py-2 px-3"
                                        >See details</a
                                        >
                                    </div>
                                </div>
                            </div>
                            <!-- .item -->
                        </c:forEach>



                    </div>

                    <div id="property-nav" class="controls" tabindex="0"
                         aria-label="Carousel Navigation">
							<span class="prev" data-controls="prev" aria-controls="property"
                                  tabindex="-1">Prev</span> <span class="next"
                                                                  data-controls="next" aria-controls="property" tabindex="-1">Next</span>
                    </div>
                </div>
            </div>







        </div>
    </div>
</div>

<div class="section section-4 bg-light">
    <div class="container">
        <div class="row justify-content-center text-center mb-5">
            <div class="col-lg-5">
                <h2 class="font-weight-bold heading text-primary mb-4">
                    Know About Our Tennis Shop& Our History
                </h2>
                <p class="text-black-50">
                    We have a greate range of Racket and Equipment, designed to the same ellite standard of our Tennis Rackets, so you can flourish against your opposition indoors and out.
                </p>
            </div>
        </div>
        <div class="row justify-content-between mb-5">
            <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
                <div class="img-about dots">
                    <img src="/images/main66.jpg" alt="Image" class="img-fluid" />
                </div>
            </div>
            <div class="col-lg-4">
                <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
                    <div class="feature-text">
                        <h3 class="heading">Off shop</h3>
                        <p class="text-black-50">
                            dalgubeol-daero 251an-gil, Dalseo-gu, Daegu,
                            Republic of Korea
                        </p>
                    </div>
                </div>

                <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"></span>
              </span>
                    <div class="feature-text">
                        <h3 class="heading">Contact</h3>
                        <p class="text-black-50">
                            tennis-shop@hanmail.net<br>
                            +1955-1234
                    </div>
                </div>

                <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"></span>
              </span>
                    <div class="feature-text">
                        <h3 class="heading">Opening hours</h3>
                        <p class="text-black-50">
                            10:00am-09:00pm
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>



</body>
</html>
