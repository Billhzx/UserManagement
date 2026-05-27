<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.usermanage.dbutil.*, com.usermanage.entity.*, com.usermanage.model.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户详情</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>用户详细信息</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <%
            // 获取用户ID参数
            String idParam = request.getParameter("id");
            User user = null;

            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int uid = Integer.parseInt(idParam);
                    Model model = new Model();
                    user = model.getUserById(uid);
                } catch (NumberFormatException e) {
                    // ID格式错误
                }
            }
        %>

        <% if (user != null) { %>
            <div class="result-card">
                <div class="result-success">
                    <h2>用户信息</h2>
                </div>
                <table class="info-table">
                    <tr><th>用户ID</th><td><%= user.getId() %></td></tr>
                    <tr><th>用户名</th><td><%= user.getUsername() %></td></tr>
                    <tr><th>密码</th><td><%= user.getPassword() %></td></tr>
                    <tr><th>邮箱</th><td><%= user.getEmail() != null ? user.getEmail() : "未填写" %></td></tr>
                    <tr><th>手机号</th><td><%= user.getPhone() != null ? user.getPhone() : "未填写" %></td></tr>
                    <tr><th>角色</th><td><%= user.getRole() %></td></tr>
                </table>
            </div>
        <% } else { %>
            <div class="result-card">
                <div class="result-fail">
                    <div class="result-icon">&#9888;</div>
                    <h2>未找到用户</h2>
                    <p>未找到ID为 <strong><%= idParam != null ? idParam : "" %></strong> 的用户，请检查后重试。</p>
                </div>
            </div>
        <% } %>

        <div class="page-actions">
            <a href="search.jsp" class="btn btn-primary">继续查询</a>
            <a href="index.jsp" class="btn btn-secondary">返回主页</a>
        </div>
    </div>
</body>
</html>
