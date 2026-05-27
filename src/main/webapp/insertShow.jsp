<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.usermanage.dbutil.*, com.usermanage.entity.*, com.usermanage.model.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加结果</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>添加用户结果</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <%
            // 设置请求编码
            request.setCharacterEncoding("UTF-8");

            // 获取表单参数
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");

            // 设置默认值
            if (email == null) email = "";
            if (phone == null) phone = "";
            if (role == null || role.isEmpty()) role = "user";

            // 创建用户对象
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setPhone(phone);
            user.setRole(role);

            // 执行插入操作
            Model model = new Model();
            int result = model.insertUser(user);
        %>

        <div class="result-card">
            <% if (result > 0) { %>
                <div class="result-success">
                    <div class="result-icon">&#10004;</div>
                    <h2>添加成功！</h2>
                    <p>用户 <strong><%= username %></strong> 已成功添加到系统。</p>
                </div>
                <table class="info-table">
                    <tr><th>用户名</th><td><%= username %></td></tr>
                    <tr><th>邮箱</th><td><%= email %></td></tr>
                    <tr><th>手机号</th><td><%= phone %></td></tr>
                    <tr><th>角色</th><td><%= role %></td></tr>
                </table>
            <% } else { %>
                <div class="result-fail">
                    <div class="result-icon">&#10008;</div>
                    <h2>添加失败！</h2>
                    <p>未能成功添加用户，请检查输入信息后重试。</p>
                </div>
            <% } %>
        </div>

        <div class="page-actions">
            <a href="insert.jsp" class="btn btn-primary">继续添加</a>
            <a href="index.jsp" class="btn btn-secondary">返回主页</a>
        </div>
    </div>
</body>
</html>
