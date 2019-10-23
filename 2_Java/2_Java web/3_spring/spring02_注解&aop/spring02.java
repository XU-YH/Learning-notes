使用注解配置spring
	步骤：
		导包4+2+spring-aop
		1.为主配置文件引入新的命名空间(context约束)
			<beans xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xmlns="http://www.springframework.org/schema/beans" 
			xmlns:context="http://www.springframework.org/schema/context" 
			xsi:schemaLocation="http://www.springframework.org/schema/beans 
				http://www.springframework.org/schema/beans/spring-beans-4.2.xsd 
				http://www.springframework.org/schema/context 
				http://www.springframework.org/schema/context/spring-context-4.2.xsd ">
		2.开启使用注解代理配置文件
			<!-- 指定扫描cn.itcast.bean报下的所有类中的注解.
				 注意:扫描包时.会扫描指定报下的所有子孙包
			 -->
			<context:component-scan base-package="cn.itcast.bean"></context:component-scan>
		3.在类中使用注解完成配置
	将对象注册到容器：
		@Component("user")
			@Service("user") // service层
			@Controller("user") // web层
			@Repository("user")// dao层
	修改对象的作用范围：
		//指定对象的作用范围
		@Scope(scopeName="singleton")//prototype
	值类型注入:
		通过反射的Field赋值,破坏了封装性
			@Value("tom")
			private String name;
		通过set方法赋值,推荐使用
			@Value("tom")	
			public void setName(String name) {
				this.name = name;
			}
	引用类型注入：
		//自动装配
		@Autowired 
		//问题:如果匹配多个类型一致的对象.将无法选择具体注入哪一个对象.
		@Qualifier("car2")//使用@Qualifier注解告诉spring容器自动装配哪个名称的对象
		private Car car;
		
		//手动注入,指定注入哪个名称的对象
		@Resource(name="car")
		private Car car;
	初始化|销毁方法：
		@PostConstruct //在对象被创建后调用.init-method
		public void init(){
			System.out.println("我是初始化方法!");
		}
		@PreDestroy //在销毁之前调用.destory-method
		public void destory(){
			System.out.println("我是销毁方法!");
		}

STS插件：
	百度搜索，到官网下载，注意要和电脑上的eclise版本相对应
	
