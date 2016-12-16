package com.chigusa.service.impl

import com.chigusa.dao.UserDao
import com.chigusa.dto.NUser
import com.chigusa.entity.User
import com.chigusa.service.Entity2Dto
import com.chigusa.service.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class UserServiceImpl : UserService {
    @Autowired
    val userDao: UserDao? = null
    @Autowired
    val entity2Dto: Entity2Dto? = null

    override fun login(username: String, password: String): NUser {
        val uid = userDao!!.login(User(name = username, password = password))
        if (uid == -1L) {
            return NUser()
        } else {
            return entity2Dto!!.User2NUser(userDao.queryById(uid))
        }
    }

    override fun register(username: String, password: String): Boolean {
        return userDao!!.addUser(
                User(name = username, password = password)) > 0
    }

    override fun query(id: Long): NUser {
        if (userDao?.queryById(id) == null) {
            return NUser()
        } else {
            return entity2Dto!!.User2NUser(
                    userDao!!.queryById(id))
        }
    }

    override fun update(nUser: NUser): Boolean {
        //TODO
        throw UnsupportedOperationException("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}