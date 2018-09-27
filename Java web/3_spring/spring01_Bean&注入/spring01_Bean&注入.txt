spring介绍：
	spring一站式框架：
		1.正是因为spring框架性质是属于容器性质的.
		2.容器中装什么对象就有什么功能.所以可以一站式.
		3.不仅不排斥其他框架,还能帮其他框架管理对象.
		4.aop支持
		5.ioc思想
		6.spring jdbc
		7.aop 事务
		8.junit 测试支持
	
spring搭建：
	1.导包：
		四个spring核心包，一个日志包，一个可选的log4j包
	2.创建一个对象：
		User类{}
	3.书写配置注册对象到容器：
		位置任意(建议放到src下)，配置文件名任意(建议applicationContext.xml)
		导入约束：
			<?xml version="1.0" encoding="UTF-8"?>
			<beans xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns="http://www.springframework.org/schema/beans" 
					xsi:schemaLocation="http://www.springframework.org/schema/beans 
					http://www.springframework.org/schema/beans/spring-beans-4.2.xsd ">
			</beans>
			
		<!-- 将User对象交给spring容器管理 -->
		<bean  name="user" class="cn.itcast.bean.User" ></bean>
	4.代码测试
		public void fun1(){		
			//1 创建容器对象
			ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
			//2 向容器"要"user对象
			User u = (User) ac.getBean("user");
			//3 打印user对象
			System.out.println(u);		
		}

spring概念：
	思想：
		IOC：Inverse of Control 反转控制
			将我们创建对象的方式反转了，以前对象的创建是由开发人员自己维护，
			包括依赖关系也是自己注入，使用spring后，对象的创建以及依赖关系可以由spring完成创建以及注入，
			反转控制就是反转对象的创建方式，从我们自己创建反转给程序(spring)。
		DI：Dependecy Injection 依赖注入
			实现IOC思想需要DI做支持
			注入方式：
				set方法注入
				构造方法注入
				字段注入
			注入类型：
				值类型注入---8大基本数据类型
				引用类型注入---依赖对象注入
	applicationContext&BeanFactory:
		BeanFactory接口：
			spring原始接口.针对原始接口的实现类功能较为单一
			BeanFactory接口实现类的容器.特点是每次在获得对象时才会创建对象
		ApplicationContext：
			每次容器启动时就会创建容器中配置的所有对象.并提供更多功能
			丛类路径下加载配置文件:ClassPathXmlApplicationContext
			从硬盘绝对路径下加载配置文件:FileSystemXmlApplicationContext("d:/xxx/yyy/xxx")
		结论:web开发中,使用applicationContext. 在资源匮乏的环境可以使用BeanFactory.
		
spring配置详解：
	Bean元素：
		<!-- 将User对象交给spring容器管理 -->
		<!-- Bean元素:使用该元素描述需要spring容器管理的对象
				class属性:被管理对象的完整类名.
				name属性:给被管理的对象起个名字.获得对象时根据该名称获得对象.  
						可以重复.可以使用特殊字符.
				id属性: 与name属性一模一样. 
						名称不可重复.不能使用特殊字符.
				结论: 尽量使用name属性.
		  -->
		<bean  name="user" class="cn.itcast.bean.User" ></bean>
	Bean元素进阶：
		scope属性：
			singleton(默认值):单例对象，创建容器是会立即创建单例对象，被标识为单例的对象在spring容器中只会存在一个实例
			prototype:多例原型.被标识为多例的对象,创建容器不会立即创建对象，每次再获得才会创建.每次创建都是新的对象.整合struts2时,ActionBean必须配置为多例的.
			request(了解):web环境下.对象与request生命周期一致.
			session(了解):web环境下,对象与session生命周期一致.
		生命周期属性：
			init-method：配置一个方法作为生命周期初始化方法.spring会在对象创建之后立即调用.
			destory-method：配置一个方法作为生命周期的销毁方法.spring容器在关闭并销毁所有容器中的对象之前调用.
			<bean  name="user" class="cn.itcast.bean.User"
				init-method="init" destroy-method="destory" ></bean>
	spring创建对象的方式：
		1.空参构造方式：
			<!-- 创建方式1:空参构造创建  -->
			<bean  name="user" class="cn.itcast.bean.User"></bean>
		2.静态工厂(了解):
			public static User createUser(){		
				System.out.println("静态工厂创建User");				
				return new User();				
			}
			
			<!-- 创建方式2:静态工厂创建 
			  调用UserFactory的createUser方法创建名为user2的对象.放入容器
			 -->
			<bean  name="user2" 
				class="cn.itcast.b_create.UserFactory" 
				factory-method="createUser" ></bean>
		3.实例工厂(了解)：
			public  User createUser2(){				
				System.out.println("实例工厂创建User");				
				return new User();				
			}
			
			<!-- 创建方式3:实例工厂创建 
				 调用UserFactory对象的createUser2方法创建名为user3的对象.放入容器
			 -->
			<bean  name="user3" 
				factory-bean="userFactory"
				factory-method="createUser2" ></bean>
				
			<bean  name="userFactory" 
				class="cn.itcast.b_create.UserFactory"   ></bean>
	spring的分模块配置：
		<!-- 导入其他spring配置文件 -->
		<import resource="cn/itcast/b_create/applicationContext.xml"/>
	
