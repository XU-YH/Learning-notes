package com.xuyinhui.test;

/*
 * 懒汉式单例模式
 */
public class Singleton1 {
	private static Singleton1 singletonInstance;

	private Singleton1() {
	}

	public static Singleton1 getInstance() {
		if (singletonInstance == null) {
			synchronized (Singleton1.class) {
				if (singletonInstance == null) {
					singletonInstance = new Singleton1();
				}
			}
		}
		return singletonInstance;
	}
}
