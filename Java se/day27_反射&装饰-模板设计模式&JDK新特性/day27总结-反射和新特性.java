1:反射(理解)
	(1)类的加载及类加载器
	(2)反射：
		通过字节码文件对象，去使用成员变量，构造方法，成员方法
		三种方式获取字节码文件对象：
			Person p = new Person();
			Class c = p.getClass();

			Class c2 = Person.class;

			Class c4 = Class.forName("cn.itcast_01.Person");//配置文件
	(3)反射的使用
		A:通过反射获取构造方法并使用
			//获取所有构造方法
			// Constructor[] cons = c.getDeclaredConstructors();
			// 获取带参构造方法对象
			// public Constructor<T> getConstructor(Class<?>... parameterTypes)
			// 参数表示的是：你要获取的构造方法的构造参数个数及数据类型的class字节码文件对象
			Constructor con = c.getDeclaredConstructor(String.class, int.class,String.class);
	
			con.setAccessible(true);// 值为true则指示反射的对象在使用时应该取消Java语言访问检查。

			// 通过带参构造方法对象创建对象
			// public T newInstance(Object... initargs)
			Object obj = con.newInstance("林青霞", 27, "北京");

		B:通过反射获取成员变量并使用
			// 获取所有的成员变量
			// Field[] fields = c.getFields();
			Constructor con = c.getConstructor();
			Object obj = con.newInstance();
			// 获取name并对其赋值
			Field nameField = c.getDeclaredField("name");
			nameField.setAccessible(true);
			nameField.set(obj, "林青霞");

		C:通过反射获取成员方法并使用
			// public Method getMethod(String name,Class<?>... parameterTypes)
			// 第一个参数表示的方法名，第二个参数表示的是方法的参数的class类型
			Constructor con = c.getConstructor();
			Object obj = con.newInstance();
			Method m3 = c.getDeclaredMethod("getString", String.class, int.class);
			m3.setAccessible(true);
			Object objString = m3.invoke(obj, "hello", 100);
		Declared获取私有
			
	(4)反射案例
		A:通过反射运行配置文件的内容
		B:通过反射越过泛型检查
		C:通过反射给任意的一个对象的任意的属性赋值为指定的值
	(5)动态代理
		// 我们要创建一个动态代理对象
		// Proxy类中有一个方法可以创建动态代理对象
		// public static Object newProxyInstance(ClassLoader loader,Class<?>[] interfaces,InvocationHandler h)
		// InvocationHandler h，动态处理器
		// 我准备对ud对象做一个代理对象
		UserDao ud = new UserDaoImpl();
		//MyInvocationHandler类实现InvocationHandler接口
		MyInvocationHandler handler = new MyInvocationHandler(ud);
		UserDao proxy = (UserDao) Proxy.newProxyInstance(ud.getClass()
				.getClassLoader(), ud.getClass().getInterfaces(), handler);
		proxy.add();
	
2:设计模式
	(1)装饰设计模式
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		Scanner sc = new Scanner(System.in);
	(2)模版设计模式
		public abstract class GetTime{
			public long getTime(){
				long start = System.currentTimeMillis();
				code();
				long end = System.currenTimeMillis();
				return end - start;
			}
			public abstract code();
		}//继承该抽象类，重写code方法
		
3:JDK新特性
	(1)JDK5(掌握)
		装箱和拆箱
		泛型
		增强for
		静态导入
		可变参数
		枚举
	(2)JDK6(了解)
	(3)JDK7(理解)
		二进制的表现形式
			int x = 0b100101;
		用_分隔数据
		switch语句可是用字符串
		泛型推断(菱形泛型)
			ArrayList<String> array = new ArrayList<>();
		多catch的使用
		自动释放资源的用法
	(4)JDK8(了解)
		可以去网上了解资料