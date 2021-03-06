<%--
  Created by IntelliJ IDEA.
  User: 潮7000
  Date: 2022/5/12
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" href="css/register.css">

    <script src="js/jquery-1.11.2.min.js"></script>


    <script>
        /*
            表单校验：
                1.用户名：单词字符，长度3到20位
                2.密码：单词字符，长度4到20位
                3.email：邮件格式
                4.姓名：非空
                5.手机号：手机号格式
                6.出生日期：非空
                7.验证码：非空
         */

        //校验用户名
        //单词字符，长度4到20位
        /*function checkUsername() {
            //1.获取用户名值
            var username = $("#username").val();
            //2.定义正则
            var reg_username = /^\w{4,20}$/;

            //3.判断，给出提示信息
            var flag = reg_username.test(username);

            return flag;
        }

        //校验密码
        function checkPassword() {
            //1.获取密码值
            var password = $("#password").val();
            //2.定义正则
            var reg_password = /^\w{4,20}$/;

            //3.判断，给出提示信息
            var flag = reg_password.test(password);

            return flag;
        }*/

        //校验邮箱
        /*function checkEmail(){
            //1.获取邮箱
            var email = $("#email").val();
            //2.定义正则		itcast@163.com
            var reg_email = /^\w+@\w+^\w+.\w+$/;

            //3.判断
            var flag = reg_email.test(email);


            return flag;
        }*/

        /*$(function () {
            //当表单提交时，调用所有的校验方法
            $("#registerForm").submit(function(){
                //1.发送数据到服务器
                if(checkUsername() && checkPassword()){
                    //注册成功，跳转成功页面
                    window.location="register";
                }else{
                    //注册失败,给errorMsg添加提示信息
                    alert("校验失败！请检查参数是否合法");
                    window.location="register.jsp";
                }
            })
        })*/


    </script>


</head>
<body>
<!--引入头部-->
<div id="header"></div>
    <!-- 头部 end -->
    <div class="rg_layout">
        <div class="rg_form clearfix">
            <div class="rg_form_left">
                <p>新用户注册</p>
                <p>USER REGISTER</p>
            </div>
            <div class="rg_form_center">
                <div id="errorMsg" style="color:red;text-align: center"></div>
                <!--注册表单-->
                <form id="registerForm" action="/register" method="post">
                    <table style="margin-top: 25px;">
                        <tr>
                            <td class="td_left">
                                <label for="username">用户名</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="username" name="username" placeholder="请输入账号，最少四位">

                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="password">密码</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="password" name="password" placeholder="请输入密码，最少四位">

                            </td>

                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="email">Email</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="email" name="email" placeholder="请输入Email">
                            </td>
                            <td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="name">姓名</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="name" name="name" placeholder="请输入真实姓名">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="telephone">手机号</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="telephone" name="telephone" placeholder="请输入您的手机号">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="sex">性别</label>
                            </td>
                            <td class="td_right gender">
                                <input type="radio" id="sex" name="sex" value="男" checked> 男
                                <input type="radio" name="sex" value="女"> 女
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="birthday">出生日期</label>
                            </td>
                            <td class="td_right">
                                <input type="date" id="birthday" name="birthday" placeholder="年/月/日">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="check">验证码</label>
                            </td>
                            <td class="td_right check">
                                <input type="text" id="check" name="check" class="check">
                                <img src="checkCode" height="32px" alt="" onclick="changeCheckCode(this)">
                                <span id="spanImgId" style="color: red"></span>
                                <script type="text/javascript">
                                    //图片点击事件
                                    function changeCheckCode(img) {
                                        img.src="checkCode?"+new Date().getTime();
                                    }
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                            </td>
                            <td class="td_right check">
                                <input type="submit" class="submit" value="注册">
                                <span id="msg" style="color: red;"></span>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="rg_form_right">
                <p>
                    已有账号？
                    <a href="${pageContext.request.contextPath}/login.jsp">立即登录</a>
                </p>
            </div>
        </div>
    </div>
    <!--引入尾部-->
    <div id="footer"></div>
    <!--导入布局js，共享header和footer-->
    <%--<script type="text/javascript" src="js/include.js"></script>--%>
    <script>
        $(function () {
            $("#check").on("blur",function () {
                $.ajax({
                    url:"myCode",
                    method:"get",
                    data:"myCode="+$("#check").val(),
                    dataType:"text",
                    success:function (result) {
                        $("#spanImgId").html(result);
                    }
                })
            })
        })
    </script>
</body>
</html>
