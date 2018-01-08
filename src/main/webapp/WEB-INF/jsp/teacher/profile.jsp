<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 顶栏 -->
<jsp:include page="top.jsp"></jsp:include>
<!-- 中间主体 -->
<div class="container" id="content">
    <div class="row">
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 style="text-align: center;">个人信息</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form name="reset" class="form-horizontal" role="form" action="/teacher/profile_update"
                          id="editfrom"
                          method="post" onsubmit="return check()">
                        <div class="form-group">
                            <label for="userID" class="col-sm-2 control-label">用户ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userID" id="userID"
                                       value="${teacher.userid}" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userName" id="userName"
                                       placeholder="请输入姓名" value="${teacher.username}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="sex" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="sex" id="sex"
                                       placeholder="请输入性别" value="${teacher.sex}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="birthYear" class="col-sm-2 control-label">出生日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="birthYear" id="birthYear"
                                       placeholder="请输入出生日期" value="${teacher.birthyear}" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="degree" class="col-sm-2 control-label">学历</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="degree" id="degree"
                                       placeholder="请输入学历" value="${teacher.degree}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">职称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title" id="title"
                                       placeholder="请输入职称" value="${teacher.title}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="grade" class="col-sm-2 control-label">入职时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="grade" id="grade"
                                       placeholder="请输入入职时间" value="${teacher.grade}" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="collegeID" class="col-sm-2 control-label">所属学院代码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="collegeID" id="collegeID"
                                       placeholder="请输入所属学院代码" value="${teacher.collegeid}">
                            </div>
                        </div>

                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-default" type="submit">提交</button>
                            <button class="btn btn-default" type="reset">重置</button>
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>
<div class="container" id="footer">
    <div class="row">
        <div class="col-md-12"></div>
    </div>
</div>
</body>
<script>
    $("#nav li:nth-child(3)").addClass("active")

    function check() {
        if (reset.oldPassword.value == "" || reset.oldPassword.value == null) {
            alert("请输入旧账户密码");
            return false;
        }
        if (reset.password1.value == "" || reset.password1.value == null) {
            alert("请输入重置密码");
            return false;
        }
        if (reset.password2.value == "" || reset.password2.value == null) {
            alert("请输入再次输入密码");
            return false;
        }
        if (reset.password1.value != reset.password2.value) {
            alert("两次密码不正确");
            return false;
        }
    }
</script>
</html>