spring属性注入：
	User和Car两个javaBean类
	注入方式：
		1.set方法注入：
			<bean  name="user" class="cn.itcast.bean.User" >
				<!--值类型注入: 为User对象中名为name的属性注入tom作为值 -->
				<property name="name" value="tom" ></property>
				<property name="age"  value="18" ></property>
				<!-- 引用类型注入: 为car属性注入下方配置的car对象 -->
				<property name="car"  ref="car" ></property>
			</bean>
			
			<!-- 将car对象配置到容器中 -->
			<bean name="car" class="cn.itcast.bean.Car" >
				<property name="name" value="兰博基尼" ></property>
				<property name="color" value="黄色" ></property>
			</bean>
		2.构造函数注入：
			<bean name="user2" class="cn.itcast.bean.User" >
				<!-- name属性: 构造函数的参数名 -->
				<!-- index属性: 构造函数的参数索引 -->
				<!-- type属性: 构造函数的参数类型-->
				<constructor-arg name="name" index="0" type="java.lang.Integer" value="999"  ></constructor-arg>
				<constructor-arg name="car" ref="car" index="1" ></constructor-arg>
			</bean>
		3.p名称空间注入(了解)
		4.spel注入(了解)
	复杂类型注入：
		CollectionBean类javaBean类：
			private Object[] arr;//数组类型注入
			private List list;//list/set 类型注入
			private Map map;//map类型注入
			private Properties prop;//properties类型注入
			set()和get()方法
			
		<bean name="cb" class="cn.itcast.c_injection.CollectionBean" >
			
		数组：			
			<!-- 如果数组中只准备注入一个值(对象),直接使用value|ref即可 
			<property name="arr" value="tom" ></property>
			-->
			<!-- array注入,多个元素注入 -->
			<property name="arr">
				<array>
					<value>tom</value>
					<value>jerry</value>
					<ref bean="user4" />
				</array>
			</property>
		List：	
			<!-- 如果List中只准备注入一个值(对象),直接使用value|ref即可 
			<property name="list" value="jack" ></property>-->
			<property name="list"  >
				<list>
					<value>jack</value>
					<value>rose</value>
					<ref bean="user3" />
				</list>
			</property>
		Map：
			<property name="map"  >
				<map>
					<entry key="url" value="jdbc:mysql:///crm" ></entry>
					<entry key="user" value-ref="user4"  ></entry>
					<entry key-ref="user3" value-ref="user2"  ></entry>
				</map> 
			</property>
		Properties:
			<property name="prop"  >
				<props>
					<prop key="driverClass">com.jdbc.mysql.Driver</prop>
					<prop key="userName">root</prop>
					<prop key="password">1234</prop>
				</props>
			</property>
		</bean>

在WEB环境中使用Spring容器：
	1.导包：spring-web-4.2.4.RELEASE.jar
	2.配置文件：web.xml
		 <!-- 可以让spring容器随项目的启动而创建,随项目的关闭而销毁,自动将spring容器添加到servletContext域中 -->
		<listener>
			<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
		</listener>
		<!-- 指定加载spring配置文件的位置 -->
		<context-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>classpath:applicationContext.xml</param-value>
		</context-param>
		
	3.在Action：
	//获得spring容器=>从Application域获得即可
		
	//1 获得servletContext域对象
	ServletContext sc = ServletActionContext.getServletContext();
	//2.从Sc中获得ac容器
	WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
	//3.从容器中获得CustomerService
	CustomerService cs = (CustomerService) ac.getBean("customerService");
		
		
		
		
		