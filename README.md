# 用户综合管理系统

## 项目简介

基于 Java Web (JSP/Servlet) + MySQL 技术栈的用户综合管理系统，实现用户的增删改查操作。

## 技术栈

- **后端**：Java 17 + JSP/Servlet
- **数据库**：MySQL 5.x+（驱动：mysql-connector-java-5.1.5）
- **服务器**：Apache Tomcat 10（使用 jakarta.servlet）
- **前端**：HTML + CSS（蓝色系风格）

## 项目结构

```
experiment5/
├── src/main/java/com/usermanage/
│   ├── dbutil/Dbconn.java          # 数据库连接工具类
│   ├── entity/User.java            # 用户实体类
│   └── model/Model.java            # 查询处理类（增删改查）
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── web.xml                 # 部署描述符
│   │   └── lib/                    # JDBC驱动目录
│   ├── index.jsp                   # 主界面导航页
│   ├── insert.jsp                  # 用户信息插入页面
│   ├── insertShow.jsp              # 插入处理页面
│   ├── update.jsp                  # 用户信息更新页面
│   ├── updateShow.jsp              # 更新处理页面
│   ├── dele.jsp                    # 用户信息删除页面
│   ├── deleShow.jsp                # 删除处理页面
│   ├── showUser.jsp                # 用户信息显示页面
│   ├── allShow.jsp                 # 全部用户显示页面
│   ├── search.jsp                  # 查询用户页面
│   └── css/style.css               # 统一样式
├── sql/user.sql                    # 数据库建表脚本
└── README.md
```

## 数据库配置

- 数据库名：`userdb`
- 表名：`users`
- 连接参数：`jdbc:mysql://localhost:3306/userdb?useSSL=false&characterEncoding=utf8`
- 用户名：`root`
- 密码：`root`

## 部署步骤

1. 执行 `sql/user.sql` 创建数据库和表
2. 将 `mysql-connector-java-5.1.5-bin.jar` 放入 `WEB-INF/lib/` 目录
3. 编译 Java 源文件，将 class 文件放入 `WEB-INF/classes/` 目录
4. 将项目部署到 Tomcat 10 的 webapps 目录
5. 启动 Tomcat，访问 `http://localhost:8080/experiment5/`

## 功能说明

| 功能 | 页面 | 说明 |
|------|------|------|
| 主导航 | index.jsp | 系统主界面，提供各功能入口 |
| 查询用户 | search.jsp → showUser.jsp | 根据用户ID查询详细信息 |
| 全部用户 | allShow.jsp | 表格形式展示所有用户 |
| 添加用户 | insert.jsp → insertShow.jsp | 录入新用户信息 |
| 修改用户 | update.jsp → updateShow.jsp | 修改已有用户信息 |
| 删除用户 | dele.jsp → deleShow.jsp | 删除指定用户记录 |

## 注意事项

1. Tomcat 10 使用 `jakarta.servlet`，JSP 中仍使用标准 Java 包
2. MySQL 驱动类名为 `com.mysql.jdbc.Driver`（5.1.5 版本）
3. 所有 JSP 页面使用 UTF-8 编码
4. 每个操作页面提供"返回主页"链接
