spring整合JDBC:
	spring提供了很多模板整合Dao技术
	spring中提供了一个可以操作数据库的对象.对象封装了jdbc技术.
		JDBCTemplate => JDBC模板对象
		与DBUtils中的QueryRunner非常相似.
		//0 准备连接池
		ComboPooledDataSource dataSource = new ComboPooledDataSource();
		dataSource.setDriverClass("com.mysql.jdbc.Driver");
		dataSource.setJdbcUrl("jdbc:mysql:///hibernate_32");
		dataSource.setUser("root");
		dataSource.setPassword("1234");
		//1 创建JDBC模板对象
		JdbcTemplate jt = new JdbcTemplate();
		jt.setDataSource(dataSource);
		//2 书写sql,并执行
		String sql = "insert into t_user values(null,'rose') ";
		jt.update(sql);
	步骤:
		导包:
			4+2;
			spring-test
			spring-aop
			junit4类库;
			c3p0连接池
			JDBC驱动;
			spring-jdbc
			spring-tx事务;
		准备数据库
		书写Dao:
			@Override
			public void save(User u) {
				String sql = "insert into t_user values(null,?) ";
				super.getJdbcTemplate().update(sql, u.getName());
			}
			public List<User> getAll() {
				String sql = "select * from t_user  ";
				List<User> list = super.getJdbcTemplate().query(sql, new RowMapper<User>(){
					@Override
					public User mapRow(ResultSet rs, int arg1) throws SQLException {
						User u = new User();
						u.setId(rs.getInt("id"));
						u.setName(rs.getString("name"));
						return u;
					}});
				return list;
			}
		spring配置:
			<!-- 指定spring读取db.properties配置 -->
			<context:property-placeholder location="classpath:db.properties"  />
			<!-- 1.将连接池放入spring容器 -->
			<bean name="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource" >
				<property name="jdbcUrl" value="${jdbc.jdbcUrl}" ></property>
				<property name="driverClass" value="${jdbc.driverClass}" ></property>
				<property name="user" value="${jdbc.user}" ></property>
				<property name="password" value="${jdbc.password}" ></property>
			</bean>


			<!-- 2.将JDBCTemplate放入spring容器 -->
			<bean name="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate" >
				<property name="dataSource" ref="dataSource" ></property>
			</bean>

			<!-- 3.将UserDao放入spring容器 -->
			<bean name="userDao" class="cn.itcast.a_jdbctemplate.UserDaoImpl" >
				<property name="jt" ref="jdbcTemplate" ></property>				
			</bean>
		测试：
			//演示JDBC模板
			@RunWith(SpringJUnit4ClassRunner.class)
			@ContextConfiguration("classpath:applicationContext.xml")
			public class Demo {
					@Resource(name="userDao")
				private UserDao ud;
				@Test
				public void fun2() throws Exception{
					User u = new User();
					u.setName("tom");
					ud.save(u);
				}
			}
		进阶内容：
			JDBCDaoSupport：
				public class UserDaoImpl extends JdbcDaoSupport implements UserDao {}
				
				<!-- 3.将UserDao放入spring容器 -->
				<bean name="userDao" class="cn.itcast.a_jdbctemplate.UserDaoImpl" >
					<!-- <property name="jt" ref="jdbcTemplate" ></property> -->
					<property name="datoSource" ref="datoSource" ></property>
				</bean>
			读取外部的Properties配置：
				<!-- 指定spring读取db.properties配置 -->
				<context:property-placeholder location="classpath:db.properties"  />
				<!-- 1.将连接池放入spring容器 -->
				<bean name="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource" >
					<property name="jdbcUrl" value="${jdbc.jdbcUrl}" ></property>
					<property name="driverClass" value="${jdbc.driverClass}" ></property>
					<property name="user" value="${jdbc.user}" ></property>
					<property name="password" value="${jdbc.password}" ></property>
				</bean>

spring中aop事务：
	spring封装了事务管理代码：
		事务操作：打开事务，提交事务，回滚事务
		事务操作对象：
			因为在不同平台,操作事务的代码各不相同.spring提供了一个接口
			 PlatformTransactionManager 接口：
				DataSourceTransactionManager(jdbc)
				注意:在spring中玩事务管理.最为核心的对象就是TransactionManager对象
			spring管理事务的属性介绍:
				事务的隔离级别
					1 读未提交
					2 读已提交
					4 可重复读
					8 串行化
				是否只读
					true 只读
					false 可操作
				事务的传播行为：看图 --- 默认PROPAGATION_REQUIRED：如果service1没有开启事务，service1去调用service2，默认开启事务
	spring管理事务方式：
		xml配置(aop)：
			1.导包：
				aop
				aspect
				aop联盟
				weaving织入包
			2.导入新的约束(tx)：看图
				beans: 最基本
				context:读取properties配置
				aop:配置aop
				tx:配置事务通知
				
				<!-- 指定spring读取db.properties配置 -->
				<context:property-placeholder location="classpath:db.properties"  />

				<!-- 事务核心管理器,封装了所有事务操作. 依赖于连接池 -->
				<bean name="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager" >
					<property name="dataSource" ref="dataSource" ></property>
				</bean>
				
			3.配置通知
				<!-- 配置事务通知 -->
				<tx:advice id="txAdvice" transaction-manager="transactionManager" >
					<tx:attributes>
						<!-- 以方法为单位,指定方法应用什么事务属性
							isolation:隔离级别
							propagation:传播行为
							read-only:是否只读
						 -->
						<tx:method name="save*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
						<tx:method name="persist*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
						<tx:method name="update*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
						<tx:method name="modify*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
						<tx:method name="delete*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
						<tx:method name="remove*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
						<tx:method name="get*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="true" />
						<tx:method name="find*" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="true" />
						<tx:method name="transfer" isolation="REPEATABLE_READ" propagation="REQUIRED" read-only="false" />
					</tx:attributes>
				</tx:advice>
			4.配置将通知织入目标
				<!-- 配置织入 -->
				<aop:config  >
					<!-- 配置切点表达式 -->
					<aop:pointcut expression="execution(* cn.itcast.service.*ServiceImpl.*(..))" id="txPc"/>
					<!-- 配置切面 : 通知+切点
							advice-ref:通知的名称
							pointcut-ref:切点的名称
					 -->
					<aop:advisor advice-ref="txAdvice" pointcut-ref="txPc" />
				</aop:config>
		注解配置(aop)：
			1.导包：
			2.导入新的约束(tx)：与上面一样
			3.开启注解管理事务：
				<!-- 开启使用注解管理aop事务 -->
				<tx:annotation-driven/>
			4.使用注解：
				写在类名上，表示所有的方法采用该注解
				@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=true)
				public class AccountServiceImpl implements AccountService {
				
				写在方法上
				@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
				public void transfer(final Integer from,final Integer to,final Double money) {