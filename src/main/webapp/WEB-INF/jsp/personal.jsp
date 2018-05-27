<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>personal</title>
    <link rel="stylesheet" href="../../assets/css/person.css">
</head>
<body>
      <div class="main">

              <div class="content">
                  <section class="green-area">
                   <div class="biaoti">
                       <h1>${user.username}</h1>
                       <h4>${user.nickname}</h4>
                       <div class="hr"></div>
                       <form action="" method="post">
                           <div>备注：${user.information}</div>
                           <div>密码: ${user.password</div>
                           <div>当前积分为:${user.upointer}</div>
                           <button>修改</button>
                       </form>
                     <div class="tubiao">
                         <span class="item">item</span>
                         <span class="item">item</span>
                         <span class="item">item</span>
                     </div>
                   </div>
                  </section>
      <footer>
          <ul class="share">
              <li><img src="image/符号.jpg"></li>
              <li><img src="image/点赞.png"></li>
              <li><img src="image/美元.jpg"></li>
              <li><img src="image/股票.jpg"></li>
              <li><img src="image/锁链.jpg"></li>
              <li><img src="image/领带.jpg"></li>
          </ul>
          <div class="last" align="center">
              &copy tsy-2017
          </div>
      </footer><!--页脚-->

      </div>
</body>
</html>