<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.usermanage.dbutil.*, com.usermanage.entity.*, com.usermanage.model.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改用户</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>修改用户</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <%
            // 获取查询参数中的用户ID
            String idParam = request.getParameter("id");
            User user = null;

            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int uid = Integer.parseInt(idParam);
                    Model model = new Model();
                    user = model.getUserById(uid);
                } catch (NumberFormatException e) {
                    // ID格式错误，user为null
                }
            }
        %>

        <% if (idParam == null || idParam.isEmpty()) { %>
            <!-- 第一步：输入用户ID -->
            <div class="form-card">
                <h3>请输入要修改的用户ID</h3>
                <form action="update.jsp" method="post">
                    <div class="form-group">
                        <label for="id">用户ID</label>
                        <input type="number" id="id" name="id" placeholder="请输入用户ID" required min="1">
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">查询用户</button>
                    </div>
                </form>
            </div>
        <% } else if (user != null) { %>
            <!-- 第二步：显示用户信息并允许修改 -->
            <div class="form-card">
                <h3>修改用户信息（ID: <%= user.getId() %>）</h3>
                <form action="updateShow.jsp" method="post">
                    <input type="hidden" name="id" value="<%= user.getId() %>">

                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="email">邮箱</label>
                        <input type="email" id="email" name="email" value="<%= user.getEmail() != null ? user.getEmail() : "" %>">
                    </div>

                    <div class="form-group">
                        <label for="phone">手机号</label>
                        <input type="text" id="phone" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : "" %>">
                    </div>

                    <div class="form-group">
                        <label for="role">角色</label>
                        <select id="role" name="role">
                            <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>普通用户</option>
                            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>管理员</option>
                            <option value="editor" <%= "editor".equals(user.getRole()) ? "selected" : "" %>>编辑</option>
                        </select>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">提交修改</button>
                        <a href="update.jsp" class="btn btn-secondary">重新查询</a>
                    </div>
                </form>
            </div>
        <% } else { %>
            <!-- 未找到用户 -->
            <div class="result-card">
                <div class="result-fail">
                    <div class="result-icon">&#9888;</div>
                    <h2>未找到用户</h2>
                    <p>ID为 <strong><%= idParam %></strong> 的用户不存在，请检查后重试。</p>
                </div>
            </div>
            <div class="page-actions">
                <a href="update.jsp" class="btn btn-primary">重新查询</a>
                <a href="index.jsp" class="btn btn-secondary">返回主页</a>
            </div>
        <% } %>
    </div>
</body>
</html>
