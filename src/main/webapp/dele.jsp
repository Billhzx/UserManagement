<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>删除用户</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="page-container">
        <div class="page-header">
            <h1>删除用户</h1>
            <a href="index.jsp" class="btn-back">返回主页</a>
        </div>

        <div class="form-card">
            <div class="warning-banner">
                &#9888; 请谨慎操作，删除后数据将无法恢复！
            </div>
            <h3>请输入要删除的用户ID</h3>
            <form action="deleShow.jsp" method="post">
                <div class="form-group">
                    <label for="id">用户ID</label>
                    <input type="number" id="id" name="id" placeholder="请输入要删除的用户ID" required min="1">
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-danger" onclick="return confirm('确认要删除该用户吗？此操作不可撤销！')">确认删除</button>
                    <a href="index.jsp" class="btn btn-secondary">取消</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
