<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查询用户</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>查询用户</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <div class="form-card">
            <h3>根据用户ID查询</h3>
            <form action="showUser.jsp" method="get">
                <div class="form-group">
                    <label for="id">用户ID</label>
                    <input type="number" id="id" name="id" placeholder="请输入要查询的用户ID" required min="1">
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">查询</button>
                    <button type="reset" class="btn btn-secondary">重置</button>
                </div>
            </form>
        </div>

        <div class="quick-links">
            <p>或者：</p>
            <a href="allShow.jsp" class="btn btn-secondary">查看全部用户列表</a>
        </div>
    </div>
</body>
</html>
