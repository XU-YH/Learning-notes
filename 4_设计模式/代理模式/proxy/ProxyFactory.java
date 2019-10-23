package com.zy.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import com.zy.service.IUserService;
import com.zy.service.UserService;

/*
*	jdk,Proxy,聚合
*/

public class ProxyFactory implements InvocationHandler {

	private IUserService service;
	
	public ProxyFactory(IUserService service) {
		this.service = service;
	}

	public IUserService getProxy() {// 获取动态代理
		
		IUserService serviceProxy = (IUserService) Proxy.newProxyInstance(
				UserService.class.getClassLoader(),
				UserService.class.getInterfaces(), this);
		
		return serviceProxy;
	}

	//回调方法
	@Override
	public Object invoke(Object arg0, Method method, Object[] arg2) throws Throwable {
		System.out.println("----1.预处理");
		Object invoke = method.invoke(service, arg2);
		System.out.println("----2.后处理");
		return invoke;
	}

}
