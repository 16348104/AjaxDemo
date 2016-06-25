<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/25
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index page</title>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script>
        var emailRegExp = /^[A-z0-9._-]+@[A-z0-9.-]+\.[A-z]{2,6}$/;
        $(function () {
            $('#email').blur(function() {
                var email = $(this).val();
                if (!emailRegExp.test(email)) {
                    $('small').show();
                } else {
                    $('small').hide();
                    $.ajax({
                        url: '/ajax',
                        type: 'POST'
                    });
                }
            });
        });
    </script>
</head>
<body>
<input id="email" type="text" placeholder="Email">
<small style="color: #f00; display: none">请输入正确的邮箱地址</small>
</body>
</html>
