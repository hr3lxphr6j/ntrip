package com.chigusa.entity

import com.google.gson.Gson
import java.sql.Date
import java.sql.Timestamp


/**
 * 用户实体类
 * Created by chigusa on 16-12-11.
 */
data class User(
        var userId: Long = -1,
        var name: String = "",
        var password: String = "",
        var phoneNumber: String = "",
        var email: String = "",
        var birthday: Date? = null,
        var registerTime: Timestamp? = null
) {
    override fun toString(): String {
        return Gson().toJson(this)
    }
}