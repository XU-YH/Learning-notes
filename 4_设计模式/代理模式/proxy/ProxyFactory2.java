package com.zy.proxy;

import java.lang.reflect.Method;
import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import com.zy.service.IUserService;
import com.zy.service.UserService;

/*
*	spring,cglib,继承
*/

public class ProxyFactory2 implements MethodInterceptor {

	public IUserService getProxy() {//获取静态代理

		Enhancer en = new Enhancer();
		en.setSuperclass(UserService.class);//设置  父类
		en.setCallback(this);//设置 回调对象

		IUserService serviceProxy = (IUserService) en.create();//创建  服务代理
		return serviceProxy;
	}

	//回调方法
	@Override
	public Object intercept(Object service, Method method, Object[] arg, MethodProxy methodProxy)
			throws Throwable {
		
		System.out.println("----1.预处理");
		Object invokeSuper = methodProxy.invokeSuper(service, arg);
		System.out.println("----2.后处理");

		return invokeSuper;
	}

}
