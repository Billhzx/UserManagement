<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.usermanage.dbutil.*, com.usermanage.entity.*, com.usermanage.model.*, java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>全部用户</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>全部用户列表</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <%
            // 查询所有用户
            Model model = new Model();
            List<User> userList = model.getAllUsers();
        %>

        <div class="table-card">
            <% if (userList != null && !userList.isEmpty()) { %>
                <div class="table-summary">
                    共 <strong><%= userList.size() %></strong> 位用户
                </div>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>邮箱</th>
                            <th>手机号</th>
                            <th>角色</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (User user : userList) { %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getUsername() %></td>
                            <td><%= user.getPassword() %></td>
                            <td><%= user.getEmail() != null ? user.getEmail() : "-" %></td>
                            <td><%= user.getPhone() != null ? user.getPhone() : "-" %></td>
                            <td><span class="role-tag role-<%= user.getRole() %>"><%= user.getRole() %></span></td>
                            <td>
                                <a href="showUser.jsp?id=<%= user.getId() %>" class="btn-sm btn-info">详情</a>
                                <a href="update.jsp?id=<%= user.getId() %>" class="btn-sm btn-edit">修改</a>
                                <a href="dele.jsp" class="btn-sm btn-del" onclick="return prompt('请输入要删除的用户ID: <%= user.getId() %>')">删除</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <div class="empty-state">
                    <div class="empty-icon">&#128196;</div>
                    <h3>暂无用户数据</h3>
                    <p>系统中还没有任何用户记录。</p>
                    <a href="insert.jsp" class="btn btn-primary">添加用户</a>
                </div>
            <% } %>
        </div>

        <div class="page-actions">
            <a href="insert.jsp" class="btn btn-primary">添加用户</a>
            <a href="index.jsp" class="btn btn-secondary">返回主页</a>
        </div>
    </div>
</body>
</html>
