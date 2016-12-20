package com.chigusa.service.impl

import com.chigusa.service.OrderService
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
 * OrderService集成测试
 */
@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml")
@SpringBootTest
class OrderServiceImplTest {
    @Autowired
    val userService: UserService? = null
    @Autowired
    val orderService: OrderService? = null
    private val logger: Logger = LoggerFactory.getLogger(this.javaClass)
    @Test
    fun queryOrders() {
        logger.info(orderService!!.queryOrders(userService!!.query(1000)).toString())
    }

}