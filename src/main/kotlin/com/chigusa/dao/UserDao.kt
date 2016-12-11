package com.chigusa.dao

import com.chigusa.entity.User

/**
 * 用户Dao接口
 * Created by chigusa on 16-12-11.
 */
interface UserDao {
    /**
     * 增加用户
     */
    fun addUser(user: User): Int

    /**
     * 用户登录，根据用户名和密码进行验证
     */
    fun login(user: User): Long

    /**
     * 根据ID查询用户
     */
    fun queryById(userId: Long): User

    /**
     * 更新用户信息
     */
    fun update(user: User): Int
}