1:����(���)
	(1)��ļ��ؼ��������
	(2)���䣺
		ͨ���ֽ����ļ�����ȥʹ�ó�Ա���������췽������Ա����
		���ַ�ʽ��ȡ�ֽ����ļ�����
			Person p = new Person();
			Class c = p.getClass();

			Class c2 = Person.class;

			Class c4 = Class.forName("cn.itcast_01.Person");//�����ļ�
	(3)�����ʹ��
		A:ͨ�������ȡ���췽����ʹ��
			//��ȡ���й��췽��
			// Constructor[] cons = c.getDeclaredConstructors();
			// ��ȡ���ι��췽������
			// public Constructor<T> getConstructor(Class<?>... parameterTypes)
			// ������ʾ���ǣ���Ҫ��ȡ�Ĺ��췽���Ĺ�������������������͵�class�ֽ����ļ�����
			Constructor con = c.getDeclaredConstructor(String.class, int.class,String.class);
	
			con.setAccessible(true);// ֵΪtrue��ָʾ����Ķ�����ʹ��ʱӦ��ȡ��Java���Է��ʼ�顣

			// ͨ�����ι��췽�����󴴽�����
			// public T newInstance(Object... initargs)
			Object obj = con.newInstance("����ϼ", 27, "����");

		B:ͨ�������ȡ��Ա������ʹ��
			// ��ȡ���еĳ�Ա����
			// Field[] fields = c.getFields();
			Constructor con = c.getConstructor();
			Object obj = con.newInstance();
			// ��ȡname�����丳ֵ
			Field nameField = c.getDeclaredField("name");
			nameField.setAccessible(true);
			nameField.set(obj, "����ϼ");

		C:ͨ�������ȡ��Ա������ʹ��
			// public Method getMethod(String name,Class<?>... parameterTypes)
			// ��һ��������ʾ�ķ��������ڶ���������ʾ���Ƿ����Ĳ�����class����
			Constructor con = c.getConstructor();
			Object obj = con.newInstance();
			Method m3 = c.getDeclaredMethod("getString", String.class, int.class);
			m3.setAccessible(true);
			Object objString = m3.invoke(obj, "hello", 100);
		Declared��ȡ˽��
			
	(4)���䰸��
		A:ͨ���������������ļ�������
		B:ͨ������Խ�����ͼ��
		C:ͨ������������һ���������������Ը�ֵΪָ����ֵ
	(5)��̬����
		// ����Ҫ����һ����̬�������
		// Proxy������һ���������Դ�����̬�������
		// public static Object newProxyInstance(ClassLoader loader,Class<?>[] interfaces,InvocationHandler h)
		// InvocationHandler h����̬������
		// ��׼����ud������һ���������
		UserDao ud = new UserDaoImpl();
		//MyInvocationHandler��ʵ��InvocationHandler�ӿ�
		MyInvocationHandler handler = new MyInvocationHandler(ud);
		UserDao proxy = (UserDao) Proxy.newProxyInstance(ud.getClass()
				.getClassLoader(), ud.getClass().getInterfaces(), handler);
		proxy.add();
	
2:���ģʽ
	(1)װ�����ģʽ
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		Scanner sc = new Scanner(System.in);
	(2)ģ�����ģʽ
		public abstract class GetTime{
			public long getTime(){
				long start = System.currentTimeMillis();
				code();
				long end = System.currenTimeMillis();
				return end - start;
			}
			public abstract code();
		}//�̳иó����࣬��дcode����
		
3:JDK������
	(1)JDK5(����)
		װ��Ͳ���
		����
		��ǿfor
		��̬����
		�ɱ����
		ö��
	(2)JDK6(�˽�)
	(3)JDK7(���)
		�����Ƶı�����ʽ
			int x = 0b100101;
		��_�ָ�����
		switch���������ַ���
		�����ƶ�(���η���)
			ArrayList<String> array = new ArrayList<>();
		��catch��ʹ��
		�Զ��ͷ���Դ���÷�
	(4)JDK8(�˽�)
		����ȥ�����˽�����