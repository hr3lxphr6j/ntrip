package com.chigusa.dao

import com.chigusa.entity.User
import org.junit.Test
import org.junit.runner.RunWith
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration
import org.springframework.test.context.junit4.SpringRunner

/**
 * UserDao单元测试
 */
@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
@SpringBootTest

class UserDaoTest {
    private val logger: Logger = LoggerFactory.getLogger(this.javaClass)
    @Autowired
    private val userDao: UserDao? = null

    @Test
    fun addUserTest() {
        println("插入情况："+userDao?.addUser(User(name = "BootTest", password = "12456")))
    }

    @Test
    fun loginTest() {
        val user = User(name = "hr3lxphr6j", password = "8681700")
        println("UserID=" + userDao?.login(user).toString())
    }

    @Test
    fun queryByIdTest() {
            logger.info(userDao?.queryById(1).toString())

    }

    @Test
    fun updateTest() {
        val user = userDao?.queryById(1000L)
        user!!.email = "243313634@qq.com"
        println("修改结果" + userDao?.update(user))
    }
}