package com.zy.proxy;

import java.lang.reflect.Method;
import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import com.zy.service.IUserService;
import com.zy.service.UserService;

/*
*	spring,cglib,�̳�
*/

public class ProxyFactory2 implements MethodInterceptor {

	public IUserService getProxy() {//��ȡ��̬����

		Enhancer en = new Enhancer();
		en.setSuperclass(UserService.class);//����  ����
		en.setCallback(this);//���� �ص�����

		IUserService serviceProxy = (IUserService) en.create();//����  �������
		return serviceProxy;
	}

	//�ص�����
	@Override
	public Object intercept(Object service, Method method, Object[] arg, MethodProxy methodProxy)
			throws Throwable {
		
		System.out.println("----1.Ԥ����");
		Object invokeSuper = methodProxy.invokeSuper(service, arg);
		System.out.println("----2.����");

		return invokeSuper;
	}

}
