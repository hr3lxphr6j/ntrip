package com.chigusa.dto

import java.sql.Date

/**
 * User业务层实体
 * Created by chigusa on 16-12-14.
 */
data class NUser(
        var userId: Long = -1, // 用户ID
        var name: String = "", //用户名
        var password: String = "", //密码
        var phoneNumber: String = "", //电话号码
        var email: String = "", //电子邮件
        var birthday: Date? = null //生日
)