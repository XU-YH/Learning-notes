package com.zy.main;

import com.zy.proxy.ProxyFactory;
import com.zy.proxy.ProxyFactory2;
import com.zy.service.IUserService;
import com.zy.service.UserService;

public class Demo05 {
	
	public static void main(String[] args) {
		//1.代理（使用聚合实现）
		IUserService service = new UserService();
		ProxyFactory factory = new ProxyFactory(service);
		IUserService serviceProxy = factory.getProxy();
		
		serviceProxy.insert();
		
		//服务代理和服务  没有继承关系
		System.out.println(serviceProxy instanceof UserService );//false
		
		//==============================================
		
		//2.代理 （使用继承实现）
		ProxyFactory2 factory2 = new ProxyFactory2();
		IUserService serviceProxy2 = factory2.getProxy();
		serviceProxy2.insert();
		
		//服务代理和真实服务  有继承关系
		System.out.println(serviceProxy2 instanceof UserService );//true
	}

}
