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
            var emailExist = false;
            $('#email').blur(function () {
                var email = $(this).val();
                var hint = $('small');
                if (!emailRegExp.test(email)) {
                    hint.text('请输入正确的邮箱地址');
                    hint.show();
                } else {
                    hint.hide();
                    $.ajax({
                        url: '/ajax',
                        type: 'post',
                        data: {action: 'email', email: email},
                        success: function (isEmailExisted) {
                            if (isEmailExisted == 'true') {
                                emailExist = true;
                                hint.html('Email 已经存在，请<a href="">登录</a>');
                                hint.show();
                            } else {
                                emailExist = false;
                                hint.hide();
                            }
                        },
                        beforeSend: function () {
                            console.log('before send...');
                        },
                        complete: function () {
                            console.log('complete...')
                        },
                        error: function (a, b, c) {
                            console.error('a: ' + a);
                            console.error('b: ' + b);
                            console.error('c: ' + c);
                        }
                    });
                }
            });

            $(':submit').click(function () {
                if (emailExist) {
                    alert('邮箱地址已经存在！')
                    $('#email').focus();
                    return;
                }
                var email = $('#email').val();
                var password = $('#password').val();
                $.ajax({
                    url: '/ajax',
                    type: 'post',
                    data: {action: 'register', email: email, password: password},
                    success: function (user) {
                        var emailString = user.split(' ')[0];
                        var passwordString = user.replace(email + ' ', '');
                        $('table').append('<tr><td>' + emailString + '</td><td>' + passwordString + '</td></tr>').slideDown();
                    }
                });
            });
        });
    </script>
</head>
<body>
<input id="email" type="text" placeholder="Email">
<small style="color: #f00; display: none"></small>
<br>
<input id="password" type="password" placeholder="Password"><br>
<input type="submit" value="SIGN UP">
<hr>
<table border="1">
    <tr>
        <th>EMAIL</th>
        <th>PASSWORD</th>
    </tr>
</table>
</body>
</html>
