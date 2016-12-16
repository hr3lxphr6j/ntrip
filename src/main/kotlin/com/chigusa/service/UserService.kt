package com.chigusa.service

import com.chigusa.dto.NUser

/**
 * 用户业务接口
 * Created by chigusa on 16-12-14.
 */
interface UserService {
    /**
     * 用户登录接口
     */
    fun login(username:String,password:String):NUser

    /**
     * 用户注册接口
     */
    fun register(username:String,password:String):Boolean

    /**
     * 用户信息查询接口
     */
    fun query(id:Long):NUser

    /**
     * 用户信息更新
     */
    fun update(nUser: NUser):Boolean
}