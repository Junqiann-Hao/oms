<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${sessionScope.user.username} - ${sessionScope.user.nickname} - 静听网 </title>

    <!--修改-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/moco.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/profile-less.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/music.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/category.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
    <link rel="stylesheet" href="${pageContext.request. contextPath}/assets/css/userinfo.css">
    <link rel="stylesheet" type="text/css" href="../../assets/live2d/waifu.css"/>

    <title>个人主页</title>
</head>
<body>
<header>
    <div class="container-userinfo">
        <div class="navbar-header-userinfo">
            <a href="${pageContext.request.contextPath}/firstpageRequest" class="navbar-brand-userinfo">
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
                <li><input type="text" class="search-input-userinfo" id="search-input" placeholder="歌名 / 歌手"></li>
                <li><a id="search-btn"><i class="fa fa-search" aria-hidden="true"></i></a></li>
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
        <div class="img" style="background-image: url('../../storage/category/cartoon.jpg');">
            <div class="content">
                <h1 style="position: relative">${user.nickname} <span style="display: inline-block;position: absolute;top: -13px;"><img src="${pageContext.request.contextPath}/assets/images/奖章.png" width="60px" height="60px" alt="大会员"></span>
                    <span style="display: inline-block;position: relative;left: 22px; font-weight: 900">${level}</span>
                </h1>
                <p style="position: relative">所爱隔山海，山有径可寻，海有舟可渡<span style="position: absolute;top: -10px;left: 250px;display: inline">
                    <a href="${pageContext.request.contextPath}/user/userinfochange" style="display: inline-block;" ><img src="${pageContext.request.contextPath}/assets/images/修改.png" width="25px" height="25px" alt="个人信息修改">
                        </a></span>
                    <!--<span style="font-size: 2px;position: absolute;top: 4px;left: 275px">修改</span>-->
                </p>
            </div>
            <div class="mask"></div>
        </div>
    </div>
</div>


<div id="main">

    <div class="page-settings">
        <div class="top">
            <div class="w960 mauto top_title">
                <p>个人设置</p>
            </div>
        </div>
        <div class="setting pb10">
            <div class="nav-tabs pa">
                <h class="baseinfo fl active">基本信息</h>
                <div class="cb"></div>
            </div>
            <div class="contentBox">
                <div class="formBox" style="width: 60%">
                    <div class="login">

                        <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
                            <div class="form-group">
                                <label for="nickname" style="color: #00a0f0;">换个昵称，迎接一个新的心情吧</label>
                                <input type="hidden" name="uid" value="${user.uid}">
                                <input type="text" class="form-control" name="nickname" id="nickname" value="${user.nickname}"
                                       placeholder="昵&nbsp;&nbsp;称">
                            </div>

                            <div class="form-group">
                                <label for="password" style="color: #00a0f0;">麻烦输一哈新的密码</label>
                                <input type="password" class="form-control" name="password" id="password" value="${user.password}"
                                       placeholder="输入密码，见证律动" aria-describedby="inputSuccess3Status"
                                       onchange="check()">
                            </div>
                            <div class="form-group">
                                <label for="secondpassword" style="color: #00a0f0;">再次输一哈密码，确认一哈～</label>
                                <input type="password" class="form-control" id="secondpassword" value="${user.password}"
                                       placeholder="再次输入密码，契合共鸣" onchange="check()">
                            </div>
                            <div style="opacity: 0; color: rgba(255,42,242,0.6);" id="error">哎呀～&nbsp;两次输入密码不一致，重来一哈</div>
                            <button type="submit" class="button-sumbit"
                                    style="color: #00a0f0;font-size: 18px;font-weight: 900; margin-left: 230px; margin-top: 20px;text-decoration: none">
                                提&nbsp;&nbsp;交
                            </button>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="waifu">
    <div class="waifu-tips"></div>
    <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
    <div class="waifu-tool">
        <span class="fui-home"></span>
        <span class="fui-chat"></span>
        <span class="fui-eye"></span>
        <span class="fui-user"></span>
        <span class="fui-photo"></span>
        <span class="fui-info-circle"></span>
        <span class="fui-cross"></span>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>
<script src="../../assets/live2d/waifu-tips.js"></script>
<script src="../../assets/live2d/live2d.js"></script>
<script type="text/javascript">initModel("../../assets/live2d/")</script>


<script>
    function check() {
        var psd = $("#password").val();
        var spsd = $("#secondpassword").val();
        console.log("psd:" + psd);
        console.log("secondpsd" + spsd);
        if (spsd != "") {
            if (psd != spsd) {
                console.log("密码不一致");
                $("#error").css("opacity", "1");
            } else {
                console.log("两次输入密码一致");
                $("#error").css("opacity", "0");
            }
        } else {
            console.log("第一次输入");
        }
    }
</script>
</body>
</html>