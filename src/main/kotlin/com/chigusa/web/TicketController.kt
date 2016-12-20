package com.chigusa.web

import com.chigusa.dto.NTicket
import com.chigusa.service.RouteService
import com.chigusa.service.TicketService
import com.chigusa.service.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

/**
 * 票相关
 */
@Controller
@RequestMapping(value = "/ticket")
class TicketController {
    @Autowired
    val routeService: RouteService? = null
    @Autowired
    val ticketService: TicketService? = null
    @Autowired
    val userService: UserService? = null

    @RequestMapping(value = "main")
    fun tickerHome(model: Model): String {
        val routes = routeService!!.queryRoutes("")
        model.addAttribute("routes", routes)
        return "ticket"
    }

    @ResponseBody
    @RequestMapping(value = "{id}/list")
    fun listTickets(@PathVariable(value = "id") routeId: Long): List<NTicket> {
        val tickets = ticketService!!.queryTickets(routeService!!.queryRoute(routeId))
        return tickets
    }

    @ResponseBody
    @RequestMapping(value = "{id}/buy")
    fun buyTicket(@PathVariable(value = "id") ticketId: Long, @RequestParam userId: Long): Boolean {
        try {
            ticketService!!.buyTicket(ticketService.queryTicket(ticketId),userService!!.query(userId))
        } catch(e: RuntimeException) {
            return false
        }
        return true
    }
}