package com.itheima.mybatis.junit;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itheima.mybatis.mapper.UserMapper;
import com.itheima.mybatis.pojo.User;

public class JunitTest {

	
	@Test
	public void testMapper() throws Exception {
		// 读取spring的applicationContext.xml配置文件
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		// 3.Mapper动态代理开发   扫描 --- 得到mapper
		UserMapper mapper = ac.getBean(UserMapper.class);
		
		// 2.Mapper动态代理开发
		// UserMapper mapper = (UserMapper) ac.getBean("userMapper");
		
		User user = mapper.findUserById(10);
		System.out.println(user);
	}
}
