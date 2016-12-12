package com.chigusa.dao

import com.chigusa.entity.Order
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration
import org.springframework.test.context.junit4.SpringRunner

/**
 * OrderDao单元测试
 * Created by chigusa on 16-12-12.
 */

@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
@SpringBootTest
class OrderDaoTest {
    @Autowired
    private val userDao: UserDao? = null
    @Autowired
    val ticketDao: TicketDao? = null
    @Autowired
    val orderDao: OrderDao? = null

    @Test
    fun addOrderTest() {
        println("增加情况"+orderDao?.addOrder(Order(ticketId = 1000,userId = 1000)))
    }

    @Test
    fun queryByIdTest() {
        println(orderDao?.queryById(1000))
    }

    @Test
    fun queryByUserTest() {
        println(orderDao?.queryByUser(userDao!!.queryById(1000)))
    }

    @Test
    fun delOrderTest() {
        println("删除情况"+orderDao?.delOrder(orderDao.queryById(1000)))
    }

}