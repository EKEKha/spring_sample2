<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />
 
    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap5" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="/css/tiny-slider.css" />
    <link rel="stylesheet" href="/css/aos.css" />
    <link rel="stylesheet" href="/css/style.css" />
    
    
    
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">
    

    <title>
      TS SHOP
    </title>
  </head>
  
  <body>
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close">
          <span class="icofont-close js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

    <nav class="site-nav">
      <div class="container">
        <div class="menu-bg-wrap">
          <div class="site-navigation">
            <a href="/" class="logo m-0 float-start">TENNIS SHOP</a>

            <ul
              class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end"
            >
              <li class="active"><a href="/">Home</a></li>
              <li class="has-children">
                <a href="javascript:void(0)">상품</a>
                <ul class="dropdown">
                  <li><a href="productList.do?prod_kind=racket">Racket</a></li>
                  <li><a href="productList.do?prod_kind=acc">ACC</a></li>
                  
                </ul>
              </li>
              
              <li class="has-children">
                <a href="javascript:void(0)">서비스</a>
                <ul class="dropdown">
                  <li><a href="review/list.do">Review</a></li>
                  <li><a href="board/list.do">QNA</a></li>
                  
                  
                </ul>
              </li>
              
              <c:if test="${login==null }">
	               <li><a href="joinForm">회원가입</a></li>
	              <li><a href="login">로그인</a></li>
              
              </c:if>
              
             
              <c:if test="${login!=null and login.mem_grade!=2}">
				<li><a href="cartList.do">장바구니</a></li>

				<li class="has-children"><a href="/">${login.mem_id}님환영합니다.</a>
					<ul class="dropdown">
						<li><a href="mypage?mem_id=${login.mem_id}">마이페이지</a></li>
						<li><a href="myOrder.do?mem_id=${login.mem_id }">주문내역</a></li>
						<li><a href="logout">로그아웃</a></li>
					</ul>
				</li>
			 </c:if>
			
			
			<c:if test="${login!=null and login.mem_grade==2}">
				<li><a href="login">장바구니</a></li>

				<li class="has-children"><a href="/">관리자님
						환영합니다.</a>
					<ul class="dropdown">
						<li><a href="">마이페이지</a></li>
						<li><a href="admina">관리자페이지</a></li>
						<li><a href="logout">로그아웃</a></li>
					</ul>
				</li>
			</c:if>
              
      </ul>

            <a
              href="#"
              class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
              data-toggle="collapse"
              data-target="#main-navbar"
            >
              <span></span>
            </a>
          </div>
        </div>
      </div>
    </nav>
	
  
  </body>
  
  
  
  
  
  
  
  
  
  
  </html>