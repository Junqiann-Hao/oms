<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>电子 - 静听网 - 140202011032_陈晓东</title>
  <link rel="stylesheet" href="../../assets/css/reset.css">
  <link rel="stylesheet" href="../../assets/css/common.css">
  <link rel="stylesheet" href="../../assets/css/category.css">
  <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
</head>
<body>
<header>
  <div class="container-userinfo">
    <div class="navbar-header-userinfo">
      <a href="" class="navbar-brand-userinfo">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="">
      </a>
    </div>
    <nav>
      <ul class="nav-userinfo navbar-nav-userinfo navbar-link">
        <li><a href="${pageContext.request.contextPath}/firstpageRequest">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=piano">钢琴</a></li>
        <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=guitar">吉他</a></li>
        <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=comic">动漫</a></li>
        <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=electric">电子</a></li>
      </ul>

      <ul class="nav-userinfo navbar-nav-userinfo navbar-right-userinfo navbar-sm-userinfo">
        <li><input type="text" class="search-input-userinfo" placeholder="歌名 / 歌手"></li>
        <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
        <c:if test="${sessionScope.user == null}">
          <li><a href="${pageContext.request.contextPath}/login">注册 / 登录</a></li>
        </c:if>
        <c:if test="${sessionScope.user !=null}">
          <li><a href="${pageContext.request.contextPath}/user/userinfo">${sessionScope.user.nickname}</a></li>
          <li><a href="${pageContext.request.contextPath}/exit">退出</a></li>
        </c:if>
      </ul>
    </nav>
  </div>
</header>
<div class="container-sm category-header-wrap">
  <div class="category-header-banner">
    <div class="img"
         style="background-image: url('../../storage/category/elect.jpg')">
      <div class="content">
        <h2>电子</h2>
        <p>Electronic</p>
      </div>
      <div class="mask"></div>
    </div>
  </div>
</div>
<div class="container-sm box">
  <div class="main">
    <div class="main-wrap">
      <div class="content-box">
        <div class="piano-list">
          <div class="content-header">
            <h2><i class="fa fa-music red"></i>最新音乐</h2>
          </div>
          <ul class="music-list clearfix">
            <c:forEach items="${categorymusicList}" var="music" varStatus="vs">
            <li>
              <div class="u-cover">
                <img src="${music.mpicurl}">
                <a title="${music.mtitle} - ${music.user.nickname}" href="/singlemusicView?Mid=${music.mid}" class="msk"></a>
              </div>
              <p class="dec">
                <a title="${music.mtitle} - ${music.user.nickname}" href="/singlemusicView?Mid=${music.mid}">${music.mtitle}</a>
              </p>
              <div class="author">${music.mauthor}</div>
              </c:forEach>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<footer>
  <div class="container">
    <div class="copyright">
      <p>Copyright © <span class="update-year">2018</span> 586 - All Rights Reserved&nbsp;&nbsp;|&nbsp;&nbsp;2015级
      </p>
    </div>
  </div>
</footer>
</body>
</html>
