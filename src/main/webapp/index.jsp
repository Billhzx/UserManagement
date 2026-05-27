<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户综合管理系统</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="index-body">
    <div class="index-container">
        <div class="index-header">
            <h1>用户综合管理系统</h1>
            <p class="subtitle">User Management System</p>
        </div>

        <div class="card-grid">
            <a href="search.jsp" class="nav-card card-search">
                <div class="card-icon">&#128269;</div>
                <div class="card-title">查询用户</div>
                <div class="card-desc">根据用户ID查询用户详细信息</div>
            </a>

            <a href="allShow.jsp" class="nav-card card-list">
                <div class="card-icon">&#128203;</div>
                <div class="card-title">显示全部用户</div>
                <div class="card-desc">查看系统中所有用户列表</div>
            </a>

            <a href="insert.jsp" class="nav-card card-add">
                <div class="card-icon">&#10133;</div>
                <div class="card-title">添加用户</div>
                <div class="card-desc">录入新的用户信息到系统</div>
            </a>

            <a href="update.jsp" class="nav-card card-edit">
                <div class="card-icon">&#9998;</div>
                <div class="card-title">修改用户</div>
                <div class="card-desc">修改已有用户的信息</div>
            </a>

            <a href="dele.jsp" class="nav-card card-delete">
                <div class="card-icon">&#128465;</div>
                <div class="card-title">删除用户</div>
                <div class="card-desc">从系统中移除用户记录</div>
            </a>
        </div>

        <div class="index-footer">
            <p>面向对象软件案例分析与开发 &mdash; 实验五</p>
        </div>
    </div>
</body>
</html>
