package com.chigusa.service

import com.chigusa.dto.NRoute
import com.chigusa.dto.NTicket
import com.chigusa.dto.NUser

/**
 * 票业务接口
 * Created by chigusa on 16-12-14.
 */
interface TicketService {
    /**
     * 根据线路查询
     */
    fun queryTickets(nRoute: NRoute):List<NTicket>

    /**
     * 买票
     */
    fun buyTicket(nTicket: NTicket,nUser: NUser)

    /**
     * 根据ID查询
     */
    fun queryTicket(ticketId:Long):NTicket

}