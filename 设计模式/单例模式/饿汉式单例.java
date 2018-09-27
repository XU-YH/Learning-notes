package com.xuyinhui.test;

/*
 * 饿汉式单例模式
 */
public class Singleton2 {
	private static Singleton2 singletonInstance = new Singleton2();

	private Singleton2() {
	}

	public static Singleton2 getInstance() {
		return singletonInstance;
	}
}
