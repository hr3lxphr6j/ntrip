package com.chigusa.dao

import com.chigusa.entity.Ticket
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration
import org.springframework.test.context.junit4.SpringRunner

/**
 * TicketDao单元测试
 * Created by chigusa on 16-12-12.
 */

@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
@SpringBootTest

class TicketDaoTest {
    @Autowired
    val ticketDao: TicketDao? = null
    @Autowired
    val routeDao: RouteDao? = null

    @Test
    fun addTicketTest() {
        println("增加情况"+ticketDao?.addTicket(Ticket(routeId = 1002,price = 550.0,seat = 11)))
    }

    @Test
    fun queryByIdTest() {
        println(ticketDao?.queryById(1000))
    }

    @Test
    fun queryByRouteTest() {
        val tickets = ticketDao?.queryByRoute(routeDao!!.queryById(1002))
        for (ticket in tickets!!){
            println(ticket)
        }
    }

    @Test
    fun updateTicketTest() {
        val ticket = ticketDao?.queryById(1000)
        ticket?.status = 1
        println("更新情况"+ticketDao?.updateTicket(ticket!!))
    }
}