package com.chigusa;

import com.chigusa.dao.UserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
@SpringBootTest

public class NtripApplicationTests {
	@Autowired
	private UserDao userDao;
	@Test
	public void contextLoads() {
		System.out.println(userDao.queryById(1001));
	}

}
