package com.zy.main;

import com.zy.proxy.ProxyFactory;
import com.zy.proxy.ProxyFactory2;
import com.zy.service.IUserService;
import com.zy.service.UserService;

public class Demo05 {
	
	public static void main(String[] args) {
		//1.����ʹ�þۺ�ʵ�֣�
		IUserService service = new UserService();
		ProxyFactory factory = new ProxyFactory(service);
		IUserService serviceProxy = factory.getProxy();
		
		serviceProxy.insert();
		
		//�������ͷ���  û�м̳й�ϵ
		System.out.println(serviceProxy instanceof UserService );//false
		
		//==============================================
		
		//2.���� ��ʹ�ü̳�ʵ�֣�
		ProxyFactory2 factory2 = new ProxyFactory2();
		IUserService serviceProxy2 = factory2.getProxy();
		serviceProxy2.insert();
		
		//����������ʵ����  �м̳й�ϵ
		System.out.println(serviceProxy2 instanceof UserService );//true
	}

}
