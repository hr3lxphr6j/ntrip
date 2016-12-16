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
 * 业务层实体转数据库实体
 * 智障产物。。。
 * Created by chigusa on 16-12-14.
 */
@Service
class Dto2Entity {
    @Autowired
    val cityDao: CityDao? = null
    @Autowired
    val ticketDao: TicketDao? = null
    @Autowired
    val routeDao: RouteDao? = null
    @Autowired
    val userDao: UserDao? = null

    fun NCity2City(nCity: NCity):City{
        return City(
                cityId = nCity.cityId,
                name = nCity.name
        )
    }
    fun NOrder2Order(nOrder: NOrder):Order{
        return Order(
                orderId = nOrder.orderId,
                ticketId = nOrder.ticket!!.ticketId,
                userId = nOrder.user!!.userId,
                time = nOrder.time
        )
    }
    fun NRoute2Route(nRoute: NRoute): Route {
        return Route(
                routeId = nRoute.routeId,
                name = nRoute.name,
                startCityId = nRoute.startCity!!.cityId,
                endCityId = nRoute.endCity!!.cityId,
                startTime = nRoute.startTime,
                endTime = nRoute.endTime,
                status = nRoute.status
        )
    }
    fun NTicket2Ticket(nTicket: NTicket):Ticket{
        return Ticket(
                ticketId = nTicket.ticketId,
                routeId = nTicket.route!!.routeId,
                price = nTicket.price,
                seat = nTicket.seat,
                status = nTicket.status
        )
    }
    fun NUser2User(nUser: NUser):User{
        return User(
                userId = nUser.userId,
                name = nUser.name,
                password = nUser.password,
                phoneNumber = nUser.phoneNumber,
                email = nUser.email,
                birthday = nUser.birthday
        )
    }
}