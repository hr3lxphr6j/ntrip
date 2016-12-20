package com.chigusa.service.impl

import com.chigusa.dao.OrderDao
import com.chigusa.dao.TicketDao
import com.chigusa.dto.NRoute
import com.chigusa.dto.NTicket
import com.chigusa.dto.NUser
import com.chigusa.entity.Order
import com.chigusa.exception.TicketBoughtException
import com.chigusa.service.Dto2Entity
import com.chigusa.service.Entity2Dto
import com.chigusa.service.TicketService
import org.aspectj.weaver.ast.Or
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
open class TicketServiceImpl : TicketService {

    @Autowired
    val ticketDao: TicketDao? = null
    @Autowired
    val orderDao: OrderDao? = null
    @Autowired
    val dto2Entity: Dto2Entity? = null
    @Autowired
    val entity2Dto: Entity2Dto? = null

    override fun queryTickets(nRoute: NRoute): List<NTicket> {
        return ticketDao!!.queryByRoute(
                dto2Entity!!.NRoute2Route(nRoute)).map { entity2Dto!!.Ticket2NTicket(it) }

    }

    @Transactional
    override fun buyTicket(nTicket: NTicket, nUser: NUser) {
        if (ticketDao!!.queryById(nTicket.ticketId).status == 1) {
            throw TicketBoughtException("票已售出")
        }
        try {
            val updateTicket = ticketDao.queryById(nTicket.ticketId)
            updateTicket.status = 1
            ticketDao.updateTicket(updateTicket)
            orderDao!!.addOrder(Order(ticketId = nTicket.ticketId, userId = nUser.userId))
        } catch(e: RuntimeException) {
            throw e
        }


    }

    override fun queryTicket(ticketId: Long): NTicket {
        return entity2Dto!!.Ticket2NTicket(
                ticketDao!!.queryById(ticketId))
    }
}