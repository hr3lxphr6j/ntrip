package com.chigusa.web

import com.chigusa.dto.NUser
import com.chigusa.service.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.*
import javax.servlet.http.HttpServletRequest
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

    @PostMapping("/login")
    fun login(@RequestParam username: String,
              @RequestParam password: String,
              model:Model
              ): String {
        val user =  userService!!.login(username, password)
        model.addAttribute("user",user)
        return "redirect:/"
    }

    @GetMapping("/logout")
    fun logout(model:Model):String{
        model.addAttribute("user",NUser())
        return "redirect:/"
    }

    @ResponseBody
    @PostMapping("/register")
    fun register(@RequestParam username: String,
                 @RequestParam password: String): Boolean {
        return userService!!.register(username, password)
    }

    @ResponseBody
    @GetMapping("{uid}/info")
    fun info(@PathVariable uid: Long): NUser {
        return userService!!.query(uid)
    }
}