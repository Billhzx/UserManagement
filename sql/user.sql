-- ============================================================
-- 用户综合管理系统 - 数据库建表脚本
-- 数据库：userdb
-- ============================================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS userdb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 使用数据库
USE userdb;

-- 创建用户表
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(50) NOT NULL COMMENT '密码',
  `email` VARCHAR(100) COMMENT '邮箱',
  `phone` VARCHAR(20) COMMENT '手机号',
  `role` VARCHAR(20) DEFAULT 'user' COMMENT '角色'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- 插入测试数据
INSERT INTO `users` (`username`, `password`, `email`, `phone`, `role`) VALUES
  ('admin', 'admin123', 'admin@example.com', '13800000001', 'admin'),
  ('zhangsan', 'zhang123', 'zhangsan@example.com', '13800000002', 'user'),
  ('lisi', 'li123456', 'lisi@example.com', '13800000003', 'user'),
  ('wangwu', 'wang1234', 'wangwu@example.com', '13800000004', 'editor'),
  ('zhaoliu', 'zhao5678', 'zhaoliu@example.com', '13800000005', 'user');
