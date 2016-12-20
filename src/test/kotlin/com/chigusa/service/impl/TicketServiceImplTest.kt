package com.chigusa.service.impl

import com.chigusa.service.RouteService
import com.chigusa.service.TicketService
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
 * TicketService集成测试
 */
@RunWith(SpringRunner::class)
@ContextConfiguration("classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml")
@SpringBootTest
class TicketServiceImplTest {

    @Autowired
    val ticketService:TicketService? = null
    @Autowired
    val userService: UserService? = null
    @Autowired
    val routeService: RouteService? = null

    private val logger: Logger = LoggerFactory.getLogger(this.javaClass)
    @Test
    fun queryTickets() {
        logger.info(ticketService!!.queryTickets(routeService!!.queryRoute(1002)).toString())
    }

    @Test
    fun buyTicket() {
        logger.info(ticketService!!.buyTicket(ticketService.queryTicket(1002L),userService!!.query(1000)).toString())

    }

    @Test
    fun queryTicket() {

    }

}