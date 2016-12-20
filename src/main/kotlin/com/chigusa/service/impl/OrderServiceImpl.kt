package com.chigusa.service.impl

import com.chigusa.dao.OrderDao
import com.chigusa.dto.NOrder
import com.chigusa.dto.NUser
import com.chigusa.service.Dto2Entity
import com.chigusa.service.Entity2Dto
import com.chigusa.service.OrderService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class OrderServiceImpl : OrderService {

    @Autowired
    val orderDao:OrderDao? = null
    @Autowired
    val entity2Dto:Entity2Dto? = null
    @Autowired
    val dto2Entity:Dto2Entity? = null

    override fun queryOrders(nUser: NUser): List<NOrder> {
        return orderDao!!.queryByUser(dto2Entity!!.NUser2User(nUser)).map { entity2Dto!!.Order2NOrder(it) }
    }
}