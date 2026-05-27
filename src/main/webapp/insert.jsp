<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加用户</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>添加用户</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <div class="form-card">
            <form action="insertShow.jsp" method="post">
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" id="username" name="username" placeholder="请输入用户名" required>
                </div>

                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" id="password" name="password" placeholder="请输入密码" required>
                </div>

                <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" id="email" name="email" placeholder="请输入邮箱地址">
                </div>

                <div class="form-group">
                    <label for="phone">手机号</label>
                    <input type="text" id="phone" name="phone" placeholder="请输入手机号">
                </div>

                <div class="form-group">
                    <label for="role">角色</label>
                    <select id="role" name="role">
                        <option value="user" selected>普通用户</option>
                        <option value="admin">管理员</option>
                        <option value="editor">编辑</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">提交添加</button>
                    <button type="reset" class="btn btn-secondary">重置</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
