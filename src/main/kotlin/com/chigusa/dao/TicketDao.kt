package com.chigusa.dao

import com.chigusa.entity.Route
import com.chigusa.entity.Ticket

/**
 * 票Dao
 * Created by chigusa on 16-12-12.
 */
interface TicketDao {
    /**
     * 增加票
     */
    fun addTicket(ticket: Ticket):Int

    /**
     * 通过ID查询票信息
     */
    fun queryById(ticketId: Long):Ticket

    /**
     * 通过线路查询票信息集合
     */
    fun queryByRoute(route: Route):List<Ticket>

    /**
     * 更新票信息
     */
    fun updateTicket(ticket: Ticket):Int
}