spring与junit整合测试：
	1.导包4+2+aop+test
	2.配置注解
		//帮我们创建容器
		@RunWith(SpringJUnit4ClassRunner.class)
		//指定创建容器时使用哪个配置文件
		@ContextConfiguration("classpath:applicationContext.xml")
		public class Demo {
			//将名为user的对象注入到u变量中
			@Resource(name="user")
			private User u;
	3.测试
		@Test
		public void fun1(){
			
			System.out.println(u);
			
		}

spring中的aop：
	aop思想介绍
	spring中的aop概念
	spring实现aop的原理：
		动态代理(优先)：
			被代理对象必须要实现接口,才能产生代理对象.如果没有接口将不能使用动态代理技术
		cglib代理(没有接口)：
			第三方代理技术,cglib代理.可以对任何类生成代理.代理的原理是对目标对象进行继承代理. 如果目标对象被final修饰.那么该类无法被cglib代理.
	aop名词学习
			
spring中的aop演示：
		步骤(xml配置)：
			1.导包4+2：
				spring的aop包：
					spring-aspects-4.2.4.RELEASE.jar
					spring-aop-4.2.4.RELEASE.jar
				spring需要第三方aop包：
					com.springsource.org.aopalliance-1.0.0.jar
					com.springsource.org.aspectj.weaver-1.6.8.RELEASE.jar
			2.准备目标对象：
				public class UserServiceImpl implements UserService {
					@Override
					public void save() {
						System.out.println("保存用户!");
						//int i = 1/0;
					}
					@Override
					public void delete() {
						System.out.println("删除用户!");
					}
				}
			3.准备通知：
				//通知类
				public class MyAdvice {
					
					//前置通知	
				//		|-目标方法运行之前调用
					//后置通知(如果出现异常不会调用)
				//		|-在目标方法运行之后调用
					//环绕通知
				//		|-在目标方法之前和之后都调用
					//异常拦截通知
				//		|-如果出现异常,就会调用
					//后置通知(无论是否出现 异常都会调用)
				//		|-在目标方法运行之后调用
				//----------------------------------------------------------------
					//前置通知
					public void before(){
						System.out.println("这是前置通知!!");
					}
					//后置通知
					public void afterReturning(){
						System.out.println("这是后置通知(如果出现异常不会调用)!!");
					}
					//环绕通知
					public Object around(ProceedingJoinPoint pjp) throws Throwable {
						System.out.println("这是环绕通知之前的部分!!");
						Object proceed = pjp.proceed();//调用目标方法
						System.out.println("这是环绕通知之后的部分!!");
						return proceed;
					}
					//异常通知
					public void afterException(){
						System.out.println("出事啦!出现异常了!!");
					}
					//后置通知
					public void after(){
						System.out.println("这是后置通知(出现异常也会调用)!!");
					}
				}
			4.配置进行织入,将通知织入目标对象中：
				<!-- 准备工作: 导入aop(约束)命名空间 -->
				<!-- 1.配置目标对象 -->
					<bean name="userService" class="cn.itcast.service.UserServiceImpl" ></bean>
				<!-- 2.配置通知对象 -->
					<bean name="myAdvice" class="cn.itcast.d_springaop.MyAdvice" ></bean>
				<!-- 3.配置将通知织入目标对象 -->
					<aop:config>
						<!-- 配置切入点 
							public void cn.itcast.service.UserServiceImpl.save() 
							void cn.itcast.service.UserServiceImpl.save()
							* cn.itcast.service.UserServiceImpl.save()
							* cn.itcast.service.UserServiceImpl.*()
							
							* cn.itcast.service.*ServiceImpl.*(..)
							* cn.itcast.service..*ServiceImpl.*(..)
						-->
						<aop:pointcut expression="execution(* cn.itcast.service.*ServiceImpl.*(..))" id="pc"/>
						<aop:aspect ref="myAdvice" >
							<!-- 指定名为before方法作为前置通知 -->
							<aop:before method="before" pointcut-ref="pc" />
							<!-- 后置 -->
							<aop:after-returning method="afterReturning" pointcut-ref="pc" />
							<!-- 环绕通知 -->
							<aop:around method="around" pointcut-ref="pc" />
							<!-- 异常拦截通知 -->
							<aop:after-throwing method="afterException" pointcut-ref="pc"/>
							<!-- 后置 -->
							<aop:after method="after" pointcut-ref="pc"/>
						</aop:aspect>
					</aop:config>
		步骤(注解配置)：
			前三步和xml配置相同
			4.配置进行织入,将通知织入目标对象中：
				<!-- 准备工作: 导入aop(约束)命名空间 -->
				<!-- 1.配置目标对象 -->
					<bean name="userService" class="cn.itcast.service.UserServiceImpl" ></bean>
				<!-- 2.配置通知对象 -->
					<bean name="myAdvice" class="cn.itcast.e_annotationaop.MyAdvice" ></bean>
				<!-- 3.开启使用注解完成织入 -->
					<aop:aspectj-autoproxy></aop:aspectj-autoproxy>
			//--------------------------------------------------------------------
			
				//通知类
				@Aspect
				//表示该类是一个通知类
				public class MyAdvice {
					//抽取切点表达式
					@Pointcut("execution(* cn.itcast.service.*ServiceImpl.*(..))")
					public void pc(){}
					//前置通知
					//指定该方法是前置通知,并制定切入点
					@Before("MyAdvice.pc()")
					public void before(){
						System.out.println("这是前置通知!!");
					}
					//后置通知
					@AfterReturning("execution(* cn.itcast.service.*ServiceImpl.*(..))")
					public void afterReturning(){
						System.out.println("这是后置通知(如果出现异常不会调用)!!");
					}
					//环绕通知
					@Around("execution(* cn.itcast.service.*ServiceImpl.*(..))")
					public Object around(ProceedingJoinPoint pjp) throws Throwable {
						System.out.println("这是环绕通知之前的部分!!");
						Object proceed = pjp.proceed();//调用目标方法
						System.out.println("这是环绕通知之后的部分!!");
						return proceed;
					}
					//异常通知
					@AfterThrowing("execution(* cn.itcast.service.*ServiceImpl.*(..))")
					public void afterException(){
						System.out.println("出事啦!出现异常了!!");
					}
					//后置通知
					@After("execution(* cn.itcast.service.*ServiceImpl.*(..))")
					public void after(){
						System.out.println("这是后置通知(出现异常也会调用)!!");
					}