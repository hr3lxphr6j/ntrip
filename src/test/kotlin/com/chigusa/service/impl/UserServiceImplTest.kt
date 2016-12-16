package com.chigusa.service.impl

import com.chigusa.service.UserService
import org.junit.Test

import org.junit.Assert.*
import org.junit.runner.RunWith
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration
import org.springframework.test.context.junit4.SpringRunner

/**
 * Created by chigusa on 16-12-15.
 */
@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml")
@SpringBootTest
class UserServiceImplTest {
    @Autowired
    val userService: UserService? = null
    private val logger: Logger = LoggerFactory.getLogger(this.javaClass)
    @Test
    fun login() {
        logger.info(userService?.login("hr3lxphr6j", "8681700").toString())
    }

    @Test
    fun register() {
        logger.info(userService?.register("c02110210610204","8681700").toString())
    }

    @Test
    fun query() {
        logger.info(userService?.query(1000).toString())
    }

    @Test
    fun update() {

    }

}