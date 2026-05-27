<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.usermanage.dbutil.*, com.usermanage.entity.*, com.usermanage.model.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改结果</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>修改用户结果</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <%
            // 设置请求编码
            request.setCharacterEncoding("UTF-8");

            // 获取表单参数
            String idStr = request.getParameter("id");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");

            // 设置默认值
            if (email == null) email = "";
            if (phone == null) phone = "";
            if (role == null || role.isEmpty()) role = "user";

            int result = 0;

            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int uid = Integer.parseInt(idStr);

                    // 创建用户对象
                    User user = new User();
                    user.setId(uid);
                    user.setUsername(username);
                    user.setPassword(password);
                    user.setEmail(email);
                    user.setPhone(phone);
                    user.setRole(role);

                    // 执行更新操作
                    Model model = new Model();
                    result = model.updateUser(user);
                } catch (NumberFormatException e) {
                    // ID格式错误
                }
            }
        %>

        <div class="result-card">
            <% if (result > 0) { %>
                <div class="result-success">
                    <div class="result-icon">&#10004;</div>
                    <h2>修改成功！</h2>
                    <p>用户ID <strong><%= idStr %></strong> 的信息已成功更新。</p>
                </div>
                <table class="info-table">
                    <tr><th>用户ID</th><td><%= idStr %></td></tr>
                    <tr><th>用户名</th><td><%= username %></td></tr>
                    <tr><th>邮箱</th><td><%= email %></td></tr>
                    <tr><th>手机号</th><td><%= phone %></td></tr>
                    <tr><th>角色</th><td><%= role %></td></tr>
                </table>
            <% } else { %>
                <div class="result-fail">
                    <div class="result-icon">&#10008;</div>
                    <h2>修改失败！</h2>
                    <p>未能成功修改用户信息，请检查用户ID是否存在后重试。</p>
                </div>
            <% } %>
        </div>

        <div class="page-actions">
            <a href="update.jsp" class="btn btn-primary">继续修改</a>
            <a href="index.jsp" class="btn btn-secondary">返回主页</a>
        </div>
    </div>
</body>
</html>
