package com.chigusa.web

import com.chigusa.dto.NUser
import com.chigusa.service.OrderService
import com.chigusa.service.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.*
import javax.servlet.http.HttpSession

/**
 *
 * Created by chigusa on 16-12-15.
 */
@Controller
@RequestMapping("/user")
@SessionAttributes(value = "user", types = arrayOf(NUser::class))
class UserController {
    @Autowired
    val userService: UserService? = null
    @Autowired
    val orderService: OrderService? = null

    @RequestMapping("/home")
    fun home(model: Model,session:HttpSession): String {
        model.addAttribute("orders",orderService!!.queryOrders(session.getAttribute("user") as NUser))
        return "user"
    }

    @PostMapping("/login")
    fun login(@RequestParam username: String,
              @RequestParam password: String,
              model: Model
    ): String {
        val user = userService!!.login(username, password)
        model.addAttribute("user", user)
        return "redirect:/"
    }

    @GetMapping("/logout")
    fun logout(model: Model): String {
        model.addAttribute("user", NUser())
        return "redirect:/"
    }

    @PostMapping("/register")
    fun register(@RequestParam username: String,
                 @RequestParam password: String): String {
        userService!!.register(username, password)
        return "redirect:/"
    }

    @ResponseBody
    @GetMapping("{uid}/info")
    fun info(@PathVariable uid: Long): NUser {
        return userService!!.query(uid)
    }
}