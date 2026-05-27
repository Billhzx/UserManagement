package com.usermanage.model;

import com.usermanage.dbutil.Dbconn;
import com.usermanage.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * 查询处理类
 * 实现用户信息的增删改查操作
 */
public class Model {

    /**
     * 插入用户
     *
     * @param user 用户实体对象
     * @return int 影响的行数，大于0表示成功
     */
    public int insertUser(User user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            conn = Dbconn.getConnection();
            String sql = "INSERT INTO users (username, password, email, phone, role) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getRole());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dbconn.close(conn, pstmt);
        }
        return result;
    }

    /**
     * 删除用户
     *
     * @param id 用户ID
     * @return int 影响的行数，大于0表示成功
     */
    public int deleteUser(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            conn = Dbconn.getConnection();
            String sql = "DELETE FROM users WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dbconn.close(conn, pstmt);
        }
        return result;
    }

    /**
     * 更新用户
     *
     * @param user 用户实体对象（必须包含id）
     * @return int 影响的行数，大于0表示成功
     */
    public int updateUser(User user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            conn = Dbconn.getConnection();
            String sql = "UPDATE users SET username = ?, password = ?, email = ?, phone = ?, role = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getRole());
            pstmt.setInt(6, user.getId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dbconn.close(conn, pstmt);
        }
        return result;
    }

    /**
     * 按ID查询用户
     *
     * @param id 用户ID
     * @return User 用户实体对象，未找到返回null
     */
    public User getUserById(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;
        try {
            conn = Dbconn.getConnection();
            String sql = "SELECT * FROM users WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dbconn.close(conn, pstmt, rs);
        }
        return user;
    }

    /**
     * 查询所有用户
     *
     * @return List<User> 用户列表
     */
    public List<User> getAllUsers() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();
        try {
            conn = Dbconn.getConnection();
            String sql = "SELECT * FROM users ORDER BY id";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dbconn.close(conn, pstmt, rs);
        }
        return userList;
    }
}
