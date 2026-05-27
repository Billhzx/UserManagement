<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.usermanage.dbutil.*, com.usermanage.entity.*, com.usermanage.model.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>删除结果</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>删除用户结果</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <%
            // 设置请求编码
            request.setCharacterEncoding("UTF-8");

            // 获取表单参数
            String idStr = request.getParameter("id");
            int result = 0;
            User deletedUser = null;

            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int uid = Integer.parseInt(idStr);

                    // 先查询用户信息（用于显示）
                    Model model = new Model();
                    deletedUser = model.getUserById(uid);

                    // 执行删除操作
                    result = model.deleteUser(uid);
                } catch (NumberFormatException e) {
                    // ID格式错误
                }
            }
        %>

        <div class="result-card">
            <% if (result > 0) { %>
                <div class="result-success">
                    <div class="result-icon">&#10004;</div>
                    <h2>删除成功！</h2>
                    <p>用户ID <strong><%= idStr %></strong> 已从系统中移除。</p>
                </div>
                <% if (deletedUser != null) { %>
                <div class="deleted-info">
                    <h4>已删除的用户信息：</h4>
                    <table class="info-table">
                        <tr><th>用户ID</th><td><%= deletedUser.getId() %></td></tr>
                        <tr><th>用户名</th><td><%= deletedUser.getUsername() %></td></tr>
                        <tr><th>邮箱</th><td><%= deletedUser.getEmail() %></td></tr>
                        <tr><th>手机号</th><td><%= deletedUser.getPhone() %></td></tr>
                        <tr><th>角色</th><td><%= deletedUser.getRole() %></td></tr>
                    </table>
                </div>
                <% } %>
            <% } else { %>
                <div class="result-fail">
                    <div class="result-icon">&#10008;</div>
                    <h2>删除失败！</h2>
                    <p>未能成功删除用户，用户ID <strong><%= idStr %></strong> 可能不存在，请检查后重试。</p>
                </div>
            <% } %>
        </div>

        <div class="page-actions">
            <a href="dele.jsp" class="btn btn-danger">继续删除</a>
            <a href="index.jsp" class="btn btn-secondary">返回主页</a>
        </div>
    </div>
</body>
</html>
