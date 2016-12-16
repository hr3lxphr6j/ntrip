package com.chigusa.service

import com.chigusa.dao.CityDao
import com.chigusa.dao.RouteDao
import com.chigusa.dao.TicketDao
import com.chigusa.dao.UserDao
import com.chigusa.dto.*
import com.chigusa.entity.*
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

/**
 * 数据库实体转业务层实体
 * 智障产物。。。
 * Created by chigusa on 16-12-14.
 */
@Service
class Entity2Dto {
    @Autowired
    val cityDao: CityDao? = null
    @Autowired
    val ticketDao: TicketDao? = null
    @Autowired
    val routeDao: RouteDao? = null
    @Autowired
    val userDao: UserDao? = null

    fun City2NCity(city: City): NCity {
        return NCity(
                cityId = city.cityId,
                name = city.name
        )
    }

    fun Order2NOrder(order: Order): NOrder {
        return NOrder(
                orderId = order.orderId,
                ticket = Ticket2NTicket(ticketDao!!.queryById(order.ticketId)),
                user = User2NUser(userDao!!.queryById(order.userId)),
                time = order.time
        )
    }

    fun Route2NRoute(route: Route): NRoute {
        return NRoute(
                routeId = route.routeId,
                name = route.name,
                startCity = City2NCity(cityDao!!.queryById(route.startCityId)),
                endCity = City2NCity(cityDao.queryById(route.endCityId)),
                startTime = route.startTime,
                endTime = route.endTime,
                status = route.status
        )
    }

    fun Ticket2NTicket(ticket: Ticket): NTicket {
        return NTicket(
                ticketId = ticket.ticketId,
                route = Route2NRoute(routeDao!!.queryById(ticket.routeId)),
                price = ticket.price,
                seat = ticket.seat,
                status = ticket.status
        )
    }

    fun User2NUser(user: User): NUser {
        return NUser(
                userId = user.userId,
                name = user.name,
                password = user.password,
                phoneNumber = user.phoneNumber,
                email = user.email,
                birthday = user.birthday
        )
    }
}